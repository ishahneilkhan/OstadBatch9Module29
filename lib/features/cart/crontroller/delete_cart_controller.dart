import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class DeleteCartController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool>deleteCart(String cartId)async{
    final String? token=Get.find<AuthController>().accessToken;
    bool isSuccess=false;
    _inProgress=true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().delRequest(Urls.cartDeleteUrl(cartId),accessToken: token);
    if(response.isSuccess){
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
