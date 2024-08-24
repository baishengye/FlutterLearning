import 'package:get/get.dart';

import '../../../utils/storage/search_shared.dart';

class ProductSearchController extends GetxController {

  RxList<String> historyList = <String>[].obs;

  void addHistory(String keyword) {
    historyList.add(keyword);
  }

  @override
  void onInit() {
    super.onInit();
    getSearchHistory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getSearchHistory() {
    SearchShared.getSearchHistory().then((value) {
      historyList.addAll(value);
      update();
    });
  }

  void clearHistory() {
    SearchShared.clearSearchHistory().then((value){
      historyList.clear();
      update();
    });
  }

  void removeHistory(String keyword) {
    SearchShared.removeSearchHistory(keyword).then((value) {
      historyList.remove(keyword);
      update();
    });
  }
}
