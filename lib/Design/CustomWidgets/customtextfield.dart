import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.color,
    required this.prefixpadding,
    required this.iconData,
    this.ispassword = false,
    required this.hintText,
  }) : super(key: key);
  final Color color;
  final EdgeInsets prefixpadding;
  final IconData iconData;
  final bool ispassword;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 * getscale(context)),
      height: 56 * getscale(context),
      child: TextFormField(
        obscureText: ispassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          hintText: hintText,
          hintStyle: GeneralTheme.disabledText,
          fillColor: color,
          suffixIcon: Padding(
              padding: EdgeInsets.only(
                right: 20 * getscale(context),
                top: 18 * getscale(context),
              ),
              child: ispassword
                  ? Text(
                      'Show',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        height: 16 / 14,
                        color: eclipseColor,
                        letterSpacing: -0.03,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  : SizedBox()),
          prefixIcon: Container(
            width: 60 * getscale(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 17 * getscale(context),
                      right: 17 * getscale(context)),
                  child: Container(
                    child: Icon(
                      iconData,
                      size: 15,
                      color: darkorangeColor,
                    ),
                  ),
                ),
                Expanded(
                  child: VerticalDivider(
                    thickness: 1,
                    color: Color(0xffFFF3E9),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
