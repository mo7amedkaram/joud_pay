import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon, // جعل suffixIcon اختياري
    this.controller,
    required this.isObsecureText,
  });

  final String hintText;
  final String prefixIcon;
  final String? suffixIcon; // يمكن أن تكون null
  final bool isObsecureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecureText,
      controller: controller,
      decoration: InputDecoration(
        enabled: true,
        suffixIcon: suffixIcon != null
            ? SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  suffixIcon!,
                  width: 20, // عرض الأيقونة
                  height: 20, // طول الأيقونة
                  fit: BoxFit.scaleDown, // لضمان احتواء الأيقونة بالحجم المناسب
                ),
              )
            : null, // إذا كانت null لا يتم عرضها
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE9E9E9), // اللون المطلوب
          ),
          borderRadius:
              BorderRadius.circular(8.0), // يمكنك تعديل الزوايا حسب رغبتك
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE9E9E9), // اللون المطلوب عند عدم التركيز
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE9E9E9), // اللون المطلوب عند التركيز
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: const Color(0xFFFBFBFB), // لون الخلفية
        prefixIcon: SizedBox(
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            prefixIcon,
            width: 20, // عرض الأيقونة
            height: 20, // طول الأيقونة
            fit: BoxFit.scaleDown, // لضمان احتواء الأيقونة بالحجم المناسب
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFF757575),
          fontSize: 12,
          fontFamily: 'IBMPlexSans',
          fontWeight: FontWeight.w400,
        ), // النص التوضيحي (اختياري)
        alignLabelWithHint: true,
      ),
    );
  }
}
