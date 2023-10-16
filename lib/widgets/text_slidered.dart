import 'package:flutter/material.dart';

class TextSlidered extends StatelessWidget {
  final String title;

  double value;
  final String label;
  final ValueChanged<double> onChanged;
  final bool isweight;

  TextSlidered({
    Key? key,
    required this.title,
    required this.value,
    required this.label,
    required this.onChanged,
    this.isweight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              isweight
                  ? '${value.toStringAsFixed(0)} Kg'
                  : '${value.toStringAsFixed(0)} Cm',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),

        // height slider
        Slider(
          value: value,
          min: 10,
          max: 250,
          onChanged: onChanged,
          divisions: 250,
          label: label,
          activeColor: Color(0xffa9327b),
          inactiveColor: Colors.grey,
        ),
      ],
    );
  }
}
