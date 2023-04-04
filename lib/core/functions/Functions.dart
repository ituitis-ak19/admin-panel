import 'package:flutter/material.dart';

double dynamicHeight(double value, BuildContext context) =>
    MediaQuery.of(context).size.height * value;
double dyanmicWidth(double value, BuildContext context) =>
    MediaQuery.of(context).size.width * value;
SizedBox dyanmicVerticalSpace(BuildContext context) =>
    SizedBox(height: MediaQuery.of(context).size.height * 0.03);
SizedBox dyanmicHorizontalSpace(BuildContext context) =>
    SizedBox(width: MediaQuery.of(context).size.width * 0.03);
