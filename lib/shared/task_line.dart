import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:flutter_dev_test/models/task.dart';
import 'package:flutter_dev_test/shared/custom_checkbox.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskLine extends StatelessWidget {
  final Task task;
  const TaskLine({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Container(
          height: screenHeight * (68 / designHeight),
          width: screenWidth * (327 / designWidth),
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: colorBorderNoActive),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * (20 / designWidth),
              right: screenWidth * (45 / designWidth),
              top: screenHeight * (16 / designHeight),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCheckbox(
                  value: task.isDone,
                  onChanged: (bool? value) {},
                  size: 16,
                ),
                SizedBox(width: screenWidth * (5 / designWidth)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * (fontSize14 / designWidth),
                        fontWeight: FontWeight.w400,
                        color: colorTextPrimary,
                        letterSpacing: 0,
                        height: lineHeight14 / fontSize14,
                        decoration: task.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: screenHeight * (7 / designHeight)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(
                            Icons.local_offer_outlined,
                            color: colorBorderActive,
                            size: screenWidth * (14 / designWidth),
                          ),
                        ),
                        SizedBox(width: screenWidth * (3 / designWidth)),
                        Text(
                          task.tag,
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * (fontSize14 / designWidth),
                            fontWeight: FontWeight.w400,
                            color: colorTextSecondaryDashboard,
                            letterSpacing: 0,
                            height: lineHeight14 / fontSize14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.info_outline,
                  color: colorIconInfo,
                  size: screenWidth * (18 / designWidth),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
