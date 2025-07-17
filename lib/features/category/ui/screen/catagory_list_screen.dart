import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/category/contoller/category_list_pagination_controller.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/home/ui/widgets/category_item_widget.dart';
import 'package:ecomers_app/features/simmer/product_simmer.dart';
import 'package:ecomers_app/features/simmer/simmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});
  static String name = '/category-list-screen';

  @override
  State<CategoryListScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryListScreen> {
  final CategoryListPaginationController _categoryListPaginationController = Get.find<CategoryListPaginationController>();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(_loadMoreData);
    _categoryListPaginationController.getCategoryList();
    super.initState();
  }
  void _loadMoreData(){
    _categoryListPaginationController.getCategoryList();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
          appBar: AppBar(
            title: AppThemeData.primaryText('Category List'),
            leading: IconButton(
              onPressed: Get.find<MainBottomNavController>().backToHome,
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: ()async{
              Get.find<CategoryListPaginationController>().refreshCategoryList();
            },
            child: GetBuilder<CategoryListPaginationController>(
              builder: (controller) {
                if(controller.initialInProgress){
                  return const ProductShimmer(itemCount: 6,);
                }
                else{
                  return Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                            itemCount: controller.categoryList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 16),
                            itemBuilder: (context, index) {
                              return  FittedBox(child: CategoryItemWidget(categoryModel: controller.categoryList[index],));
                            }),
                      ),
                      Visibility(
                        visible: controller.inProgress,
                          child: const LinearProgressIndicator())
                    ],
                  );
                }
              }
            ),
          )),
    );
  }
  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();


  }

}
