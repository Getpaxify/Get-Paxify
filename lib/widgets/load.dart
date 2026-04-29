import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/widgets/custom_text.dart';

class LoadButton extends StatelessWidget {
  final VoidCallback function;
  final String label;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final Widget? widget;
  final double? fontSize;
  final double? height;
  const LoadButton(
      {required this.label,
      this.widget,
      super.key,
      this.fontSize,
      this.borderColor,
      this.fontWeight,
      required this.function,
      this.width,
      this.textColor,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          color: color ?? primaryColor,
          border: Border.all(color: borderColor ?? transparent),
          borderRadius: BorderRadius.circular(16.r)),
      child: TextButton(
        onPressed: function,
        child: Text(
          label,
          style: TextStyle(
            color: textColor ?? whiteColor,
            fontFamily: 'Merriweather Sans',
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: fontSize ?? 16.sp,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback function;
  final String label;
  final double? width;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final Widget? widget;
  final Color? borderColor;
  const CustomButton(
      {required this.label,
      super.key,
      this.fontSize,
      this.borderColor,
      this.widget,
      this.fontWeight,
      required this.function,
      this.width,
      this.textColor,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 46.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? transparent),
        // shape: BoxShape.circle,
        color: color ?? primaryColor,
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Center(
        child: TextButton(
          onPressed: function,
          child: Center(child: widget ?? const SizedBox.shrink()),
        ),
      ),
    );
  }
}

class CustomButtoni extends StatelessWidget {
  final VoidCallback function;
  final String label;
  final double? width;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final Widget? widget;
  final Color? borderColor;
  const CustomButtoni(
      {required this.label,
      super.key,
      this.fontSize,
      this.borderColor,
      this.widget,
      this.fontWeight,
      required this.function,
      this.width,
      this.textColor,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 46.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? transparent),
          color: color ?? primaryColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: TextButton(
          onPressed: function,
          child: Row(
            children: [
              CustomText(
                text: label,
                fontSize: 13.sp,
                fontFamily: 'Poppins',
                textColor: textColor ?? blackColor,
              ),
              widget ?? const SizedBox.shrink(),
            ],
          )),
    );
  }
}
