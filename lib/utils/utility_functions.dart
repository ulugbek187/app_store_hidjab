import 'package:app_store_hidjab/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showSnack({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyle.interSemiBold
            .copyWith(fontSize: 20.sp, color: Colors.white),
      ),
    ),
  );
}

showErrorForRegister(
  String code,
  BuildContext context,
) {
  if (code == 'weak-password') {
    debugPrint('The password provided is too weak.');
    if (!context.mounted) return;
    showSnack(
      context: context,
      message: "Passwordni xato kiritdingiz",
    );
  } else if (code == 'email-already-in-use') {
    debugPrint('The account already exists for that email.');
    if (!context.mounted) return;
    showSnack(
      context: context,
      message: "Bu e-pochta uchun hisob allaqachon mavjud.",
    );
  }
}

showErrorForLogin(
  String code,
  BuildContext context,
) {
  if (code == 'wrong-password') {
    debugPrint('The password provided is wrong.');
    if (!context.mounted) return;
    showSnack(
      context: context,
      message: "Passwordni xato kiritdingiz",
    );
  } else if (code == 'invalid-email') {
    debugPrint('The e-mail is invalid.');
    if (!context.mounted) return;
    showSnack(
      context: context,
      message: "Bu e-pochta yaqroqsiz.",
    );
  } else if (code == 'user-disabled') {
    debugPrint('The user is blocked.');
    if (!context.mounted) return;
    showSnack(
      context: context,
      message: "Foydalanuvchi bloklangan.",
    );
  } else {
    debugPrint('The user is not found.');
    if (!context.mounted) return;
    showSnack(
      context: context,
      message: "Foydalanuvchi topilmadi.",
    );
  }
}
