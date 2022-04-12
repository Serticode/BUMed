import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shayo_med/authenticate/firebase.dart';
import 'package:shayo_med/screens/diagnosis/diagnosis.dart';
import 'package:shayo_med/screens/landing_page/landing_page.dart';

class AuthController extends GetxController {
  //!CONTROLLER INSTANCE
  static AuthController instance = Get.find();
  Rx<User?>? firebaseUser;
  RxBool isLoggedIn = false.obs;

  @override
  void onReady() {
    super.onReady();

    //!INSTANTIATE FIREBASE USER
    firebaseUser = Rx<User?>(auth.currentUser);

    //!BIND FIREBASE USER TO USER CHANGES.
    firebaseUser!.bindStream(auth.userChanges());

    //!SET EVENT TRIGGER CALLED EVER ...
    //!EVERY TIME A CHANGE IS MADE DUE TO THE EVENT LISTENER, RUN A CALL BACK FUNCTION
    ever(firebaseUser!, setUpInitialScreen);
  }

  //!SHOW INITIAL SCREEN
  //!IF THERE IS NO USER, SHOW SIGN IN ELSE SHOW DASHBOARD
  static setUpInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LandingPage());
    } else {
      Get.offAll(() => const LandingPage());
      Get.snackbar("Account Found!",
          "The account with email: ${auth.currentUser!.email}, is logged in!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //! CREATE A STAFF ACCOUNT
  static getXSignUp(
      {required String email,
      required String password,
      required String fullName,
      required String age,
      required String contact,
      required String weight,
      required String ethnicity}) async {
    try {
      //! CREATE USER ACCOUNT
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        ///! ADD THE USER FIRESTORE DOCUMENTS AS PROVIDED
        (UserCredential result) {
          String? theCreatedUserEmail = result.user!.email;
          _addUserDataToFirestore(
              theCreatedUserEmail: theCreatedUserEmail,
              fullName: fullName,
              email: email,
              contact: contact,
              age: age,
              weight: weight,
              ethnicity: ethnicity);
        },
      ).whenComplete(() => Get.snackbar("Account Created",
              "Your account has been created with email: $email",
              snackPosition: SnackPosition.BOTTOM));
    }
    //! FIREBASE AUTH EXCEPTION
    on FirebaseAuthException catch (e) {
      //! WEAK PASSWORD?
      if (e.code == "weak-password") {
        Get.snackbar("Weak password", e.code);
      }
      //! EMAIL ALREADY IN USE?
      else if (e.code == "email-already-in-use") {
        Get.snackbar("Account Exists!", e.code);
      }
    }
    //! OTHER EXCEPTIONS
    catch (e) {
      Get.snackbar(
        "Create account failed!",
        "Failed to create staff account, kindly try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //! ADD USER DATA TO FIRESTORE
  static _addUserDataToFirestore(
          {required String? theCreatedUserEmail,
          required String? fullName,
          required String? age,
          required String? email,
          required String? contact,
          required String? weight,
          required String ethnicity}) =>
      firebaseFirestore.collection("User Data").doc(theCreatedUserEmail).set({
        "fullName": fullName,
        "age": age,
        "email": email,
        "contact": contact,
        "weight": weight,
        "ethnicity": ethnicity
      });

  //! SIGN IN
  static void getXSignIn({
    required String userEmail,
    required String userPassword,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: userEmail, password: userPassword)
          .whenComplete(() => Get.snackbar(
                "Signed In!",
                "Your account with email: $userEmail has been signed in",
                snackPosition: SnackPosition.BOTTOM,
              ));
    }
    //! EXCEPTIONS
    catch (e) {
      Get.snackbar(
        "Sign in failed!",
        "Staff sign in failed, kindly try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //! SIGN OUT
  static void getXSignOut() => auth.signOut().then(
        //! SHOW NOTIFYING SNACK BAR
        (value) => Get.snackbar(
          "Log Out!",
          "User has been logged out",
          snackPosition: SnackPosition.BOTTOM,
        ),
      );
}
