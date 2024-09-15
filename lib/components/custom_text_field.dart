import 'package:app_mobile_horosope/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    required this.prefixIcon,
    required this.keyboardType,
    required this.hintText,
    required this.isObscureText,
    required this.focusNode,
    this.onSuffixTap,
    this.suffixIcon,
    super.key,
  });

  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final bool isObscureText;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final void Function()? onSuffixTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    widget.focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextField(
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        obscureText: widget.isObscureText,
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 15,
        style: const TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          focusColor: AppPallete.gray300,
          prefixIcon: Icon(
            widget.prefixIcon,
            color: widget.focusNode.hasFocus ? const Color(0xFF202020) : AppPallete.gray300,
          ),
          suffixIcon: IconButton(
            onPressed: widget.onSuffixTap,
            icon: Icon(widget.suffixIcon),
            color: AppPallete.gray300,
          ),
          alignLabelWithHint: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 16, color: AppPallete.gray300),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppPallete.gray100),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppPallete.purple500,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFB33822),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
