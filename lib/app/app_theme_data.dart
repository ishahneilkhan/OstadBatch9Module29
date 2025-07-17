import 'package:ecomers_app/app/app_color.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
      colorSchemeSeed: AppColor.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.themeColor,
      ),
      scaffoldBackgroundColor: Colors.white);
  static ThemeData darkThemeData = ThemeData(
      colorSchemeSeed: AppColor.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.themeColor,
      ),
      scaffoldBackgroundColor: Colors.black87
  );


  static TextFormField textFormField(String hint, int maxLine,TextEditingController controller,String? Function(String?) validator,TextInputType? keyboardType,{int? maxLength}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLine,
      maxLength: maxLength,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColor.themeColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColor.themeColor, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }

  static Text primaryText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  static Text secondaryText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  static SizedBox nextButton({required VoidCallback onPressed,String name='Next'}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.themeColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 5,
        ),
        child: Text(
          name,
          style: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal ,color: Colors.white),
        ),
      ),
    );
  }
}
