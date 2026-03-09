import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';

class DecorativeCircles extends StatelessWidget {
  final Color? colorCircleTwo;
  const DecorativeCircles({super.key, required this.colorCircleTwo,});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Container(
          height: screenHeight * (49 / designHeight), 
          width: screenWidth * (64 / designWidth), 
          color: colorWhite,
        ),
        Positioned(
          child: ClipRect(
            child: Icon(
              Icons.circle,
              color: colorCircleOne,
              size: screenWidth * (8 / designWidth),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * (15 / designHeight),
          left: screenWidth * (52 / designWidth),
          child: ClipRect(
            child: Icon(
              Icons.circle,
              color: colorCircleTwo,
              size: screenWidth * (12 / designWidth),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * (44 / designHeight),
          left: screenWidth * (44 / designWidth),
          child: ClipRect(
            child: Icon(
              Icons.circle,
              color: colorCirclethree,
              size: screenWidth * (4 / designWidth),
            ),
          ),
        ),
      ],
    );
  }
}
