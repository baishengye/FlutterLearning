import 'package:xiaomishop/generated/json/base/json_field.dart';
import 'package:xiaomishop/generated/json/carousel_image_entity.g.dart';
import 'dart:convert';
export 'package:xiaomishop/generated/json/carousel_image_entity.g.dart';

@JsonSerializable()
class CarouselImageEntity {
	List<CarouselImageResult> result = [];

	CarouselImageEntity();

	factory CarouselImageEntity.fromJson(Map<String, dynamic> json) => $CarouselImageEntityFromJson(json);

	Map<String, dynamic> toJson() => $CarouselImageEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CarouselImageResult {
	@JSONField(name: "_id")
	String id = '';
	String title = '';
	String status = '';
	String pic = '';
	String url = '';
	int position = 0;

	CarouselImageResult();

	factory CarouselImageResult.fromJson(Map<String, dynamic> json) => $CarouselImageResultFromJson(json);

	Map<String, dynamic> toJson() => $CarouselImageResultToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}