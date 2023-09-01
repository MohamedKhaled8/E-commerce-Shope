import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/routes/routes.dart';

abstract class LoginController extends GetxController {
  Future<void> loginFirebase({
    required String email,
    required String password,
  });
   void signOutFromApp();
}

class LoginControllerImp extends LoginController {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  bool isVisibilty = false;
  bool isCheckBox = false;
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Future<void> loginFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = firebaseAuth.currentUser!.displayName!);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
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

  void signOutFromApp() async {
    try {
      await firebaseAuth.signOut();

      displayUserName.value = '';
      displayUserPhoto.value = '';
      //displayUserEmail.value = '';
      isSignedIn = false;
      authBox.remove("auth");
      update();

      Get.offNamed(Routes.mainScreen);
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
}
