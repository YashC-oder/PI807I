import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pi807i/components/CustomSnackBar.dart';

class Controller extends GetxController {
  RxBool save_widget = false.obs;
  RxBool text_widget = false.obs;
  RxBool image_widget = false.obs;
  RxBool showMessage = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  String text = "";

  late ImagePicker _picker;

  @override
  onInit() {
    super.onInit();
    _picker = ImagePicker();
  }

  bool get noWidgetSelected =>
      !(save_widget.value || text_widget.value || image_widget.value);

  Future<void> selectImage() async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile == null) return;
    selectedImage.value = File(xFile.path);
  }

  Future<void> save(BuildContext context) async {
    if (!text_widget.value && !image_widget.value) {
      showMessage.value = true;
      return;
    }
    //if image provided... uploading image to firebase and get link

    String? imageUrl;

    if (selectedImage.value != null) {
      // FIREBASE STORAGE IS AVAILABLE IN PAID PLANS SO I HAVE IMPLEMENTED THE CODE BUT NOT ESTABLISHED IN FIREBASE CONSOLE

      // try {
      //   final storageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
      //   final uploadTask = storageRef.putFile(selectedImage.value!);
      //   final snapshot = await uploadTask.whenComplete(() {});
      //   imageUrl = await snapshot.ref.getDownloadURL();
      // } catch (e) {
      //   if (context.mounted) {
      //     showSnackBar(context, "Failed to Save");
      //   }
      // }
    }

    try {
      // store link and text if provided...
      await FirebaseFirestore.instance.collection('user_data').add({
        'text': text,
        'imageUrl': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
      // show snack bar
      if (context.mounted) {
        showSnackBar(context, "Successfully Saved");
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, "Failed to Save");
      }
    }
  }
}
