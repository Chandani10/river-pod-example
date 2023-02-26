import 'package:flutter/material.dart';
import 'package:river_pod/constants/dimens.dart';
import 'package:river_pod/constants/font_family.dart';

Widget vGap(double height) => SizedBox(height: height);

Widget hGap(double width) => SizedBox(width: width);



Widget text(String label,
    {
      Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      int? maxLines,
      TextOverflow? textOverflow = TextOverflow.ellipsis,
      TextAlign? textAlign,
      bool isBold = false}) =>
    Text(
      label,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: FontFamily.gilroy,
        color: color ?? Colors.black,
        fontWeight: isBold
            ? FontWeight.w800
            : fontWeight ,

        fontSize:
        fontSize ?? font_18,
      ),
    );
/*================================================== On Back Press Screen ============================================*/

onBackPress({context}) {
  Navigator.pop(context, true);
}


pushNamed({context,  route,  arguments}) {
  return Navigator.pushNamed(context, route, arguments: arguments);
}

pushReplacementWithName({ context,  route,  arguments}) {
  Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
}

pushAndRemoveUntil({context, route, arguments}) {
  Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
      arguments: arguments);
}


