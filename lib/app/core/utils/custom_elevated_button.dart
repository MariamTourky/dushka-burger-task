import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;

  const CustomElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: enabled ? onPressed : null,
          child: Text(text),
        ),
      ),
    );
  }
}
