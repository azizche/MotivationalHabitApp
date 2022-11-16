import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color sunsetColor = Color(0xFFF65B4E);
const Color twilightColor = Color(0xFF29319F);
const Color morningColor = Color(0xFFFFBA7C);
const Color fogColor = Color(0xFFFFDEEF);
const Color eclipseColor = Color(0xFF573353);
const Color darkorangeColor = Color(0xFFFDA758);
const Color backgroundColor = Color(0xffFFF3E9);
const Color backgroundInputColor = Color(0xFFFFF6ED);

class GeneralTheme {
  static TextStyle onboardingTitle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 40,
    fontFamily: "Klasik",
    letterSpacing: -40 * 0.03,
    color: eclipseColor,
  );

  static TextStyle onboardingHeader = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    fontFamily: "Klasik",
    letterSpacing: -32 * 0.03,
    height: 32 / 32,
    color: eclipseColor,
  );

  static TextStyle onboardingBody = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: 17,
    letterSpacing: 0,
    height: 24 / 17,
    color: eclipseColor,
  );
  static TextStyle buttonText = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    letterSpacing: -16 * 0.03,
    color: eclipseColor,
  );
  static TextStyle littleTitles = GoogleFonts.manrope(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: -16 * 0.03,
    color: eclipseColor,
  );
  static TextStyle enabledText = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 14 / 16,
    letterSpacing: -16 * 0.03,
    color: darkorangeColor,
  );
  static TextStyle disabledText = GoogleFonts.manrope(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: -16 * 0.03,
    color: eclipseColor.withOpacity(0.5),
  );
  static TextStyle bottomSigninmessages = GoogleFonts.manrope(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 22 / 14,
    letterSpacing: -14 * 0.03,
    color: eclipseColor,
  );
  static TextStyle homepagetitle = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 32 / 18,
    letterSpacing: -18 * 0.03,
    color: eclipseColor,
  );
  static TextStyle habitname = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 32 / 14,
    letterSpacing: -14 * 0.03,
    color: eclipseColor,
  );
}
