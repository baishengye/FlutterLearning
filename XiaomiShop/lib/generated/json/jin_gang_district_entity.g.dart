import 'package:xiaomishop/generated/json/base/json_convert_content.dart';
import 'package:xiaomishop/app/data/jin_gang_district_entity.dart';

JinGangDistrictEntity $JinGangDistrictEntityFromJson(
    Map<String, dynamic> json) {
  final JinGangDistrictEntity jinGangDistrictEntity = JinGangDistrictEntity();
  final List<JinGangDistrictResult>? result = (json['result'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<JinGangDistrictResult>(e) as JinGangDistrictResult)
      .toList();
  if (result != null) {
    jinGangDistrictEntity.result = result;
  }
  return jinGangDistrictEntity;
}

Map<String, dynamic> $JinGangDistrictEntityToJson(
    JinGangDistrictEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['result'] = entity.result?.map((v) => v.toJson()).toList();
  return data;
}

extension JinGangDistrictEntityExtension on JinGangDistrictEntity {
  JinGangDistrictEntity copyWith({
    List<JinGangDistrictResult>? result,
  }) {
    return JinGangDistrictEntity()
      ..result = result ?? this.result;
  }
}

JinGangDistrictResult $JinGangDistrictResultFromJson(
    Map<String, dynamic> json) {
  final JinGangDistrictResult jinGangDistrictResult = JinGangDistrictResult();
  final String? id = jsonConvert.convert<String>(json['_id']);
  if (id != null) {
    jinGangDistrictResult.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    jinGangDistrictResult.title = title;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    jinGangDistrictResult.status = status;
  }
  final String? pic = jsonConvert.convert<String>(json['pic']);
  if (pic != null) {
    jinGangDistrictResult.pic = pic;
  }
  final String? pid = jsonConvert.convert<String>(json['pid']);
  if (pid != null) {
    jinGangDistrictResult.pid = pid;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    jinGangDistrictResult.sort = sort;
  }
  final int? isBest = jsonConvert.convert<int>(json['is_best']);
  if (isBest != null) {
    jinGangDistrictResult.isBest = isBest;
  }
  final int? goProduct = jsonConvert.convert<int>(json['go_product']);
  if (goProduct != null) {
    jinGangDistrictResult.goProduct = goProduct;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    jinGangDistrictResult.productId = productId;
  }
  return jinGangDistrictResult;
}

Map<String, dynamic> $JinGangDistrictResultToJson(
    JinGangDistrictResult entity) {
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

extension JinGangDistrictResultExtension on JinGangDistrictResult {
  JinGangDistrictResult copyWith({
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
    return JinGangDistrictResult()
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