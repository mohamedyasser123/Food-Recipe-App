import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtension on num {
  /// Creates a SizedBox with height = this.h
  SizedBox get heightSizedBox => SizedBox(height: h);

  /// Creates a SizedBox with width = this.w
  SizedBox get widthSizedBox => SizedBox(width: w);

  /// Creates a square SizedBox with width & height = this.w
  SizedBox get squareBox => SizedBox(width: w, height: w);
}