import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class TableBasicsExample extends StatefulWidget {
  const TableBasicsExample({super.key});

  @override
  State<TableBasicsExample> createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Dialog(
      backgroundColor: colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.87)),

      child: SizedBox(
        width: screenWidth * (263 / designWidth),
        height: screenHeight * (300.35 / designHeight),
        child: TableCalendar(
          locale: 'ru_RU',
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          shouldFillViewport: false,
          startingDayOfWeek: StartingDayOfWeek.monday,
          rowHeight: screenHeight * (34 / designHeight),
          daysOfWeekHeight: screenHeight * (25.74 / designHeight),
          headerStyle: HeaderStyle(
            titleTextFormatter: (date, locale) {
              return DateFormat('LLLL', locale).format(date).capitalize();
            },
            titleTextStyle: GoogleFonts.poppins(
              fontSize: screenWidth * (fontSize15 / designWidth),
              fontWeight: FontWeight.w600,
              color: colorTextPrimarySplash,
              height: lineHeight15 / fontSize15,
            ),
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: Icon(Icons.arrow_back),
            rightChevronIcon: Icon(Icons.arrow_forward),
          ),

          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) {
              String dayName = DateFormat.E(locale).format(date);
              return dayName.toUpperCase();
            },
            weekdayStyle: GoogleFonts.poppins(
              fontSize: screenWidth * (fontSize10 / designWidth),
              fontWeight: FontWeight.w500,
              color: colorTextSecondaryDashboard,
              height: lineHeight19 / fontSize10,
            ),
            weekendStyle: GoogleFonts.poppins(
              fontSize: screenWidth * (fontSize10 / designWidth),
              fontWeight: FontWeight.w500,
              color: colorTextSecondaryDashboard,
              height: lineHeight19 / fontSize10,
            ),
          ),

          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: colorWhite,
              shape: BoxShape.circle,
            ),
            todayTextStyle: GoogleFonts.poppins(
              fontSize: screenWidth * (fontSize10 / designWidth),
              fontWeight: FontWeight.w500,
              color: colorTextPrimarySplash,
              height: lineHeight19 / fontSize10,
            ),
            selectedDecoration: BoxDecoration(
              color: colorWhite,
              shape: BoxShape.circle,
              border: Border.all(color: colorTextPrimarySplash, width: 0.8),
            ),
            selectedTextStyle: GoogleFonts.poppins(
              fontSize: screenWidth * (fontSize10 / designWidth),
              fontWeight: FontWeight.w500,
              color: colorTextPrimarySplash,
              height: lineHeight19 / fontSize10,
            ),
            defaultTextStyle: GoogleFonts.poppins(
              fontSize: screenWidth * (fontSize10 / designWidth),
              fontWeight: FontWeight.w500,
              color: colorTextPrimary,
              height: lineHeight19 / fontSize10,
            ),
            weekendTextStyle: GoogleFonts.poppins(
              fontSize: screenWidth * (fontSize10 / designWidth),
              fontWeight: FontWeight.w500,
              color: colorTextPrimary,
              height: lineHeight19 / fontSize10,
            ),
            outsideTextStyle: GoogleFonts.poppins(
              fontSize: screenWidth * (fontSize10 / designWidth),
              fontWeight: FontWeight.w500,
              color: colorTextSecondaryDashboard,
              height: lineHeight19 / fontSize10,
            ),
          ),
          // calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            // Use `selectedDayPredicate` to determine which day is currently selected.
            // If this returns true, then `day` will be marked as selected.

            // Using `isSameDay` is recommended to disregard
            // the time-part of compared DateTime objects.
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          // onFormatChanged: (format) {
          //   if (_calendarFormat != format) {
          //     // Call `setState()` when updating calendar format
          //     setState(() {
          //       _calendarFormat = format;
          //     });
          //   }
          // },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;
          },
        ),
      ),

      // ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
