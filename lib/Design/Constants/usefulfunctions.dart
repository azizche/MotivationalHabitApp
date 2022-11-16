import 'package:flutter/material.dart';

final double mockupwidth = 414;

const String imagepath = "assets/images/";

Size getsize(context) => MediaQuery.of(context).size;

//multuply if it's padding and divide if it's an imagescale
double getscale(context) {
  return getsize(context).width / mockupwidth;
}
