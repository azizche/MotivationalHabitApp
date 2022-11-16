import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:monumental_habits/Design/CustomWidgets/custombutton.dart';
import 'package:monumental_habits/Design/CustomWidgets/customtextfield.dart';
import 'package:monumental_habits/Design/Pages/SignInUp/Signin.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer recognizer = TapGestureRecognizer()
      ..onTap = (() => Navigator.pop(context));

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 25 * getscale(context),
            ),
            Row(),
            Image.asset(
              imagepath + 'SignIn/signup.png',
              scale: 1 / getscale(context),
            ),
            SizedBox(
              height: 21 * getscale(context),
            ),
            Text('Create your account'.toUpperCase(),
                style: GeneralTheme.onboardingHeader
                    .copyWith(fontSize: 24, height: 32 / 24)),
            SizedBox(
              height: 32 * getscale(context),
            ),
            CustomTextField(
                hintText: 'Username',
                color: Colors.white,
                prefixpadding: EdgeInsets.symmetric(
                    vertical: 20 * getscale(context),
                    horizontal: 17 * getscale(context)),
                iconData: Icons.person_outline),
            SizedBox(
              height: 8,
            ),
            CustomTextField(
                hintText: 'Email',
                color: Colors.white,
                prefixpadding: EdgeInsets.symmetric(
                    vertical: 22 * getscale(context),
                    horizontal: 17 * getscale(context)),
                iconData: Icons.email_outlined),
            SizedBox(
              height: 8,
            ),
            CustomTextField(
              hintText: 'Password',
              color: Colors.white,
              prefixpadding: EdgeInsets.symmetric(
                  vertical: 20 * getscale(context),
                  horizontal: 18 * getscale(context)),
              iconData: CupertinoIcons.lock,
              ispassword: true,
            ),
            SizedBox(
              height: 29 * getscale(context),
            ),
            buildtick(context, 'Keep me signed in'),
            buildtick(context, 'Email me about special pricing and more'),
            SizedBox(
              height: 18 * getscale(context),
            ),
            CustomButton(text: 'Create Account', sidepadding: 20),
            SizedBox(
              height: 20 * getscale(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * getscale(context)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Divider(
                      color: eclipseColor.withOpacity(0.2),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or sign in with',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -0.3,
                          color: eclipseColor.withOpacity(0.5)),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: eclipseColor.withOpacity(0.2),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20 * getscale(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * getscale(context)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: buildlittlesigninbuttons(
                        context, 'Google.png', 'Google'),
                  ),
                  SizedBox(
                    width: 12 * getscale(context),
                  ),
                  Expanded(
                    child:
                        buildlittlesigninbuttons(context, 'FB.png', 'Facebook'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32 * getscale(context),
            ),
            subtitlesign(
                firsttext: 'Already have an account?',
                secondtext: ' Sign in',
                recognizer: recognizer),
            SizedBox(
              height: 34 * getscale(context),
            ),
          ]),
        ),
      ),
    );
  }
}

buildtick(context, text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 37 * getscale(context),
      ),
      Checkbox(
          visualDensity: VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          checkColor: eclipseColor,
          fillColor: MaterialStateProperty.all(darkorangeColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          value: true,
          onChanged: (i) {}),
      SizedBox(width: 5),
      Text(
        text,
        style: GoogleFonts.manrope(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 22 / 16,
            letterSpacing: -0.3,
            color: eclipseColor),
      )
    ],
  );
}

buildlittlesigninbuttons(context, path, text) {
  return Container(
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: Colors.white),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagepath + 'SignIn/' + path),
          SizedBox(
            width: 16 * getscale(context),
          ),
          Text(text, style: GeneralTheme.buttonText)
        ]),
  );
}
