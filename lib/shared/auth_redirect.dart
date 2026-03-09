import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthRedirect extends StatelessWidget {
  final String? text;
  final String? textButton;
  final Widget screen;
  const AuthRedirect({
    super.key,
    required this.text,
    required this.screen,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      // height: screenHeight * (14 / 812),
      width: screenWidth * (253 / designWidth),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * (fontSize14 / designWidth),
                  fontWeight: FontWeight.w400,
                  color: colorTextSecondary,
                  letterSpacing: 0,
                  height: lineHeight14 / fontSize14, //screenHeight * (1 / 812)
                ),
              ),
              TextSpan(
                text: textButton,
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * (fontSize14 / designWidth),
                  fontWeight: FontWeight.w700,
                  color: colorTextRedirectButton,
                  letterSpacing: 0,
                  height: lineHeight14 / fontSize14, //screenHeight * (1 / 812)
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screen),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
