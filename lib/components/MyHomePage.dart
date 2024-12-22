import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi807i/components/Button.dart';
import 'package:pi807i/components/Controller.dart';
import 'package:pi807i/components/ImageWidget.dart';
import 'package:pi807i/components/TextWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Controller controller;
  @override
  void initState() {
    super.initState();
    controller = Get.put(Controller());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Assignment App",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.5,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 241, 227),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Obx(() {
                  if (controller.noWidgetSelected) {
                    return const Center(
                      child: Text(
                        "No widget is added",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: controller.text_widget.value,
                        child: const TextWidget(),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Visibility(
                        visible: controller.showMessage.value,
                        child: const Text(
                          "Add at-least a\nwidget to save",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.image_widget.value,
                        child: const ImageWidget(),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Visibility(
                        visible: controller.save_widget.value || true,
                        child: SquareButton(
                          onPressed: () async {
                            await controller.save(context);
                          },
                          text: "save",
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
                onPressed: () {
                  controller.showMessage.value = false;
                  Get.toNamed("/options");
                },
                text: "Add Widgets"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}