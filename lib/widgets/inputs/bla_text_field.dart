import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onPrefixTap;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onPrefixTap,
    this.controller,
    this.onSuffixTap,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() {
      setState(() {}); // Rebuild when text changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BlaColors.greyLight,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.transparent,
          border: InputBorder.none,
          prefixIcon: _buildPrefixIcon(),
          suffixIcon: _buildSuffixIcon(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    return _controller.text.isNotEmpty
        ? IconButton(
      icon: Icon(widget.suffixIcon),
      onPressed: widget.onSuffixTap,
    )
        : null;
  }

  Widget? _buildPrefixIcon() {
    return widget.prefixIcon != null
        ? IconButton(
      icon: Icon(widget.prefixIcon),
      onPressed: widget.onPrefixTap,
    )
        : null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}