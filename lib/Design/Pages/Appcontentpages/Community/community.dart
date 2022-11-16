import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:monumental_habits/Design/CustomWidgets/circularbutton.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/generalpagelayout.dart';

class CommuntiyPage extends StatelessWidget {
  const CommuntiyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      firstbutton: Icon(Icons.menu),
      pagetitle: 'Courses',
      secondbutton: Circularbutton(content: Icon(Icons.search)),
      bottompadding: 32,
      content: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20 * getscale(context)),
          padding: EdgeInsets.symmetric(
              horizontal: 25 * getscale(context),
              vertical: 23 * getscale(context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            image: DecorationImage(
                image: AssetImage(imagepath + 'community/backimage.png')),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(),
                Text(
                  'Habit \nCourses'.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'klasik',
                      fontWeight: FontWeight.w400,
                      color: eclipseColor,
                      height: 32 / 36,
                      fontSize: 36,
                      letterSpacing: -36 * 0.03),
                ),
                Text(
                  'Find what fascinates you as you explore \nthese habit courses.',
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                      color: eclipseColor,
                      height: 18 / 12,
                      fontSize: 12,
                      letterSpacing: -12 * 0.03),
                )
              ]),
        ),
        SizedBox(
          height: 24 * getscale(context),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * getscale(context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Sort By:',
                style: GeneralTheme.disabledText.copyWith(color: eclipseColor),
              ),
              SizedBox(
                width: 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
