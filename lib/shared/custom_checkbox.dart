import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final double size;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: screenWidth * (size / designWidth),
        height: screenWidth * (size / designWidth), 
        decoration: BoxDecoration(
          color: value ? colorActiveCheckbox : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: colorTextPrimary,
            width: 1.13,
          ),
        ),
        child: value
            ? Icon(Icons.check, size: size * 0.7, color: colorTextPrimary,)
            : null,
      ),
    );
  }
}
