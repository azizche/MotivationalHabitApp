import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/Home/homepage.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/generalpagelayout.dart';
import 'package:monumental_habits/Design/Pages/SignInUp/forgetpassword.dart';
import 'package:monumental_habits/Logic/cubits/addhabit/cubit/addhabit_cubit.dart';

class Newhabit extends StatelessWidget {
  const Newhabit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map calendar = {
      "Sun": true,
      "Mon": false,
      'Tue': false,
      'Wed': true,
      'Thu': false,
      'Fri': true,
      'Sat': true,
    };
    return Scaffold(
      backgroundColor: backgroundColor,
      body: PageLayout(
        firstbutton: GestureDetector(
            onTap: () {
              BlocProvider.of<AddhabitCubit>(context).confirmpressed();
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.arrow_left)),
        pagetitle: 'New Habit',
        secondbutton: SizedBox(
          width: 35 * getscale(context),
        ),
        bottompadding: 20,
        content: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 * getscale(context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 49 * getscale(context),
                  child: Row(
                    children: [
                      Expanded(
                        child: buildrecoveryemailfield(
                            'Enter habit name', Colors.white),
                      ),
                      SizedBox(
                        width: 12 * getscale(context),
                      ),
                      Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                  right: -10,
                                  top: -10,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 18 * getscale(context),
                                    width: 18 * getscale(context),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: darkorangeColor),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )),
                              Image.asset(imagepath + 'home/reading.png'),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 17 * getscale(context),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20 * getscale(context),
                            right: 17 * getscale(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Habit Frequency',
                              style: GeneralTheme.disabledText
                                  .copyWith(color: eclipseColor),
                            ),
                            Spacer(),
                            Text(
                              'Custom',
                              style: GeneralTheme.disabledText.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: darkorangeColor),
                            ),
                            SizedBox(
                              width: 5 * getscale(context),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: darkorangeColor,
                              shadows: [
                                Shadow(
                                    color: darkorangeColor.withOpacity(0.5),
                                    offset: Offset(0, 2))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17 * getscale(context),
                      ),
                      Divider(
                        height: 0,
                        color: backgroundColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 17 * getscale(context),
                      ),
                      Row(
                        children: calendar.entries
                            .map((entry) => habitdayfrequency(
                                context, entry.key, entry.value))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                buildfield(
                  firsttext: 'Reminder',
                  widget: [
                    Text(
                      '10:00AM',
                      style: GeneralTheme.disabledText.copyWith(
                          fontWeight: FontWeight.w700, color: darkorangeColor),
                    ),
                    SizedBox(
                      width: 5 * getscale(context),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: darkorangeColor,
                      shadows: [
                        Shadow(
                            color: darkorangeColor.withOpacity(0.5),
                            offset: Offset(0, 2))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                buildfield(firsttext: 'Notification', widget: [
                  CupertinoSwitch(
                    onChanged: (i) {},
                    value: false,
                  ),
                ]),
                SizedBox(
                  height: 158 * getscale(context),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            bottom: 20,
                            child: Image.asset(imagepath + 'home/Vector.png')),
                        Positioned(
                            top: -40 * getscale(context),
                            child: CircleAvatar(
                                radius: 35 * getscale(context),
                                foregroundImage:
                                    AssetImage(imagepath + 'home/im.png'))),
                        Padding(
                          padding: EdgeInsets.only(
                              right: 42 * getscale(context),
                              left: 42 * getscale(context),
                              top: 51 * getscale(context),
                              bottom: 63 * getscale(context)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Start this habit',
                                style: GeneralTheme.onboardingHeader.copyWith(
                                    fontSize: 24,
                                    height: 32 / 24,
                                    letterSpacing: -24 * 0.03),
                              ),
                              Text(
                                'ullamco laboris nisi ut aliquip ex ea commodo consequat dolore. ',
                                textAlign: TextAlign.center,
                                style: GeneralTheme.disabledText,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: 20 * getscale(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class buildfield extends StatelessWidget {
  const buildfield({
    Key? key,
    required this.firsttext,
    required this.widget,
  }) : super(key: key);
  final String firsttext;
  final List<Widget> widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 20 * getscale(context), vertical: 17 * getscale(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            firsttext,
            style: GeneralTheme.disabledText.copyWith(color: eclipseColor),
          ),
          Spacer(),
          for (int i = 0; i < widget.length; i++) widget[i]
        ],
      ),
    );
  }
}

Widget habitdayfrequency(context, dayname, isfull) {
  return Padding(
    padding: EdgeInsets.all(9.0 * getscale(context)),
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              dayname,
              style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  height: 13 / 10,
                  letterSpacing: -10 * 0.03,
                  color: eclipseColor.withOpacity(0.5)),
            ),
            SizedBox(
              height: 3,
            ),
            isfull
                ? buildfullbox(
                    context,
                    darkorangeColor,
                    (getsize(context).width - 40 * getscale(context)) / 7 -
                        18 * getscale(context) -
                        4)
                : buildhalfbox(
                    context,
                    darkorangeColor,
                    (getsize(context).width - 40 * getscale(context)) / 7 -
                        18 * getscale(context) -
                        4)
          ],
        ),
      ],
    ),
  );
}
