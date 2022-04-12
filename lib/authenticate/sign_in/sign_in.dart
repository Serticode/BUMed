import 'package:flutter/material.dart';
import 'package:shayo_med/authenticate/sign_up/sign_up.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/screens/landing_page/landing_page.dart';
import 'package:shayo_med/views/desktop/welcome_widget.dart';
import 'package:shayo_med/widgets/shayo_text_widget.dart';

class SignIn extends StatefulWidget {
  final double theScreenWidth;
  const SignIn({Key? key, required this.theScreenWidth}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //!KEY, AUTH & TEXT CONTROLLERS
  final _formKey = GlobalKey<FormState>();
  final _theStaffEmailController = TextEditingController();
  final _theStaffPasswordController = TextEditingController();

  final InputDecoration _theTextFieldDecorator = InputDecoration(
    contentPadding: const EdgeInsets.all(32.0),
    label: const ShayoMedTextWidget(
      theContent: "Email Address ",
      fontColour: Color(0xFF474644),
      fontSize: 18.0,
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: Color(0xFF474644),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: Constants.mainColour,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.red.shade900,
      ),
    ),
  );

  final TextStyle _bodyTextStyle = const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.05,
      fontSize: 36.0,
      fontFamily: "Poppins");

  @override
  void dispose() {
    //!DISPOSE ALL TEXT FIELD CONTROLLERS
    _theStaffEmailController.dispose();
    _theStaffPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: widget.theScreenWidth < 600
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0)
              : const EdgeInsets.symmetric(horizontal: 60.0, vertical: 60.0),
          child: Stack(children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: Constants.mainColour,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Constants.mainColour, width: 2.0),
                ),
                child: Row(
                  children: <Widget>[
                    //! IMAGE
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(21.0),
                      child: Image(
                          image: AssetImage("images/homepage_image2.png")),
                    )),

                    //! FORM
                    Expanded(
                        child: Container(
                      color: Constants.primaryColour,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 30.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //! IMAGE
                            CircleAvatar(
                              radius: 60.0,
                              backgroundColor:
                                  const Color(0XFFC4C4C4).withOpacity(0.8),
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 55.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("images/logo.png"),
                                ),
                              ),
                            ),

                            //! GREETING
                            Text(
                              "Hello Again!",
                              style: _bodyTextStyle,
                              textAlign: TextAlign.center,
                            ),

                            //! DO YOU THINK
                            Text(
                              "Lets get your health checked real quick!",
                              textAlign: TextAlign.center,
                              style: _bodyTextStyle.copyWith(
                                  fontSize: 21, color: Colors.black38),
                            ),

                            //! TEXT FIELDS
                            TextFormField(
                              controller: _theStaffEmailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: _theTextFieldDecorator,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your e-mail address";
                                } else if (value.contains("@") == false) {
                                  return "This is not a valid e-mail address";
                                } else {
                                  return null;
                                }
                              },
                            ),

                            //!PASSWORD
                            TextFormField(
                              controller: _theStaffPasswordController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              obscuringCharacter: "*",
                              decoration: _theTextFieldDecorator.copyWith(
                                label: const ShayoMedTextWidget(
                                  theContent: "Password ",
                                  fontColour: Color(0xFF474644),
                                  fontSize: 18.0,
                                ),
                              ),
                              validator: (value) {
                                //!TODO ... ENSURE VERIFICATION FOR USER PASSWORD.
                                if (value == null || value.isEmpty) {
                                  return "Enter a password";
                                } else if (value.length < 6) {
                                  return "Password must be at least 6 characters long";
                                } else {
                                  return null;
                                }
                              },
                            ),

                            //! LOG IN BUTTON
                            //!SUBMIT BUTTON
                            SizedBox(
                              width: widget.theScreenWidth < 1080
                                  ? widget.theScreenWidth * 0.3
                                  : widget.theScreenWidth * 0.5,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      //!FETCH CONTENT OF TEXT FORM FIELDS
                                      String _enteredEmail =
                                          _theStaffEmailController.text;
                                      String _enteredPassword =
                                          _theStaffPasswordController.text;
                                    }

                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LandingPage()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(20.0),
                                    primary: Constants.mainColour,
                                  ),
                                  child: ShayoMedTextWidget(
                                    theContent: "Login ",
                                    fontColour: Constants.primaryColour,
                                    fontSize:
                                        widget.theScreenWidth < 1080 ? 16 : 24,
                                  )),
                            ),

                            //! DO NOT HAVE AN ACCOUNT
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: <Widget>[
                                const ShayoMedTextWidget(
                                  theContent: "Don't have an account?",
                                  fontColour: Color(0xFF474644),
                                  fontSize: 18.0,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                InkWell(
                                  onTap: (() => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: ((context) => SignUp(
                                                theScreenWidth:
                                                    widget.theScreenWidth,
                                              ))))),
                                  child: const ShayoMedTextWidget(
                                    theContent: "Sign up",
                                    fontColour: Constants.mainColour,
                                    fontSize: 18.0,
                                  ),
                                )
                              ],
                            ),

                            //! CANCEL BUTTON
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (_) => const LandingPage(),
                              )),
                              child: CircleAvatar(
                                radius: 40.0,
                                backgroundColor:
                                    const Color(0XFFC4C4C4).withOpacity(0.3),
                                child: Material(
                                  elevation: 30.0,
                                  shadowColor:
                                      Constants.mainColour.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(200),
                                  child: const CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.transparent,
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      size: 28,
                                      color: Constants.mainColour,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
