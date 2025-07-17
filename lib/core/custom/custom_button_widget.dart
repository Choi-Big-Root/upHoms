import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  const CustomButtonWidget({
    super.key,
    required this.color,
    required this.onPressed,
    required this.elevation,
    required this.circular,
    required this.size,
    required this.text,
    required this.style,
  });

  final Color color;
  final VoidCallback onPressed;
  final double elevation;
  final double circular;
  final Size size;
  final String text;
  final TextStyle style;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(widget.color),
        elevation: WidgetStateProperty.all(widget.elevation),
        side: WidgetStateProperty.all(
          const BorderSide(color: Colors.transparent, width: 1.0),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.circular),
          ),
        ),
        minimumSize: WidgetStateProperty.all(widget.size),
      ),
      child: Text(widget.text, style: widget.style),
    );
  }
}
