import 'package:flutter/material.dart';
import 'package:shayo_med/authenticate/sign_in/sign_in.dart';
import 'package:shayo_med/authenticate/sign_up/sign_up.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/views/desktop/about_us.dart';
import 'package:shayo_med/views/desktop/get_diagnosed.dart';
import 'package:shayo_med/views/desktop/welcome_widget.dart';
import 'package:shayo_med/widgets/shayo_text_widget.dart';

class DesktopView extends StatelessWidget {
  final double theScreenWidth;
  DesktopView({
    Key? key,
    required this.theScreenWidth,
  }) : super(key: key);

  final list = [
    "Welcome",
    "About Us",
    "Get Diagnosed",
  ];

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Constants.primaryColour,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          //! HEADER
          Container(
            color: Constants.primaryColour,
            margin: EdgeInsets.symmetric(
              horizontal: theScreenWidth < 1080
                  ? theScreenWidth * 0.02
                  : theScreenWidth * 0.03,
            ),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //! LOGO / ICON
                SizedBox(
                  width: theScreenWidth < 1080
                      ? _screenSize.width * 0.25
                      : _screenSize.width * 0.18,
                  child: Row(
                    children: <Widget>[
                      //!LOGO
                      InkWell(
                        onTap: () => _scrollToWelcomePage(0),
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo.png")),
                          ),
                        ),
                      ),

                      //! TEXT / NAME
                      ShayoMedTextWidget(
                          theContent: "BU Med",
                          fontSize: theScreenWidth < 1080 ? 21 : 26,
                          fontColour: Constants.mainColour)
                    ],
                  ),
                ),

                //! SPACER
                theScreenWidth < 1080 ? const SizedBox() : const Spacer(),

                //!MENUS
                SizedBox(
                  width: theScreenWidth < 1080
                      ? theScreenWidth / 2.8
                      : theScreenWidth / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(2, (index) {
                      return GestureDetector(
                        onTap: () {
                          _scrollToIndex(index);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          child: Text(list[index + 1],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Constants.mainColour)),
                        ),
                      );
                    }),
                  ),
                ),

                //! LOGIN
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
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

                const SizedBox(
                  width: 20.0,
                ),

                //! SIGN UP
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
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
              ],
            ),
          ),

          //! DIVIDER
          const Divider(
            color: Color(0XFF6D7D75),
          ),

          //! THE PAGE VIEW CALLING EACH WIDGET
          Expanded(
            child: PageView(
                scrollDirection: Axis.horizontal,
                pageSnapping: false,
                controller: controller,
                children: List.generate(list.length, (index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: double.maxFinite,
                    child: index == 0
                        ? WelcomeWidget(
                            theScreenWidth: theScreenWidth,
                          )
                        : index == 1
                            ? AboutUs(
                                theScreenWidth: theScreenWidth,
                              )
                            : index == 2
                                ? GetDiagnosed(
                                    theScreenWidth: theScreenWidth,
                                  )
                                : const WelcomeWidget(),
                  );
                })),
          ),
        ],
      )),
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index + 1,
        duration: const Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  void _scrollToWelcomePage(int index) => controller.animateToPage(index,
      duration: const Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn);

  void scrollToGetDiagnosedPage(int index) => controller.animateToPage(index,
      duration: const Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn);
}
