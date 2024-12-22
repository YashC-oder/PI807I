import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi807i/components/Controller.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  final controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        controller.text = text;
      },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          fillColor: Colors.grey.shade300,
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide.none,
          ),
          hintText: "Enter Text"),
    );
  }
}
