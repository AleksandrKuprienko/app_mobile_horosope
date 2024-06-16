import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.title, required this.onPressed, this.icon, super.key});

  final String title;
  final Icon? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: CupertinoButton.filled(
        onPressed: () {
          onPressed?.call();
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            icon ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
