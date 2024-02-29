import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String dropdownValue;
  final Function(String) onChanged;
  final List<String> values;
  const CustomDropdown({super.key, required this.dropdownValue, required this.onChanged, required this.values});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (String? value) {
          onChanged(value.toString());
        },
        items: values
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}