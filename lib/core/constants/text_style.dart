import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/constants/colors.dart';

TextStyle _textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

// bold style
TextStyle boldStyle({
  Color color = AppColors.white,
  double fontSize = 32,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

// regular style
TextStyle regularStyle({
  Color color = AppColors.white,
  double fontSize = 24,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );
