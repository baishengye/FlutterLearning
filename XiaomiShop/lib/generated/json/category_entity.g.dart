import 'package:xiaomishop/generated/json/base/json_convert_content.dart';
import 'package:xiaomishop/app/data/category_entity.dart';

CategoryEntity $CategoryEntityFromJson(Map<String, dynamic> json) {
  final CategoryEntity categoryEntity = CategoryEntity();
  final List<CategoryResult>? result = (json['result'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CategoryResult>(e) as CategoryResult)
      .toList();
  if (result != null) {
    categoryEntity.result = result;
  }
  return categoryEntity;
}

Map<String, dynamic> $CategoryEntityToJson(CategoryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['result'] = entity.result.map((v) => v.toJson()).toList();
  return data;
}

extension CategoryEntityExtension on CategoryEntity {
  CategoryEntity copyWith({
    List<CategoryResult>? result,
  }) {
    return CategoryEntity()
      ..result = result ?? this.result;
  }
}

CategoryResult $CategoryResultFromJson(Map<String, dynamic> json) {
  final CategoryResult categoryResult = CategoryResult();
  final String? id = jsonConvert.convert<String>(json['_id']);
  if (id != null) {
    categoryResult.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    categoryResult.title = title;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    categoryResult.status = status;
  }
  final String? pic = jsonConvert.convert<String>(json['pic']);
  if (pic != null) {
    categoryResult.pic = pic;
  }
  final String? pid = jsonConvert.convert<String>(json['pid']);
  if (pid != null) {
    categoryResult.pid = pid;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    categoryResult.sort = sort;
  }
  final int? isBest = jsonConvert.convert<int>(json['is_best']);
  if (isBest != null) {
    categoryResult.isBest = isBest;
  }
  final int? goProduct = jsonConvert.convert<int>(json['go_product']);
  if (goProduct != null) {
    categoryResult.goProduct = goProduct;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    categoryResult.productId = productId;
  }
  return categoryResult;
}

Map<String, dynamic> $CategoryResultToJson(CategoryResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = entity.id;
  data['title'] = entity.title;
  data['status'] = entity.status;
  data['pic'] = entity.pic;
  data['pid'] = entity.pid;
  data['sort'] = entity.sort;
  data['is_best'] = entity.isBest;
  data['go_product'] = entity.goProduct;
  data['product_id'] = entity.productId;
  return data;
}

extension CategoryResultExtension on CategoryResult {
  CategoryResult copyWith({
    String? id,
    String? title,
    int? status,
    String? pic,
    String? pid,
    int? sort,
    int? isBest,
    int? goProduct,
    String? productId,
  }) {
    return CategoryResult()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..status = status ?? this.status
      ..pic = pic ?? this.pic
      ..pid = pid ?? this.pid
      ..sort = sort ?? this.sort
      ..isBest = isBest ?? this.isBest
      ..goProduct = goProduct ?? this.goProduct
      ..productId = productId ?? this.productId;
  }
}