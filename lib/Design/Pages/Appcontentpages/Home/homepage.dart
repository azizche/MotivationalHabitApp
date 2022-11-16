import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/Home/newhabit.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/generalpagelayout.dart';
import 'package:monumental_habits/Logic/cubits/addhabit/cubit/addhabit_cubit.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List yesno = [true, false, true, true];
    final Map calendar = {
      "Sun": 17,
      "Mon": 18,
      'Tue': 19,
      'Wed': 20,
      'Thu': 21,
    };
    return PageLayout(
      pagetitle: 'Homepage',
      firstbutton: BlocListener<AddhabitCubit, AddhabitState>(
        listener: (context, state) {
          state.addOrConfirmHabit
              ? Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Newhabit()))
              : null;
        },
        child: Icon(Icons.menu),
      ),
      secondbutton: CircleAvatar(
          radius: 22 * getscale(context),
          foregroundImage: AssetImage(imagepath + 'home/avatar.png')),
      bottompadding: 24,
      content: [
        buildquotewidget(context),
        SizedBox(
          height: 19 * getscale(context),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 38 * getscale(context),
                    right: 69 * getscale(context)),
                child: Text(
                  'HABITS',
                  style: GeneralTheme.habitname,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50 * getscale(context),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: calendar.length,
                      itemBuilder: ((context, index) => calendar.entries
                          .map((entry) => builddaywidget(
                              context,
                              entry.key.toString().toUpperCase(),
                              entry.value.toString()))
                          .toList()[index])),
                ),
              ),
            ]),
        SizedBox(
          height: 11 * getscale(context),
        ),
        buildhabitview(context, 'Read A Book', yesno, darkorangeColor),
        SizedBox(
          height: 6,
        ),
        buildhabitview(context, 'Exercise', yesno, Color(0xFFF65B4E)),
        SizedBox(
          height: 6,
        ),
        buildhabitview(context, 'Wake Up Early', yesno, Color(0xFF29319F)),
        SizedBox(
          height: 6,
        ),
        buildhabitview(context, 'Walk Dog', yesno, Color(0xFF973456)),
      ],
    );
  }

  Container buildquotewidget(BuildContext context) {
    return Container(
      height: 146 * getscale(context),
      margin: EdgeInsets.symmetric(horizontal: 20 * getscale(context)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                imagepath + 'home/quoteimage.png',
                fit: BoxFit.fitHeight,
              )),
          Positioned(
            left: 15 * getscale(context),
            top: 26 * getscale(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We first make our habits, \nand then our habits \nmakes us.'
                      .toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'klasik',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 20.5 / 18,
                      letterSpacing: -18 * 0.03,
                      color: eclipseColor),
                ),
                Text(
                  '- Anonymous'.toUpperCase(),
                  style: GoogleFonts.manrope(
                    color: eclipseColor.withOpacity(0.5),
                    fontSize: 12,
                    height: 24 / 12,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget builddaywidget(context, dayname, daynumber) {
  return Container(
    margin: EdgeInsets.only(left: 6 * getscale(context)),
    alignment: Alignment.center,
    height: 50 * getscale(context),
    width: 50 * getscale(context),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: Colors.white),
    child: Column(
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
              color: eclipseColor.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            daynumber,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 13 / 16,
              letterSpacing: -16 * 0.03,
              color: eclipseColor,
            ),
          ),
        ]),
  );
}

buildhabitview(context, String habitname, List yesno, color) {
  return Container(
    margin: EdgeInsets.only(left: 20 * getscale(context)),
    height: 70 * getscale(context),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: Colors.white),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 117 * getscale(context),
          padding: EdgeInsets.only(left: 19 * getscale(context)),
          child: Text(
            habitname,
            style: GeneralTheme.habitname,
          ),
        ),
        VerticalDivider(
          color: backgroundColor,
          thickness: 1,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: SizedBox(
            height: 50 * getscale(context),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => yesno[index]
                    ? buildfullbox(context, color, 50)
                    : buildhalfbox(context, color, 50)),
          ),
        ),
      ],
    ),
  );
}

buildfullbox(context, color, size) {
  return Container(
    margin: EdgeInsets.only(right: 4),
    height: size * getscale(context),
    width: size * getscale(context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: color,
    ),
  );
}

buildhalfbox(context, Color color, size) {
  return Container(
    margin: EdgeInsets.only(right: 4),
    padding: EdgeInsets.all(2),
    height: size * getscale(context),
    width: size * getscale(context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: color.withOpacity(0.1),
    ),
    child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: CustomPaint(
            size: Size(50, 50), painter: DrawTriangle(color: color))),
  );
}

class DrawTriangle extends CustomPainter {
  final Color color;
  DrawTriangle({
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
