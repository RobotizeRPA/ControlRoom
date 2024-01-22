import 'package:app/components/Create/Widgets/individual_button.dart';
import 'package:flutter/material.dart';

class UpdateDaysButton extends StatefulWidget {
  final Function(List<dynamic>) onDaysChanged;
  final List<dynamic> selectedDays;

  const UpdateDaysButton(
      {super.key, required this.onDaysChanged, required this.selectedDays});

  @override
  State<UpdateDaysButton> createState() => _MyDaysButtonState();
}

class _MyDaysButtonState extends State<UpdateDaysButton> {
  late List<dynamic> selectedDays = widget.selectedDays;

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
              isSelected: selectedDays.contains('Monday')),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
              child: 'Tue',
              onTap: () => _handleTap('Tuesday'),
              isSelected: selectedDays.contains('Tuesday')),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
              child: 'Wen',
              onTap: () => _handleTap('Wensday'),
              isSelected: selectedDays.contains('Wensday')),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
              child: 'Thu',
              onTap: () => _handleTap('Thursday'),
              isSelected: selectedDays.contains('Thursday')),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
              child: 'Fri',
              onTap: () => _handleTap('Friday'),
              isSelected: selectedDays.contains('Friday')),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
              child: 'Sat',
              onTap: () => _handleTap('Saturday'),
              isSelected: selectedDays.contains('Saturday')),
          const SizedBox(
            width: 10,
          ),
          IndividualButton(
              child: 'Sun',
              onTap: () => _handleTap('Sunday'),
              isSelected: selectedDays.contains('Sunday')),
        ],
      ),
    );
  }
}
