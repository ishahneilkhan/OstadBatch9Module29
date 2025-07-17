import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/home/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    _initializeUserData();

    super.initState();
  }
  Future<void> _initializeUserData() async {
    await authController.getUserData();
    _moveToLoginScreen();
  }

  Future<void> _moveToLoginScreen() async {
    await Future.delayed(const Duration(seconds: 3));

      if (mounted) {
        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const MainBottomNavBar()),(p)=>false);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                AssetsPath.logo,
                width: 80,
                height: 120,
              ),
              const Spacer(),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
