import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {this.fieldLabel,
      this.hintText,
      this.controller,
      super.key,
      this.inputType = TextInputType.text,
      this.suffixIcon,
      this.maxLines = 1,
      this.onEditingComplete,
      this.onPressed,
      this.readOnly = false,
      this.textInputAction,
      this.prefixIcon,
      this.inputFormatters,
      this.maxLength,
      this.focusNode,
      this.radius,
      this.obscureText = false,
      this.onChanged,
      this.widget,
      this.width,
      this.height,
      this.obscure,
      this.focusColor,
      this.styleColor,
      this.hintTextStyle,
      this.textColor,
      this.borderColor,
      this.filledColor,
      this.keyboardType,
      this.max,
      this.style,
      this.onChange,
      this.onSubmit,
      this.validaton,
      this.enable});
  final Widget? widget;
  final String? fieldLabel;
  final double? width;
  final double? height;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final TextStyle? style;
  final Function()? onEditingComplete;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? hintText;
  final int? maxLines;
  final double? radius;
  final int? maxLength;
  final bool readOnly;
  final VoidCallback? onPressed;
  final ValueChanged<String>? onChanged;
  final bool? obscure;
  final Color? focusColor;
  final Color? styleColor;
  final TextStyle? hintTextStyle;
  final Color? textColor;
  final Color? borderColor;
  final Color? filledColor;
  final TextInputType? keyboardType;
  final int? max;
  final onChange;
  final onSubmit;
  final String? Function(String?)? validaton;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: fieldLabel,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                textColor: textColor ?? Colors.black,
              ),
              widget ?? const SizedBox.shrink()
            ],
          ),
          5.0.h.spacingH,
          TextFormField(
              minLines: 1,
              enabled: enable ?? true,
              obscureText: obscureText,
              focusNode: focusNode,
              maxLength: maxLength,
              
              style:style?? TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: styleColor ?? blackColor,
                  fontFamily: 'DMSans'),
              onTap: onPressed,
              controller: controller,
              keyboardType: keyboardType ?? TextInputType.text,
              onChanged: onChange,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.next,
              readOnly: readOnly,
              onEditingComplete: onEditingComplete,
              inputFormatters: inputFormatters,
              validator: validaton,
              maxLines: maxLines,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                
                errorStyle: const TextStyle(height: 0),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 45,
                  minHeight: 45,
                  maxHeight: 50,
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                  maxHeight: 50,
                ),
                errorMaxLines: 2,
                filled: true,
                fillColor: filledColor ??  transparent,
                hintText: hintText,
                hintStyle: hintTextStyle,
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius ?? 16.r),
                    borderSide:
                        BorderSide(color: borderColor ?? Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 16.r),
                  borderSide: BorderSide(
                    color: (borderColor ?? fieldGrey),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 16.r),
                  borderSide: BorderSide(
                    color: (focusColor ?? fieldGrey),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: appRed),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: appRed),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              )),
        ],
      ),
    );
  }
}
