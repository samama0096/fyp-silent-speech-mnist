import 'package:flutter/cupertino.dart';

EdgeInsets kPaddingSymetric(bool isSmall) {
  return EdgeInsets.symmetric(
      horizontal: isSmall ? 8 : 14, vertical: isSmall ? 8 : 14);
}

EdgeInsets kPaddingAll(bool isSmall) {
  return EdgeInsets.all(isSmall ? 4 : 8);
}
