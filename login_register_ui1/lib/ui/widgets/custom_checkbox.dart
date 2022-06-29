import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({
    required this.label,
    required this.contentPadding,
    required this.value,
    required this.onTap,
    required this.activeColor,
    required this.fontSize,
    this.gap = 4.0,
    this.bold = false,
  });

  final String label;
  final EdgeInsets contentPadding;
  bool value;
  final Function onTap;
  final Color activeColor;
  final double fontSize;
  final double gap;
  final bool bold;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(!widget.value),
      child: Padding(
        padding: widget.contentPadding ?? const EdgeInsets.all(0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Checkbox(
              value: widget.value,
              activeColor: widget.activeColor,
              visualDensity: VisualDensity.compact,
              onChanged: (val) {
                setState(() {
                  widget.value = val!;
                });
              },
            ),
            SizedBox(
              width: widget.gap,
            ),
            Flexible(
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: widget.bold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
