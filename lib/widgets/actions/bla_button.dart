import 'package:flutter/material.dart';
import '../../theme/theme.dart';

/// Enum to define button color and label
enum BlaButtonStyle {
  primary,
  secondary,
}

class BlaButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final BlaButtonStyle style;
  final IconData? icon;

  const BlaButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.style = BlaButtonStyle.primary,
    this.icon,
  }) : super(key: key);

  /// switch background color with switch
  Color get backgroundColor {
    switch (style) {
      case BlaButtonStyle.primary:
        return BlaColors.primary;
      case BlaButtonStyle.secondary:
        return BlaColors.white;
    }
  }
 /// use switch for check label color style
  Color get labelColor {
    switch (style) {
      case BlaButtonStyle.primary:
        return BlaColors.white;
      case BlaButtonStyle.secondary:
        return BlaColors.primary;
    }
  }



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        textStyle: BlaTextStyles.button,
        foregroundColor: labelColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      child: _buildButtonContent(),
    );
  }

  ///check icon to build button content
  Widget _buildButtonContent() {
      if (icon != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: labelColor, size: 20),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: labelColor)),
          ],
        );
      } else {
        return Text(label, style: TextStyle(color: labelColor));
      }
    }
  }

