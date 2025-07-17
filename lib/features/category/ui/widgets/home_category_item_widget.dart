// import 'package:ecomers_app/app/app_color.dart';
// import 'package:ecomers_app/features/category/model/home_category_list_model.dart';
// import 'package:ecomers_app/features/product/ui/screens/product_list_screen.dart';
// import 'package:flutter/material.dart';
//
// class HomeCategoryItemWidget extends StatelessWidget {
//   const HomeCategoryItemWidget({
//     super.key, required this.homeCategoryModel,
//   });
//   final CategoryModel homeCategoryModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       GestureDetector(
//         onTap: (){
//           Navigator.pushNamed(context, ProductListScreen.name,arguments: {
//             'categoryName':homeCategoryModel.title,
//             'categoryId':homeCategoryModel.sId
//           });
//         },
//         child: Column(
//           children: [
//             Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: AppColor.themeColor.withOpacity(0.2),
//                 ),
//                 padding: const EdgeInsets.all(8),
//                 child: Image.network(homeCategoryModel.icon?? '',width: 60,)
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Text(
//               homeCategoryModel.title??'',
//               style:  const TextStyle(
//                   color: AppColor.themeColor, fontWeight: FontWeight.bold),
//             )
//           ],
//         ),
//       );
//   }
// }
