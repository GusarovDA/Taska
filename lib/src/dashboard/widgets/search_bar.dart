import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:flutter_dev_test/design/images.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  final String? text;
  const SearchBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenHeight * (48 / designHeight),
      width: screenWidth * (327 / designWidth),
      child: TextField(
        style: GoogleFonts.poppins(
          fontSize: screenWidth * (fontSize14 / designWidth),
          fontWeight: FontWeight.w500,
          color: colorTextPrimary,
          letterSpacing: 0,
          height: lineHeight14 / fontSize14,
        ),

        decoration: InputDecoration(
          prefixIcon: 
          Padding(
            padding: EdgeInsets.only(left: screenWidth * (12 / designWidth)),
            child: 
            IconButton(
              icon: Image(
                image: searchImg,
                width: screenWidth * (24 / designWidth),
                height: screenHeight * (24 / designHeight),
                color: colorTextPrimary,
              ),
              onPressed: () {

              },
            ),
          ),
          hintText: text,
          filled: true,
          fillColor: colorWhite, //
          hintStyle: GoogleFonts.poppins(
            fontSize: screenWidth * (fontSize14 / designWidth),
            fontWeight: FontWeight.w500,
            color: colorTextPrimary.withValues(alpha: opacity50),
            letterSpacing: 0,
            height: lineHeight14 / fontSize14,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * (17 / designHeight),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            gapPadding: 10,
            borderSide: const BorderSide(color: colorBorderNoActive, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            gapPadding: 10,
            borderSide: const BorderSide(color: colorBorderActive, width: 1),
          ),
        ),
      ),
    );
  }
}
