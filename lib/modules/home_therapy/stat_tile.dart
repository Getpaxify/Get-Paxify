import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';

class StatTile extends StatelessWidget {
  const StatTile({

    super.key,
   required this.statValue,
    required  this.icon,
    required  this.label,
  });
  final String statValue;
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.w,
          width: 40.w,
          decoration: const BoxDecoration(
            color: Color(0xFF1C4E58), 
            shape: BoxShape.circle,
          ),
          child:
              Icon(icon, color: Colors.white, size: 24.w),
        ),
        SizedBox(height: 8.h),
        HeaderText(
          text: statValue,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Nunito Sans',
        ),
        12.0.h.spacingH,
        CustomText(
          text: label,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          textColor: fieldGrey,
        ),
      ],
    );
  }
}
