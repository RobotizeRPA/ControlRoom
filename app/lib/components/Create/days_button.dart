import 'package:app/components/Create/Widgets/individual_button.dart';
import 'package:flutter/material.dart';

class MyDaysButton extends StatefulWidget {
  final Function(List<String>) onDaysChanged;

  const MyDaysButton({super.key, required this.onDaysChanged});

  @override
  State<MyDaysButton> createState() => _MyDaysButtonState();
}

class _MyDaysButtonState extends State<MyDaysButton> {
  List<String> selectedDays = [];

  void _handleTap(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
    widget.onDaysChanged(selectedDays); // Call the callback function
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          IndividualButton(
            child: 'Mon',
            onTap: () => _handleTap('Monday'),
          ),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
            child: 'Tue',
            onTap: () => _handleTap('Tuesday'),
          ),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
            child: 'Wen',
            onTap: () => _handleTap('Wensday'),
          ),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
            child: 'Thu',
            onTap: () => _handleTap('Thursday'),
          ),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
            child: 'Fri',
            onTap: () => _handleTap('Friday'),
          ),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
            child: 'Sat',
            onTap: () => _handleTap('Saturday'),
          ),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
            child: 'Sun',
            onTap: () => _handleTap('Sunday'),
          ),
        ],
      ),
    );
  }
}
