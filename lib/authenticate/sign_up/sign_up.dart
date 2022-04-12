import 'package:flutter/material.dart';
import 'package:shayo_med/authenticate/auth.dart';
import 'package:shayo_med/authenticate/sign_in/sign_in.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/screens/landing_page/landing_page.dart';
import 'package:shayo_med/widgets/shayo_text_widget.dart';

class SignUp extends StatefulWidget {
  final double theScreenWidth;
  const SignUp({Key? key, required this.theScreenWidth}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //! CHECKED BOX VALUE
  bool _isChecked = false;
  //!KEYS & CONTROLLER
  final _formKey = GlobalKey<FormState>();
  final _theNameController = TextEditingController();
  final _theWeightController = TextEditingController();
  final _theEthnicityController = TextEditingController();
  final _theEmailController = TextEditingController();
  final _thePasswordController = TextEditingController();
  final _theContactController = TextEditingController();
  final _theAgeController = TextEditingController();

  //!INPUT DECORATION
  final InputDecoration _textFieldDecoration = const InputDecoration(
    enabledBorder: UnderlineInputBorder(),
    focusedBorder: UnderlineInputBorder(),
    contentPadding: EdgeInsets.all(12.0),
    focusColor: Constants.mainColour,
    floatingLabelStyle: TextStyle(color: Constants.mainColour),
    hintStyle: TextStyle(
      fontSize: 14.0,
    ),
  );

  //! TEXT STYLE
  final TextStyle _bodyTextStyle = const TextStyle(
      color: Color(0xFF474644),
      fontWeight: FontWeight.w500,
      fontSize: 42.0,
      fontFamily: "Poppins");

  final TextStyle _spanTextStyle = const TextStyle(
    color: Colors.transparent,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    fontFamily: "Poppins",
    decoration: TextDecoration.underline,
    decorationColor: Constants.mainColour,
    decorationThickness: 1.5,
    shadows: [Shadow(color: Constants.mainColour, offset: Offset(0, -5))],
  );

  //!IN-BUILT STATE MANAGEMENT METHODS
  @override
  void dispose() {
    //!DISPOSE ALL TEXT FIELD CONTROLLERS
    _theNameController.dispose();
    _theWeightController.dispose();
    _theEthnicityController.dispose();

    _theEmailController.dispose();
    _thePasswordController.dispose();
    _theContactController.dispose();
    _theAgeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.primaryColour,
      body: Padding(
        padding: widget.theScreenWidth < 600
            ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0)
            : const EdgeInsets.symmetric(horizontal: 60.0, vertical: 60.0),
        child: Material(
          elevation: 30.0,
          shadowColor: Constants.mainColour.withOpacity(0.5),
          child: Container(
            width: widget.theScreenWidth < 600
                ? widget.theScreenWidth * 0.9
                : widget.theScreenWidth * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(width: 3.0, color: Constants.mainColour),
              color: Constants.primaryColour,
            ),
            padding: widget.theScreenWidth < 600
                ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0)
                : const EdgeInsets.symmetric(horizontal: 60.0, vertical: 60.0),
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: widget.theScreenWidth < 600
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  //! IMAGE
                  CircleAvatar(
                    radius: 60.0,
                    backgroundColor: const Color(0XFFC4C4C4).withOpacity(0.8),
                    child: const Center(
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("images/logo.png"),
                      ),
                    ),
                  ),

                  //! REGISTER
                  Text("Register",
                      style:
                          _bodyTextStyle.copyWith(color: Constants.mainColour)),

                  //! LETS GET YOU SET
                  Text("Let's get you set for Diagnosis!",
                      style: _bodyTextStyle.copyWith(
                        fontSize: 21.0,
                      )),

                  //! FORM
                  Container(
                    height: _screenSize.height * 0.4,
                    width: widget.theScreenWidth < 600
                        ? widget.theScreenWidth * 0.8
                        : widget.theScreenWidth * 0.6,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // !  FULL NAME / EMAIL
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // ! FULL NAME
                              SizedBox(
                                width: _screenSize.width * 0.23,
                                child: TextFormField(
                                  controller: _theNameController,
                                  keyboardType: TextInputType.name,
                                  maxLength: 32,
                                  decoration: _textFieldDecoration.copyWith(
                                      labelText: "Full name",
                                      hintText: "Ciroma, Chukwuma Adekunle"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your full name";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              //! EMAIL
                              SizedBox(
                                width: _screenSize.width * 0.23,
                                child: TextFormField(
                                  controller: _theEmailController,
                                  keyboardType: TextInputType.emailAddress,
                                  maxLength: 32,
                                  decoration: _textFieldDecoration.copyWith(
                                    labelText: "Email",
                                    hintText: "you@you.com",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your e-mail";
                                    } else if (value.contains("@") == false) {
                                      return "This is not a valid e-mail Age";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),

                          //! MOBILE CONTACT
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: _screenSize.width * 0.23,
                                child: TextFormField(
                                  controller: _theContactController,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 14,
                                  decoration: _textFieldDecoration.copyWith(
                                    labelText: "Phone number",
                                    hintText: "+2348012345678",
                                  ),
                                  validator: (value) {
                                    if (value!.length < 11 ||
                                        value.length > 14) {
                                      return "Enter a valid contact number";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              //! AGE
                              SizedBox(
                                width: _screenSize.width * 0.23,
                                child: TextFormField(
                                  controller: _theAgeController,
                                  keyboardType: TextInputType.text,
                                  maxLength: 45,
                                  decoration: _textFieldDecoration.copyWith(
                                    labelText: "Age?",
                                    hintText: "40 years",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your age";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),

                          //! PASSWORD
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //! PASSWORD
                              SizedBox(
                                width: _screenSize.width * 0.23,
                                child: TextFormField(
                                  obscureText: true,
                                  controller: _thePasswordController,
                                  keyboardType: TextInputType.emailAddress,
                                  maxLength: 32,
                                  decoration: _textFieldDecoration.copyWith(
                                    labelText: "Password",
                                    hintText: "******",
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
                              ),

                              SizedBox(
                                width: _screenSize.width * 0.23,
                                child: TextFormField(
                                  controller: _theWeightController,
                                  keyboardType: TextInputType.emailAddress,
                                  maxLength: 32,
                                  decoration: _textFieldDecoration.copyWith(
                                    labelText: "Weight?",
                                    hintText: "85kg",
                                  ),
                                  validator: (value) {
                                    if (value!.contains("kg") == false) {
                                      return "Enter a weight";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),

                          //! ETHNICITY
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: _screenSize.width * 0.23,
                              child: TextFormField(
                                controller: _theEthnicityController,
                                keyboardType: TextInputType.emailAddress,
                                maxLength: 32,
                                decoration: _textFieldDecoration.copyWith(
                                  labelText: "Ethnicity?",
                                  hintText:
                                      "White, Black, Asian, Amerindian/Alaska native, Native Hawaiian/Pacific Islander, Mixed ethnicity",
                                ),
                                validator: (value) {
                                  if (value!.length < 5) {
                                    return "Enter your ethnicity";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),

                          //! AGREE TO TERMS AND CONDITIONS
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: <Widget>[
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    value: _isChecked,
                                    onChanged: (currentValue) => setState(() {
                                      _isChecked = currentValue!;
                                    }),
                                    checkColor: Constants.mainColour,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const ShayoMedTextWidget(
                                  theContent: "I agree to the ",
                                  fontColour: Color(0xFF474644),
                                  fontSize: 16.0,
                                ),
                                Text("Terms and Conditions ",
                                    style: _spanTextStyle),
                                const ShayoMedTextWidget(
                                  theContent: "and ",
                                  fontColour: Color(0xFF474644),
                                  fontSize: 16.0,
                                ),
                                Text(
                                  "Privacy Policy",
                                  style: _spanTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! REGISTER BUTTON
                  SizedBox(
                    width: widget.theScreenWidth < 600
                        ? widget.theScreenWidth * 0.2
                        : _screenSize.width * 0.09,
                    child: ElevatedButton(
                        onPressed: () async {
                          //! IS CHECKED
                          if (_isChecked == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Do you accept our Terms and Conditions?")));
                          } else {
                            if (_formKey.currentState!.validate()) {
                              //!FETCH CONTENT OF TEXT FORM FIELDS
                              String _enteredEmail = _theEmailController.text;
                              String _enteredPassword =
                                  _thePasswordController.text;
                              String _fullName = _theNameController.text;
                              String _weight = _theWeightController.text;
                              String _contact = _theContactController.text;
                              String _age = _theAgeController.text;
                              String _ethnicity = _theEthnicityController.text;

                              /* await auth
                                  .createUserWithEmailAndPassword(
                                      email: _enteredEmail,
                                      password: _enteredPassword)
                                  .whenComplete(() => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              const LandingPage()))); */

                              AuthController.getXSignUp(
                                  email: _enteredEmail,
                                  password: _enteredPassword,
                                  fullName: _fullName,
                                  age: _age,
                                  contact: _contact,
                                  weight: _weight,
                                  ethnicity: _ethnicity);
                            } else {
                              debugPrint("Could not validate form");
                            }

                            /* Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LandingPage())); */
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(21.0),
                          primary: Constants.mainColour,
                        ),
                        child: const ShayoMedTextWidget(
                          theContent: "Sign up",
                          fontColour: Constants.primaryColour,
                          fontSize: 18.0,
                        )),
                  ),

                  //! DO NOT HAVE AN ACCOUNT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const ShayoMedTextWidget(
                        theContent: "Already have an account?",
                        fontColour: Color(0xFF474644),
                        fontSize: 18.0,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: (() => Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                                builder: ((context) => SignIn(
                                      theScreenWidth: widget.theScreenWidth,
                                    ))))),
                        child: const ShayoMedTextWidget(
                          theContent: "Sign in",
                          fontColour: Constants.mainColour,
                          fontSize: 19.0,
                        ),
                      )
                    ],
                  )
                ],
              ),

              //! CANCEL BUTTON
              widget.theScreenWidth < 600
                  ? Align(
                      alignment: Alignment.bottomRight,

                      /* bottom: 0.0,
                left: _screenSize.width * 0.5, */
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (_) => const LandingPage(),
                          ));
                        },
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor:
                              const Color(0XFFC4C4C4).withOpacity(0.3),
                          child: Material(
                            elevation: 20.0,
                            shadowColor: Constants.mainColour.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(200),
                            child: const CircleAvatar(
                              radius: 20.0,
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
                    )
                  : Positioned(
                      top: 0.0,
                      left: _screenSize.width * 0.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (_) => const LandingPage(),
                          ));
                        },
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor:
                              const Color(0XFFC4C4C4).withOpacity(0.3),
                          child: Material(
                            elevation: 20.0,
                            shadowColor: Constants.mainColour.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(200),
                            child: const CircleAvatar(
                              radius: 20.0,
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
                    ),
            ]),
          ),
        ),
      ),
    );
  }
}
