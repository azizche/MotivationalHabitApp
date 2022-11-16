import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:monumental_habits/Design/CustomWidgets/custombutton.dart';
import 'package:monumental_habits/Design/Pages/OnBoarding/Pages/onboardingpagemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController controller;
  int currentpage = 0;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    currentpage = 0;
    controller.addListener(() {
      setState(() {
        currentpage = controller.page!.toInt();
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        children: [
          OnBoardingViewModel(
            title: 'welcome to monumental habits',
            imageURL: 'Illustration.png',
            uppadding: 0,
            bottompadding: 20,
          ),
          OnBoardingViewModel(
            title: 'create new habit easily',
            imageURL: 'Habits.png',
            uppadding: 42,
            bottompadding: 62,
          ),
          OnBoardingViewModel(
            title: 'keep track of your progress',
            imageURL: 'Progress.png',
            uppadding: 52,
            bottompadding: 47,
          ),
          OnBoardingViewModel(
            title: 'Join a supportive community',
            imageURL: 'Community Support.png',
            uppadding: 77,
            bottompadding: 95,
          ),
        ],
      ),
      bottomSheet: currentpage != 3
          ? Container(
              height: 90 * getscale(context),
              color: Colors.white,
              padding: EdgeInsets.only(
                left: 32 * getscale(context),
                right: 32 * getscale(context),
                // top: 65 * getscale(context),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        currentpage == 3 ? null : controller.jumpToPage(4);
                      },
                      child: Text(
                        'Skip',
                        style: GeneralTheme.buttonText,
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: ScrollingDotsEffect(
                        dotColor: morningColor,
                        dotHeight: 11,
                        dotWidth: 11,
                        spacing: 10,
                        activeDotColor: eclipseColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease),
                      child: Text(
                        'Next',
                        style: GeneralTheme.buttonText,
                      ),
                    ),
                  ]))
          : Container(
              padding: EdgeInsets.only(bottom: 60 * getscale(context)),
              child: GestureDetector(
                onTap: (() async {
                  final pref = await SharedPreferences.getInstance();
                  pref.setBool('showHome', true);
                  Navigator.pushReplacementNamed(context, '/signin');
                }),
                child: CustomButton(
                  text: 'Get Started',
                  sidepadding: 20,
                ),
              ),
            ),
    );
  }
}
