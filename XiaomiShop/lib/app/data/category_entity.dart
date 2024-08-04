import 'package:xiaomishop/generated/json/base/json_field.dart';
import 'package:xiaomishop/generated/json/category_entity.g.dart';
import 'dart:convert';
export 'package:xiaomishop/generated/json/category_entity.g.dart';

@JsonSerializable()
class CategoryEntity {
	late List<CategoryResult> result = [];

	CategoryEntity();

	factory CategoryEntity.fromJson(Map<String, dynamic> json) => $CategoryEntityFromJson(json);

	Map<String, dynamic> toJson() => $CategoryEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryResult {
	@JSONField(name: "_id")
	late String id = '';
	late String title = '';
	late int status = 0;
	late String pic = '';
	late String pid = '';
	late int sort = 0;
	@JSONField(name: "is_best")
	late int isBest = 0;
	@JSONField(name: "go_product")
	late int goProduct = 0;
	@JSONField(name: "product_id")
	late String productId = '';

	CategoryResult();

	factory CategoryResult.fromJson(Map<String, dynamic> json) => $CategoryResultFromJson(json);

	Map<String, dynamic> toJson() => $CategoryResultToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}