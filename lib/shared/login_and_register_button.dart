
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginAndRegisterButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  const LoginAndRegisterButton({super.key, required this.text, this.onPressed,});

  @override
  Widget build(BuildContext context) {
    
    var screenWidth = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF756EF3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), //screenWidth*(16/375)
        ),
      ),
      child: Text(
        text ?? 'что то пошло не так',
        style: GoogleFonts.poppins(
          fontSize: screenWidth * (fontSize16 / designWidth),
          fontWeight: FontWeight.w400,
          color: colorWhite,
          letterSpacing: 0,
          height: lineHeight16 / fontSize16, //screenHeight * (1 / 812)
        ),
      ),
    );
  }
}
