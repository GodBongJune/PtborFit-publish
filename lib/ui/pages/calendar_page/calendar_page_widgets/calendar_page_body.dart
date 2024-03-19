import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/size.dart';

class CalendarPageBody extends StatefulWidget {
  const CalendarPageBody({super.key});

  @override
  State<CalendarPageBody> createState() => _CalendarPageBodyState();
}

class _CalendarPageBodyState extends State<CalendarPageBody> {
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  List<DateTime> _dates = [DateTime.now()];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.09,
          decoration: BoxDecoration(color: kMainColor),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/trash/defaultpic.png"),
                  radius: 20,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "피티브로",
                      style: TextStyle(
                        color: k59Color,
                        fontSize: size15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "님",
                    style: TextStyle(
                      color: k59Color,
                      fontSize: size13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        _buildDefaultSingleDatePickerWithValue()
      ],
    );
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      selectedDayHighlightColor: kMainColor,
      selectedDayTextStyle: TextStyle(fontWeight: FontWeight.bold),
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: size13,
      ),
      firstDayOfWeek: 1,
      controlsHeight: 50,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      selectableDayPredicate: (day) => !day
          .difference(DateTime.now().subtract(const Duration(days: 3)))
          .isNegative,
    );
    return Column(
      children: [
        CalendarDatePicker2(
          config: config,
          value: _singleDatePickerValueWithDefaultValue,
          onValueChanged: (dates) => setState(() {
            _singleDatePickerValueWithDefaultValue = dates;
            // Open bottom sheet when a date is selected
            _showBottomSheet(context, dates);
          }),
        ),
      ],
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  // void _showBottomSheet(BuildContext context, List<DateTime?> selectedDates) {
  //   showModalBottomSheet(
  //     barrierColor: Colors.grey.withOpacity(0.1),
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         height: MediaQuery.of(context).size.height * 0.8,
  //         color: Colors.white,
  //         child: Center(
  //           child: Text(
  //             'Selected Dates: ${_getValueText(CalendarDatePicker2Type.multi, selectedDates)}',
  //             style: TextStyle(fontSize: 20),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  void _showBottomSheet(BuildContext context, List<DateTime?> selectedDates) {
    showModalBottomSheet(
      barrierColor: Colors.grey.withOpacity(0.1),
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: _getWeekdayWidgets(selectedDates),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.plus_circle_fill,
                        color: kMainColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "아직 기록된 일정이 없습니다.",
                  style: TextStyle(color: kB9Color, fontSize: size15),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _getWeekdayWidgets(List<DateTime?> selectedDates) {
    List<Widget> weekdayWidgets = [];

    // Ensure that there are selected dates
    if (selectedDates.isNotEmpty) {
      // Get weekdays for each selected date
      List<String> weekdays = selectedDates
          .map((date) => date != null
              ? _getWeekdayName(date.weekday)
              : 'N/A') // Convert weekday number to name
          .toList();

      // Create widgets for each weekday
      for (int i = 0; i < weekdays.length; i++) {
        weekdayWidgets.add(
          Row(
            children: [
              Text(
                selectedDates[i]?.day.toString() ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: size20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(".",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: size20)),
              ),
              Text(
                weekdays[i],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: size20),
              ),
            ],
          ),
        );
      }
    }

    return weekdayWidgets;
  }

  String _getWeekdayName(int weekday) {
    // Convert weekday number to name
    switch (weekday) {
      case DateTime.sunday:
        return '일';
      case DateTime.monday:
        return '월';
      case DateTime.tuesday:
        return '화';
      case DateTime.wednesday:
        return '수';
      case DateTime.thursday:
        return '목';
      case DateTime.friday:
        return '금';
      case DateTime.saturday:
        return '토';
      default:
        return '';
    }
  }
}
