import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:google_fonts/google_fonts.dart';

class PriorityButton extends StatefulWidget {
  const PriorityButton({super.key});

  @override
  State<PriorityButton> createState() => _PriorityButtonState();
}

class _PriorityButtonState extends State<PriorityButton> {
  bool _isPriorityButtonLowChecked = false;
  bool _isPriorityButtonMediumChecked = false;
  bool _isPriorityButtonHighChecked = false;
  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Container(
          // height: screenHeight * (40 / designHeight), 
          width: screenWidth * (92 / designWidth),
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: _isPriorityButtonLowChecked
                  ? colorBorderActive
                  : colorBorderNoActive,
            ),
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                _isPriorityButtonLowChecked = !_isPriorityButtonLowChecked;
                if (_isPriorityButtonLowChecked) {
                  _isPriorityButtonMediumChecked = false;
                  _isPriorityButtonHighChecked = false;
                }
              });
            },
            style: TextButton.styleFrom(overlayColor: Colors.transparent),
            child: Center(
              child: Text(
                'Низкий',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * (fontSize14 / designWidth),
                  fontWeight: FontWeight.w500,
                  color: _isPriorityButtonLowChecked
                      ? colorTextPrimary
                      : colorTextSecondaryDashboard,
                  letterSpacing: 0,
                  height: lineHeight14 / fontSize14,
                ),
              ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        Container(
          // height: screenHeight * (40 / designHeight), 
          width: screenWidth * (92 / designWidth),
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: _isPriorityButtonMediumChecked
                  ? colorBorderActive
                  : colorBorderNoActive,
            ),
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                _isPriorityButtonMediumChecked =
                    !_isPriorityButtonMediumChecked;
                if (_isPriorityButtonMediumChecked) {
                  _isPriorityButtonLowChecked = false;
                  _isPriorityButtonHighChecked = false;
                }
              });
            },
            style: TextButton.styleFrom(overlayColor: Colors.transparent),
            child: Center(
              child: Text(
                'Средний',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * (fontSize14 / designWidth),
                  fontWeight: FontWeight.w500,
                  color: _isPriorityButtonMediumChecked
                      ? colorTextPrimary
                      : colorTextSecondaryDashboard,
                  letterSpacing: 0,
                  height: lineHeight14 / fontSize14,
                ),
              ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        Container(
          constraints: BoxConstraints(
           minHeight: 14,
          ),
          // height: screenHeight * (40 / designHeight),
          width: screenWidth * (92 / designWidth),
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: _isPriorityButtonHighChecked
                  ? colorBorderActive
                  : colorBorderNoActive,
            ),
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                _isPriorityButtonHighChecked = !_isPriorityButtonHighChecked;
                if (_isPriorityButtonHighChecked) {
                  _isPriorityButtonMediumChecked = false;
                  _isPriorityButtonLowChecked = false;
                }
              });
            },
            style: TextButton.styleFrom(overlayColor: Colors.transparent),
            child: Center(
              child: Text(
                'Высокий',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * (fontSize14 / designWidth),
                  fontWeight: FontWeight.w500,
                  color: _isPriorityButtonHighChecked
                      ? colorTextPrimary
                      : colorTextSecondaryDashboard,
                  letterSpacing: 0,
                  height: lineHeight14 / fontSize14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
