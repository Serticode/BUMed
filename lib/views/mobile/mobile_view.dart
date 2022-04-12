import 'package:flutter/material.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/views/desktop/about_us.dart';
import 'package:shayo_med/views/desktop/get_diagnosed.dart';
import 'package:shayo_med/views/desktop/welcome_widget.dart';
import 'package:shayo_med/views/mobile/app_drawer.dart';
import 'package:shayo_med/widgets/shayo_text_widget.dart';

class MobileView extends StatefulWidget {
  final double theScreenWidth;
  const MobileView({Key? key, required this.theScreenWidth}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final PageController controller = PageController();
  final list = [
    "Welcome",
    "About Us",
    "Get Diagnosed",
  ];

  final GlobalKey<ScaffoldState> _drawerScaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: AppDrawer(
        theScreenWidth: widget.theScreenWidth,
      ),
      key: _drawerScaffoldKey,
      backgroundColor: Constants.primaryColour,
      body: SingleChildScrollView(
        child: SizedBox(
          height: _screenSize.height,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              //! HEADER
              Container(
                color: Constants.primaryColour,
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: InkWell(
                          onTap: () {
                            //on drawer menu pressed
                            if (_drawerScaffoldKey.currentState!.isDrawerOpen) {
                              //if drawer is open, then close the drawer
                              Navigator.pop(context);
                            } else {
                              _drawerScaffoldKey.currentState!.openDrawer();
                              //if drawer is closed then open the drawer.
                            }
                          },
                          child: const Icon(
                            Icons.menu,
                            color: Constants.mainColour,
                          )),
                    ),
                    //! LOGO / ICON
                    SizedBox(
                      width: widget.theScreenWidth * 0.3,
                      child: Row(
                        children: <Widget>[
                          //!LOGO
                          InkWell(
                            onTap: () => _scrollToWelcomePage(0),
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/logo.png")),
                              ),
                            ),
                          ),

                          //! TEXT / NAME
                          const ShayoMedTextWidget(
                              theContent: "BU Med",
                              fontSize: 21,
                              fontColour: Constants.mainColour)
                        ],
                      ),
                    ),

                    //! SPACER
                    const SizedBox(),

                    //!MENUS
                    SizedBox(
                      width: widget.theScreenWidth / 2.3,
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
                    scrollDirection: Axis.vertical,
                    pageSnapping: false,
                    controller: controller,
                    children: List.generate(list.length, (index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: double.maxFinite,
                        child: index == 0
                            ? WelcomeWidget(
                                theScreenWidth: widget.theScreenWidth,
                              )
                            : index == 1
                                ? AboutUs(
                                    theScreenWidth: widget.theScreenWidth,
                                  )
                                : index == 2
                                    ? GetDiagnosed(
                                        theScreenWidth: widget.theScreenWidth,
                                      )
                                    : const WelcomeWidget(),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollToWelcomePage(int index) => controller.animateToPage(index,
      duration: const Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn);

  void _scrollToIndex(int index) => controller.animateToPage(index + 1,
      duration: const Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn);
}
