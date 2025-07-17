import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/controller_binder.dart';
import 'package:ecomers_app/features/auth/ui/screen/login_screen.dart';
import 'package:ecomers_app/features/auth/ui/screen/pin_verification_screen.dart';
import 'package:ecomers_app/features/auth/ui/screen/register_screen.dart';
import 'package:ecomers_app/features/auth/ui/screen/splash_screen.dart';
import 'package:ecomers_app/features/cart/ui/screens/cart_screen.dart';
import 'package:ecomers_app/features/category/ui/screens/category_list_screen.dart';
import 'package:ecomers_app/features/home/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecomers_app/features/home/ui/screens/profile_screen.dart';
import 'package:ecomers_app/features/wish-list/ui/screens/wishlist_screen.dart';
import 'package:ecomers_app/features/product/ui/screens/create_review_screen.dart';
import 'package:ecomers_app/features/product/ui/screens/product_details_screen.dart';
import 'package:ecomers_app/features/product/ui/screens/product_list_screen.dart';
import 'package:ecomers_app/features/product/ui/screens/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name == SplashScreen.name)
          {
            widget = const SplashScreen();
          }else if(settings.name == LoginScreen.name)
            {
              widget = const LoginScreen();
            }else if(settings.name == PinVerificationScreen.name)
        {
          String email = settings.arguments as String;
          widget = PinVerificationScreen(email: email,);
        }else if(settings.name == RegisterScreen.name)
        {
          widget = const RegisterScreen();
        }else if(settings.name == MainBottomNavBar.name)
        {
          widget = const MainBottomNavBar();
        }else if(settings.name == CategoryListScreen.name)
        {
          widget = const CategoryListScreen();
        }else if(settings.name == ProductListScreen.name)
        {
          Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
          widget = ProductListScreen(
            categoryName: args['categoryName'],
            categoryId: args['categoryId'],
          );
        }else if(settings.name ==ProductDetailsScreen.name)
        {
          final arguments = settings.arguments as Map<String, dynamic>;
          String productId = arguments['productId'] as String;

          widget = ProductDetailsScreen(productId: productId);
        }else if(settings.name == ReviewScreen.name)
          {
            final arguments = settings.arguments as Map<String, dynamic>;
            String productId = arguments['productId'] as String;
            widget = ReviewScreen(productId: productId);
          }else if(settings.name == CreateReviewScreen.name)
          {
            final arguments = settings.arguments as Map<String, dynamic>;
            String productId = arguments['productId'] as String;
            widget =  CreateReviewScreen(productId: productId,);
          }else if(settings.name == WishListScreen.name)
          {
            widget = const WishListScreen();
          }else if(settings.name == CartScreen.name)
          {
            widget = const CartScreen();
          }else if(settings.name == ProfileScreen.name)
          {
            widget = const ProfileScreen();
          }
        return MaterialPageRoute(builder: (ctx){
          return widget;
        });
      },
      // routes: {
      //   // '/': (context)=>const SplashScreen(),
      //   LoginScreen.name:(context)=>const LoginScreen(),
      //   PinVerificationScreen.name:(context)=>const PinVerificationScreen(),
      //   RegisterScreen.name : (context)=>const RegisterScreen(),
      //   MainBottomNavBar.name : (context)=>const MainBottomNavBar(),
      //   CategoryListScreen.name : (context)=>const CategoryListScreen(),
      //   ProductListScreen.name:(context)=>const ProductListScreen(categoryName: "categoryName"),
      // },
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      color: AppColor.themeColor,
      themeMode: ThemeMode.system,

    );
  }
}
