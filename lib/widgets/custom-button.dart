import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  Icon iconSymbol = Icon(Icons.add);
  bool ismini;
  // Constructor with required iconSymbol parameter
  CustomButton({super.key, required this.iconSymbol, this.ismini = false});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FloatingActionButton(
            onPressed: () {},
            shape: CircleBorder(),
            mini: widget.ismini,
            elevation: 10,
            backgroundColor: Color(0xFF252525),
            foregroundColor: Colors.white,
            highlightElevation: 33,
            child: widget.iconSymbol));
  }
}
