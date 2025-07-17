import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/auth/data/model/sign_in_model.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? errorMessage;
  String? message;

  Future<bool> verifyEmailPassword(String email, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> body = {"email": email, "password": password};
    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(Urls.loginUrl, body: body);
    _inProgress = false;
    update();
    if (response.isSuccess) {
      SignInModel signInModel = SignInModel.fromJson(response.responseData);
      await Get.find<AuthController>().saveUserData(
        signInModel.data!.token!,
        signInModel.data!.user!,
      );
      errorMessage = null;
      message = "Login successful!";
      isSuccess = true;
    } else {
      errorMessage = response.errorMessage;
      isSuccess = false;
    }

    return isSuccess;
  }
}
