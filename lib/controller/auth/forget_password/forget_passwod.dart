import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ForgetPasswordController extends GetxController {
  Future<void> resetPassword(String email);
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  final TextEditingController emailForgetPasswordController =
      TextEditingController();

  bool isVisibilty = false;
  bool isCheckBox = false;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  User? get userProfiloe => firebaseAuth.currentUser;
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();
  void visibility() {
    isVisibilty = !isVisibilty;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update();
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    emailForgetPasswordController.dispose();

    super.dispose();
  }
}
