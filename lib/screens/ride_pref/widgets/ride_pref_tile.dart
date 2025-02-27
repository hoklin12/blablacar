import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class RidePrefTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onRightTap;
  final VoidCallback onTap;
  final bool isInput;

  const RidePrefTile({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
    this.trailingIcon,
    this.onRightTap,
    this.isInput = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = isInput ? BlaColors.textNormal : BlaColors.greyLight;

    return ListTile(
      leading: Icon(leadingIcon,color: BlaColors.iconLight,),
      title: Text(
        title,
        style: BlaTextStyles.label.copyWith(color: textColor),
      ),
      onTap: onTap,
      /// check trailing icon and Input location for show trailing Icon
      trailing: _buildButtonTtrailing()
    );
  }
  Widget? _buildButtonTtrailing() {
    if (trailingIcon != null && isInput == true) {
      return IconButton(
        icon: Icon(trailingIcon, color: BlaColors.primary),
        onPressed: onRightTap,
        );
    } else {
      return null;
    }
  }

}

