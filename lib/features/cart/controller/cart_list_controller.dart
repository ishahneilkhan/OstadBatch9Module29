import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/cart/model/cart_list_model.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class CartListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<CartModel>  _cartList = [];
  List<CartModel> get cartList =>_cartList;



  Future<bool>getCartList()async{
    final String? token = Get.find<AuthController>().accessToken;
    bool isSuccess=false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.cartListUrl,accessToken: token);
    if(response.isSuccess){
      _cartList.clear();
      isSuccess=true;
      CartListModel cartListModel = CartListModel.fromJson(response.responseData);
      _cartList.addAll(cartListModel.data!.productList??[]);

    }else{
      _cartList.clear();
      _errorMessage = response.errorMessage;
    }
    _inProgress= false;
    update();
    return isSuccess;
  }
  void updateCartQuantity(String productId, int newQuantity) {
    int index = cartList.indexWhere((item) => item.sId == productId);
    if (index != -1) {
      cartList[index].quantity = newQuantity;
      update();
    }
  }

}
