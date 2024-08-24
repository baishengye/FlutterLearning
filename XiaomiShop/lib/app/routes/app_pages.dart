import 'package:get/get.dart';

import '../modules/productList/bindings/product_list_binding.dart';
import '../modules/productList/views/product_list_view.dart';
import '../modules/productSearch/bindings/product_search_binding.dart';
import '../modules/productSearch/bindings/product_search_binding.dart';
import '../modules/productSearch/bindings/product_search_binding.dart';
import '../modules/productSearch/views/product_search_view.dart';
import '../modules/productSearch/views/product_search_view.dart';
import '../modules/productSearch/views/product_search_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_SEARCH,
      page: () => const ProductSearchView(),
      binding: ProductSearchBinding(),
      children: [
        GetPage(
          name: _Paths.PRODUCT_SEARCH,
          page: () => const ProductSearchView(),
          binding: ProductSearchBinding(),
        ),
        GetPage(
          name: _Paths.PRODUCT_SEARCH,
          page: () => const ProductSearchView(),
          binding: ProductSearchBinding(),
        ),
      ],
    ),
  ];
}
