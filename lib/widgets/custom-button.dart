import 'package:flutter/material.dart';
import 'package:flutter_side_project/theme/colors.dart' as theme;

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  Icon iconSymbol = const Icon(Icons.add);
  EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  // Constructor with required iconSymbol parameter
  CustomButton(
      {super.key,
      required this.iconSymbol,
      this.onPressed,
      this.padding = const EdgeInsets.fromLTRB(0, 0, 0, 0)});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: IconButton(
            onPressed: widget.onPressed?.call,
            style: ButtonStyle(
              iconSize: const WidgetStatePropertyAll(40),
              elevation: const WidgetStatePropertyAll(30),
              backgroundColor: WidgetStatePropertyAll(theme.primaryColor),
              foregroundColor: WidgetStatePropertyAll(theme.secondaryColor),
            ),
            icon: widget.iconSymbol),
      ),
    );
  }
}
