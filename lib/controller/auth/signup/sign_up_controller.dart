import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/routes/routes.dart';

abstract class SignUpController extends GetxController {
  Future<void> signUpFirebase({
    required String name,
    required String email,
    required String password,
  });
}

class SignUpControllerImp extends SignUpController {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  final TextEditingController userNameUpController = TextEditingController();
  final TextEditingController emailSignUpController = TextEditingController();
  final TextEditingController passwordSignUpController =
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
  void onInit() {
    displayUserName.value = userProfiloe?.displayName ?? "";

    displayUserPhoto.value = userProfiloe?.photoURL ?? "";

    displayUserEmail.value = userProfiloe?.email ?? "";

    super.onInit();
  }

  @override
  Future<void> signUpFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        firebaseAuth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.loginScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
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
    emailSignUpController.dispose();
    userNameUpController.dispose();
    passwordSignUpController.dispose();
    super.dispose();
  }
}
