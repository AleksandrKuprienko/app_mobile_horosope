import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    required this.prefixIcon,
    required this.keyboardType,
    required this.hintText,
    required this.isObscureText,
    required this.errorText,
    required this.focusNode,
    this.suffixIcon,
    super.key,
  });

  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final bool isObscureText;
  final String errorText;
  final TextInputType keyboardType;
  final FocusNode focusNode;

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
          focusColor: const Color(0xFFA4ABB7),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: widget.focusNode.hasFocus ? const Color(0xFF202020) : const Color(0xFFA4ABB7),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(widget.suffixIcon),
            color: const Color(0xFFA4ABB7),
          ),
          alignLabelWithHint: true,

          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Color(0xFFA4ABB7)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFE3E5EA)),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF6E56CF),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          // errorText: errorText,
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
