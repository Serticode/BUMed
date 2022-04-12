import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayo_med/authenticate/auth.dart';
import 'package:shayo_med/authenticate/firebase.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/screens/landing_page/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization.then((value) => Get.put(AuthController()));

  runApp(const BUMed());
}

class BUMed extends StatelessWidget {
  const BUMed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(), // <== add here
      theme: ThemeData(
          backgroundColor: Constants.primaryColour, fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}

//! SCROLL BEHAVIOUR CLASS, ACCEPTING ONLY TWO TYPES OF SCROLL DEVICES;
//! MOUSE AND TOUCH.
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
