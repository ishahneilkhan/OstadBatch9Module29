import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/auth/controller/login_controller.dart';
import 'package:ecomers_app/features/auth/ui/screen/register_screen.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:ecomers_app/features/home/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static String name = '/LoginScreen';
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late LogInController _emailVerificationController;

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailVerificationController = Get.find<LogInController>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(55.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 120),
                    SvgPicture.asset(
                      AssetsPath.logo,
                      width: 80,
                      height: 120,
                    ),
                    const SizedBox(height: 21),
                    AppThemeData.primaryText('Welcome Back'),
                    const SizedBox(height: 16),
                    AppThemeData.secondaryText('Please Enter Your Email Address'),
                    const SizedBox(height: 26),
                    AppThemeData.textFormField(
                      'Email',
                      1,
                      _emailTEController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),
                    AppThemeData.textFormField('Password', 1, _passwordTEController,
                        (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    }, TextInputType.text),
                    const SizedBox(height: 23),
                    GetBuilder<LogInController>(
                      builder: (controller) {
                        if (controller.inProgress) {
                          return const CenterCircularProgressIndicator();
                        } else {
                          return AppThemeData.nextButton(
                              onPressed: _moveToNextScreen,
                          );
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: () {}, child: const Text('Forgotten Password')),
                        const Text(" | "),
                        TextButton(onPressed: (){
                          _onTapSignupButton(context);
                        }, child: const Text('Sign Up')),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _moveToNextScreen() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _emailVerificationController.verifyEmailPassword(
          _emailTEController.text.trim(), _passwordTEController.text.trim());
      if (isSuccess) {
        if (mounted) {
          showSnackBarMessage(context, _emailVerificationController.message!);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainBottomNavBar()),
                (p) => false,
          );
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, _emailVerificationController.errorMessage!, true);
        }
      }
    }
  }
}
void _onTapSignupButton(BuildContext context){
  Navigator.pushNamed(context, RegisterScreen.name);
}
