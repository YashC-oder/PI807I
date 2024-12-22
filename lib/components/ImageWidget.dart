import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi807i/components/Controller.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  final controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        await controller.selectImage();
      },
      child: Obx(() {
          return Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: controller.selectedImage.value != null
                ? Image.file(controller.selectedImage.value!)
                : const Center(
                    child: Text(
                      "Upload Image",
                      style: TextStyle(
                          color: Color.fromARGB(255, 32, 32, 32),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
          );
        }
      ),
    );
  }
}
