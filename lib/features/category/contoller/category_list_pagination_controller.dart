import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/category/model/category_list_pagination_model.dart';
import 'package:ecomers_app/services/network_caller.dart';

import 'package:get/get.dart';

class CategoryListPaginationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialInProgress => _page==1&&_inProgress==true;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<CategoryModel>  _categoryList = [];
  List<CategoryModel> get categoryList =>_categoryList;

   final int _count =21;
  int _page = 0;
  int? _lastPage;

  Future<bool> getCategoryList() async {
    if(_lastPage!=null && _page>_lastPage!)return false;
    _page++;
    // if(seeAll!=false&&_page>1)return false;
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> queryParam = {
      'count': _count,
      'page': _page,
    };
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.categoryListUrl,
      queryParam: queryParam,
    );

    if (response.isSuccess) {
      isSuccess = true;
      CategoryListPaginationModel categoryListPaginationModel= CategoryListPaginationModel.fromJson(
        response.responseData,
      );
      _categoryList.addAll(categoryListPaginationModel.data!.results??[]);

      if(categoryListPaginationModel.data!.lastPage!=null){
        _lastPage=categoryListPaginationModel.data!.lastPage!;
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
  Future<bool> refreshCategoryList() async {
    _page = 0;
    _lastPage = null;
    _categoryList.clear();
    return getCategoryList();
  }
}
