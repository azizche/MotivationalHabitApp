import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:monumental_habits/Design/CustomWidgets/circularbutton.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({
    Key? key,
    required this.firstbutton,
    required this.pagetitle,
    required this.secondbutton,
    required this.bottompadding,
    required this.content,
  }) : super(key: key);
  final Widget firstbutton;
  final String pagetitle;
  final Widget secondbutton;
  final double bottompadding;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 20 * getscale(context),
                    right: 27 * getscale(context),
                    top: 30 * getscale(context),
                    bottom: bottompadding * getscale(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Circularbutton(content: firstbutton),
                    Text(
                      pagetitle,
                      style: GeneralTheme.homepagetitle,
                    ),
                    secondbutton,
                  ],
                ),
              ),
              for (int i = 0; i < content.length; i++) content[i]
            ],
          ),
        ),
      ],
    ));
  }
}
