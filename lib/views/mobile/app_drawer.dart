import 'package:flutter/material.dart';
import 'package:shayo_med/authenticate/sign_in/sign_in.dart';
import 'package:shayo_med/authenticate/sign_up/sign_up.dart';
import 'package:shayo_med/constants/constants.dart';

import '../../widgets/shayo_text_widget.dart';

class AppDrawer extends StatelessWidget {
  final double theScreenWidth;
  const AppDrawer({Key? key, required this.theScreenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Constants.primaryColour,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            //! TOP PART
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                //height: _screenSize.height * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/homepage_image1.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            //! BOTTOM PART
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //! LOGIN
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return SignIn(
                                theScreenWidth: theScreenWidth,
                              );
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Constants.mainColour,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: theScreenWidth < 1080
                                ? const EdgeInsets.all(18.0)
                                : const EdgeInsets.all(21.0),
                          ),
                          child: const ShayoMedTextWidget(
                              theContent: "Log in",
                              fontSize: 18,
                              fontColour: Constants.primaryColour)),
                    ),

                    const SizedBox(
                      height: 40.0,
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return SignUp(
                                theScreenWidth: theScreenWidth,
                              );
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Constants.primaryColour,
                              padding: theScreenWidth < 1080
                                  ? const EdgeInsets.all(18.0)
                                  : const EdgeInsets.all(21.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              side: const BorderSide(
                                width: 1.5,
                                color: Constants.mainColour,
                              )),
                          child: const ShayoMedTextWidget(
                              theContent: "Sign up",
                              fontSize: 18,
                              fontColour: Constants.mainColour)),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(child: SizedBox())
          ],
        ),
      ),
    );
  }
}
