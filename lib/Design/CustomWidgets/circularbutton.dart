import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';

import '../Constants/stylesandcolors.dart';

class Circularbutton extends StatelessWidget {
  const Circularbutton({Key? key, required this.content}) : super(key: key);
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 44 * getscale(context),
        width: 44 * getscale(context),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: eclipseColor.withOpacity(0.1),
        ),
        child: content);
  }
}
