class Urls{
  static const String _basicUrl='https://ecom-rs8e.onrender.com/api';
  static  String loginUrl='$_basicUrl/auth/login';
  static String otpVerifyUrl = '$_basicUrl/auth/verify-otp';
  static String registerUrl = '$_basicUrl/auth/signup';
  static String sliderListUrl = '$_basicUrl/slides';
  static String categoryListUrl = '$_basicUrl/categories';
  static String readCategoryUrl = '$_basicUrl/categories';
  static String profileUrl = '$_basicUrl/auth/profile';
  static String cartListUrl = '$_basicUrl/cart';
  static String addToCart = '$_basicUrl/cart';
  static String wishListUrl = '$_basicUrl/wishlist';
  static String addToWishUrl = '$_basicUrl/wishlist';
  static String cartDeleteUrl(String cartItemId) => '$_basicUrl/cart/$cartItemId';
  static String wishDeleteUrl(String wishItemId) => '$_basicUrl/wishlist/$wishItemId';
  static String productListUrl = '$_basicUrl/products';
  static String productDetailsUrl(String productId) => '$_basicUrl/products/id/$productId';
  static String reviewListUrl(String productId) => '$_basicUrl/reviews?product=$productId';
  static String addReviewUrl = '$_basicUrl/review';


}
