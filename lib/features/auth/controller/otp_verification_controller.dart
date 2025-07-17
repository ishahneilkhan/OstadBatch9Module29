import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/auth/data/model/sign_in_model.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class OtpVerifiactionController extends GetxController{
  bool _inProgress=false;
  bool get inProgress => _inProgress;
  String? errorMessage;
  String? message;
  Future<bool>verifyOtp(String email,String otp) async {
    bool isSuccess=false;
    _inProgress=true;
    update();
    Map<String,dynamic>body={
      "email":email,
      "otp":otp
    };
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(Urls.otpVerifyUrl,body: body);
    _inProgress=false;
    if(response.isSuccess){
      errorMessage=null;
      message="Account Created successfully";
      SignInModel signInModel = SignInModel.fromJson(response.responseData);
      await Get.find<AuthController>().saveUserData(
        signInModel.data!.token!,
        signInModel.data!.user!,
      );
      isSuccess=true;
    }else{
      errorMessage=response.errorMessage;
    }

    update();
    return isSuccess;
  }
}
