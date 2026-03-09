import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:flutter_dev_test/src/login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_coloured_buttons/gradient_coloured_buttons.dart';

class GradientButtonSplash extends StatelessWidget {
  const GradientButtonSplash({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return GradientButton(
      text: textButtonSplash,

      textStyle: GoogleFonts.poppins(
        fontSize: screenWidth * (fontSize20 / designWidth),
        fontWeight: FontWeight.w700,
        color: colorTextButton,
        letterSpacing: -0.3 * (screenWidth / designWidth),
        height: lineHeight24 / fontSize20,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      gradientColors: [colorButtonGradientStart, colorButtonGradientEnd],

      borderRadius: 15, 
      height: screenHeight * (60 / designHeight),
      width: screenWidth * (295 / designWidth),
    );
  }
}
