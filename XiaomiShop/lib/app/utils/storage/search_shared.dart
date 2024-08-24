
import 'package:xiaomishop/app/utils/storage/sp_util.dart';

class SearchShared {
  static const searchHistory = "SEARCH_HISTORY";

  static Future<List<String>> getSearchHistory() async {
    var history =  await SPUtil.get(searchHistory);
    return history ?? [];
  }

  static Future<void> setSearchHistory(String keyword) async {
    var history = await getSearchHistory();
    history.add(keyword);
    SPUtil.set(searchHistory, history);
  }

  static Future<void> removeSearchHistory(String keyword) async {
    var history = await getSearchHistory();
    history.remove(keyword);
    SPUtil.set(searchHistory, history);
  }

  static Future<void> clearSearchHistory() async {
    SPUtil.remove(searchHistory);
  }
}