import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';

class OnBoardingViewModel extends StatelessWidget {
  const OnBoardingViewModel({
    Key? key,
    required this.title,
    required this.imageURL,
    required this.uppadding,
    required this.bottompadding,
  }) : super(key: key);
  final String title;
  final String imageURL;
  final double uppadding;
  final double bottompadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 32 * getscale(context),
              right: 32 * getscale(context),
              top: 80 * getscale(context),
              bottom: uppadding * getscale(context)),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: GeneralTheme.onboardingHeader,
          ),
        ),
        Image.asset(imagepath + 'onboarding/' + imageURL),
        Padding(
          padding: EdgeInsets.fromLTRB(
              32 * getscale(context),
              bottompadding * getscale(context),
              32 * getscale(context),
              65 * getscale(context)),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(style: GeneralTheme.buttonText, children: [
                TextSpan(text: "we can ".toUpperCase()),
                TextSpan(
                    text: "help you ".toUpperCase(),
                    style: TextStyle(color: morningColor)),
                TextSpan(text: "to be a better\n version of ".toUpperCase()),
                TextSpan(
                    text: "yourself".toUpperCase(),
                    style: TextStyle(color: morningColor)),
              ])),
        )
      ],
    );
  }
}
