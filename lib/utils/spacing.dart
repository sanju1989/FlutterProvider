import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(
  width: 10.0,
);
const Widget horizontalSpaceRegular = SizedBox(
  height: 18.0,
);
const Widget horizontalSpaceMedium = SizedBox(
  height: 25.0,
);
const Widget horizontalSpaceLarge = SizedBox(
  height: 50.0,
);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(
  height: 10.0,
);
const Widget verticalSpaceRegular = SizedBox(
  height: 18.0,
);
const Widget verticalSpaceMedium = SizedBox(
  height: 25.0,
);
const Widget verticalSpaceLarge = SizedBox(
  height: 50.0,
);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHight(BuildContext context) => MediaQuery.of(context).size.height;
double screenHightPercentage(BuildContext context, {double percentage = 12}) =>
    screenHight(context) * percentage;
double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
