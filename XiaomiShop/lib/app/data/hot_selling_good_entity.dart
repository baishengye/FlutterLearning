import 'package:xiaomishop/generated/json/base/json_field.dart';
import 'package:xiaomishop/generated/json/hot_selling_good_entity.g.dart';
import 'dart:convert';
export 'package:xiaomishop/generated/json/hot_selling_good_entity.g.dart';

@JsonSerializable()
class HotSellingGoodEntity {
	List<HotSellingGoodResult>? result = [];

	HotSellingGoodEntity();

	factory HotSellingGoodEntity.fromJson(Map<String, dynamic> json) => $HotSellingGoodEntityFromJson(json);

	Map<String, dynamic> toJson() => $HotSellingGoodEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HotSellingGoodResult {
	@JSONField(name: "_id")
	String? id = '';
	String? title = '';
	String? cid = '';
	int? price = 0;
	String? pic = '';
	@JSONField(name: "sub_title")
	String? subTitle = '';
	@JSONField(name: "s_pic")
	String? sPic = '';

	HotSellingGoodResult();

	factory HotSellingGoodResult.fromJson(Map<String, dynamic> json) => $HotSellingGoodResultFromJson(json);

	Map<String, dynamic> toJson() => $HotSellingGoodResultToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}