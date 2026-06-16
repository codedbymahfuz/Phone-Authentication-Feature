import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._();

  static Size size(BuildContext context) => MediaQuery.sizeOf(context);

  static double height(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;

  static double heightPercentage(BuildContext context, double percentage) =>
      height(context) * percentage;

  static double widthPercentage(BuildContext context, double percentage) =>
      width(context) * percentage;
}
