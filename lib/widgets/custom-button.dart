import 'package:flutter/material.dart';
import 'package:flutter_side_project/theme/colors.dart' as theme;

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  Icon iconSymbol = const Icon(Icons.add);
  bool ismini;
  final VoidCallback? onPressed;
  // Constructor with required iconSymbol parameter
  CustomButton(
      {super.key,
      required this.iconSymbol,
      this.ismini = false,
      this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: IconButton(
          onPressed: widget.onPressed?.call,
          style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(10),
            backgroundColor: WidgetStatePropertyAll(theme.primaryColor),
            foregroundColor: WidgetStatePropertyAll(theme.secondaryColor),
          ),
          icon: widget.iconSymbol),
    );
  }
}
