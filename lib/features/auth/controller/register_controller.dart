import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? _message;
  String? get errorMessage=>_errorMessage;
  String? get message=>_message;
  Future<bool> verifyRegister({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String phone,
  }) async {
    Map<String, dynamic> body = {
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "password": password,
      "phone": phone,
    };
    bool isSuccess = false;
    _inProgress=true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.registerUrl, body: body);
    _inProgress=false;
    update();

    if(response.isSuccess){

      isSuccess=true;
      _errorMessage=null;
      _message= "Otp sent Successfully";

    }else{
      _errorMessage=response.errorMessage;
    }

    return isSuccess;
  }
}
