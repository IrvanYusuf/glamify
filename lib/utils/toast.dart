import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';

void toast(context,message) {
  showToast(message,
      backgroundColor: Color.fromARGB(255, 49, 150, 48),
      context: context,
      axis: Axis.horizontal,
      alignment: Alignment.center,
      position:
          StyledToastPosition(align: Alignment.bottomCenter, offset: 80.0),
      animation: StyledToastAnimation.slideFromBottomFade,
      reverseAnimation: StyledToastAnimation.slideFromBottomFade
      // position: StyledToastPosition(align: Alignment.bottomCenter),
      );
}
