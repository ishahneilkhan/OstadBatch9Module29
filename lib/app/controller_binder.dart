import 'package:ecomers_app/features/auth/controller/login_controller.dart';
import 'package:ecomers_app/features/auth/controller/otp_verification_controller.dart';
import 'package:ecomers_app/features/auth/controller/register_controller.dart';
import 'package:ecomers_app/features/cart/controller/cart_list_controller.dart';
import 'package:ecomers_app/features/cart/controller/delete_cart_controller.dart';
import 'package:ecomers_app/features/category/contoller/category_list_pagination_controller.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/home/controller/get_profile_controller.dart';
import 'package:ecomers_app/features/home/controller/slider_list_controller.dart';
import 'package:ecomers_app/features/home/controller/update_profile_controller.dart';
import 'package:ecomers_app/features/product/controller/add_to_cart_controller.dart';
import 'package:ecomers_app/features/product/controller/add_to_wish_controller.dart';
import 'package:ecomers_app/features/product/controller/create_review_controller.dart';
import 'package:ecomers_app/features/product/controller/new_product_list_controller.dart';
import 'package:ecomers_app/features/product/controller/popular_product_list_controller.dart';
import 'package:ecomers_app/features/product/controller/special_product_list_controller.dart';
import 'package:ecomers_app/features/product/controller/product_details_controller.dart';
import 'package:ecomers_app/features/product/controller/product_list_pagination_controller.dart';
import 'package:ecomers_app/features/product/controller/review_list_contoller.dart';
import 'package:ecomers_app/features/wish-list/controller/delete_wish_controller.dart';
import 'package:ecomers_app/features/wish-list/controller/wish_list_controller.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings
{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(LogInController());
    Get.put(OtpVerifiactionController());
    Get.put(AuthController());
    Get.put(SliderListController());
    Get.put(RegisterController());
    Get.put(CategoryListPaginationController());
    Get.put(UpdateProfileController());
    Get.put(CartListController());
    Get.put(DeleteCartController());
    Get.put(WishListController());
    Get.put(DeleteWishController());
    Get.put(ProductListPaginationController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(AddToWishController());
    Get.put(ReviewListContoller());
    Get.put(CreateReviewController());
    Get.put(SpecialProductListController());
    Get.put(PopularProductListController());
    Get.put(NewProductListController());
    // Get.put(GetProfileDataController());
    // Get.put(HomeCategoryListController());
  }

}
