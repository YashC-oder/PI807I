import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi807i/components/Button.dart';
import 'package:pi807i/components/Controller.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  final controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 241, 227),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 1,),
              OptionTile(
                  onTap: () {
                    controller.text_widget.value = !controller.text_widget.value;
                  },
                  text: "Text Widget",
                  selected: controller.text_widget.value),
              const SizedBox(
                height: 40,
              ),
              OptionTile(
                  onTap: () {
                    controller.image_widget.value = !controller.image_widget.value;
                  },
                  text: "Image Widget",
                  selected: controller.image_widget.value),
              const SizedBox(
                height: 40,
              ),
              OptionTile(
                  onTap: () {
                    controller.save_widget.value = !controller.save_widget.value;
                  },
                  text: "Button Widget",
                  selected: controller.save_widget.value),
              const Spacer(flex: 2,),
              Button(onPressed: (){
                Get.back();
              }, text: "Import Widgets"),
              const Spacer(flex: 1,),
            ],
          );
        }),
      ),
    );
  }

  Widget OptionTile(
      {required void Function()? onTap,
      required String text,
      required bool selected}) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.grey.shade300,
      horizontalTitleGap: 30,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 50,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected
                  ? const Color.fromARGB(255, 174, 228, 87)
                  : Colors.grey.shade300),
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
