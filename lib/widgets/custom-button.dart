import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  Icon icon = Icon(Icons.add);
  CustomButton({super.key, required icon});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
