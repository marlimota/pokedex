import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({Key? key, required this.errorMessage})
      : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    const String errorMessage = '';
    return const Center(child: Text(errorMessage));
  }
}
