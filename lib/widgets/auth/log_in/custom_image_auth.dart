import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomImageAuth extends StatelessWidget {
  const CustomImageAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            // controller.faceBookSignUpApp();
          },
          child: Image.asset(
            "assets/images/facebook.png",
            scale: 0.7,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        InkWell(
          onTap: () {
            // controller.googleSinUpApp();
          },
          child: Image.asset(
            "assets/images/google.png",
          ),
        ),
      ],
    );
  }
}
