import 'package:flutter/material.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/views/desktop/desktop_view.dart';
import 'package:shayo_med/views/mobile/mobile_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void didChangeDependencies() {
    //! CACHE THE APP IMAGES, FOR FASTER LOAD TIMES
    precacheImage(const AssetImage("assets/images/aboutUs.png"), context);
    precacheImage(
        const AssetImage("assets/images/homepage_image1.png"), context);
    precacheImage(
        const AssetImage("assets/images/homepage_image2.png"), context);
    precacheImage(const AssetImage("assets/images/logo.png"), context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColour,
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: LayoutBuilder(builder: (context, constraints) {
            double _screenWidth = constraints.maxWidth;
            return
                //! MOBILE VIEW
                (constraints.maxWidth < 600)
                    ? MobileView(theScreenWidth: _screenWidth)
                    :
                    //! DESKTOP VIEW
                    DesktopView(theScreenWidth: _screenWidth);
          })),
    );
  }
}
