import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingController extends GetxController {
  void imagePickerOption();
  pickImage(ImageSource imageType);
  Future<void> _loadSavedImage();
  Future<void> loadCachedImage();
  Future<void> cachePickedImage(File imageFile);
  Future<void> deleteImage();
}

class SettingControllerImp extends SettingController {
  File? pickedImage;
  var swithchValue = false.obs;

  @override
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Pic Image From",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      deleteImage();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("Deleate"),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      pickedImage = tempImage;
      final directory = await getApplicationDocumentsDirectory();
      final fileName = "${DateTime.now().millisecondsSinceEpoch}.png";
      final newImagePath = File('${directory.path}/$fileName');

      await photo.saveTo(newImagePath.path);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('pickedImagePath', newImagePath.path);
      pickedImage = newImagePath;
      update();
      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImagePath = prefs.getString('pickedImagePath');
    if (savedImagePath != null) {
      pickedImage = File(savedImagePath);
      update();
    }
  }

  @override
  Future<void> cachePickedImage(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cachedImage', base64Image);
  }

  // Load cached image from SharedPreferences
  @override
  Future<void> loadCachedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedImage = prefs.getString('cachedImage');
    if (cachedImage != null) {
      pickedImage = File.fromRawPath(base64Decode(cachedImage));
      update();
    }
  }

  @override
  Future<void> deleteImage() async {
    if (pickedImage != null) {
      // Delete the file
      await pickedImage!.delete();

      // Clear cached image from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('pickedImagePath');

      // Clear the pickedImage in the controller and update UI
      pickedImage = null;
      update();
    }
  }

  @override
  void onInit() {
    _loadSavedImage();
    super.onInit();
  }
}
