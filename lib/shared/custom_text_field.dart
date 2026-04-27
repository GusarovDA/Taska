import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final bool isObscureText;
  final bool isEnableSuggestions;
  final bool isAutocorrect;
  final int heightForm;
  final int widthForm;
  final TextEditingController? controller;
  final bool isEnabled;
  const CustomTextField({
    super.key,
    required this.text,
    this.isObscureText = false,
    this.isEnableSuggestions = true,
    this.isAutocorrect = true,
    this.controller,
    this.isEnabled = true,
    required this.heightForm,
    required this.widthForm,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenHeight * (heightForm / designHeight),
      width: screenWidth * (widthForm / designWidth),
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        obscureText: isObscureText,
        enableSuggestions: isEnableSuggestions,
        autocorrect: isAutocorrect,
        style: GoogleFonts.poppins(
          fontSize: screenWidth * (fontSize16 / designWidth),
          fontWeight: FontWeight.w500,
          color: colorTextPrimary,
          letterSpacing: 0,
          height: lineHeight16 / fontSize16,
        ),

        decoration: InputDecoration(
          hintText: text,
          filled: true,
          fillColor: colorWhite,
          hintStyle: GoogleFonts.poppins(
            fontSize: screenWidth * (fontSize16 / designWidth),
            fontWeight: FontWeight.w400,
            color: colorTextSecondary,
            letterSpacing: 0,
            height: lineHeight16 / fontSize16, 
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * (22 / designHeight),
            horizontal: screenWidth * (10 / designWidth),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            gapPadding: 10,
            borderSide: const BorderSide(color: colorBorderNoActive, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            gapPadding: 10,
            borderSide: const BorderSide(color: colorBorderNoActive, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            gapPadding: 10,
            borderSide: const BorderSide(color: colorBorderActive, width: 1),
          ),
        ),
      ),
    );
  }
}
