import 'package:xiaomishop/generated/json/base/json_field.dart';
import 'package:xiaomishop/generated/json/jin_gang_district_entity.g.dart';
import 'dart:convert';
export 'package:xiaomishop/generated/json/jin_gang_district_entity.g.dart';

@JsonSerializable()
class JinGangDistrictEntity {
	List<JinGangDistrictResult>? result = [];

	JinGangDistrictEntity();

	factory JinGangDistrictEntity.fromJson(Map<String, dynamic> json) => $JinGangDistrictEntityFromJson(json);

	Map<String, dynamic> toJson() => $JinGangDistrictEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class JinGangDistrictResult {
	@JSONField(name: "_id")
	String? id = '';
	String? title = '';
	int? status = 0;
	String? pic = '';
	String? pid = '';
	int? sort = 0;
	@JSONField(name: "is_best")
	int? isBest = 0;
	@JSONField(name: "go_product")
	int? goProduct = 0;
	@JSONField(name: "product_id")
	String? productId = '';

	JinGangDistrictResult();

	factory JinGangDistrictResult.fromJson(Map<String, dynamic> json) => $JinGangDistrictResultFromJson(json);

	Map<String, dynamic> toJson() => $JinGangDistrictResultToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}