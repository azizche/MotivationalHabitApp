import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () async {
      //for checking if the user is opening the app for the first time
      final pref = await SharedPreferences.getInstance();

      final showHome = pref.getBool('showHome') ?? false;
      //final showHome = false;

      showHome
          ? Navigator.pushReplacementNamed(context, '/signin')
          : Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getsize(context).width,
        height: getsize(context).height,
        padding: EdgeInsets.only(
            left: 75 * getscale(context),
            right: 75 * getscale(context),
            top: 96 * getscale(context)),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                imagepath + 'onboarding/Background.png',
              ),
              fit: BoxFit.fill),
        ),
        child: Text(
          'welcome to monumental habits'.toUpperCase(),
          textAlign: TextAlign.center,
          style: GeneralTheme.onboardingTitle,
        ),
      ),
    );
  }
}
