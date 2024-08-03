import 'package:xiaomishop/generated/json/base/json_convert_content.dart';
import 'package:xiaomishop/app/data/carousel_image_entity.dart';

CarouselImageEntity $CarouselImageEntityFromJson(Map<String, dynamic> json) {
  final CarouselImageEntity carouselImageEntity = CarouselImageEntity();
  final List<CarouselImageResult>? result = (json['result'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<CarouselImageResult>(e) as CarouselImageResult)
      .toList();
  if (result != null) {
    carouselImageEntity.result = result;
  }
  return carouselImageEntity;
}

Map<String, dynamic> $CarouselImageEntityToJson(CarouselImageEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['result'] = entity.result?.map((v) => v.toJson()).toList();
  return data;
}

extension CarouselImageEntityExtension on CarouselImageEntity {
  CarouselImageEntity copyWith({
    List<CarouselImageResult>? result,
  }) {
    return CarouselImageEntity()
      ..result = result ?? this.result;
  }
}

CarouselImageResult $CarouselImageResultFromJson(Map<String, dynamic> json) {
  final CarouselImageResult carouselImageResult = CarouselImageResult();
  final String? id = jsonConvert.convert<String>(json['_id']);
  if (id != null) {
    carouselImageResult.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    carouselImageResult.title = title;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    carouselImageResult.status = status;
  }
  final String? pic = jsonConvert.convert<String>(json['pic']);
  if (pic != null) {
    carouselImageResult.pic = pic;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    carouselImageResult.url = url;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    carouselImageResult.position = position;
  }
  return carouselImageResult;
}

Map<String, dynamic> $CarouselImageResultToJson(CarouselImageResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = entity.id;
  data['title'] = entity.title;
  data['status'] = entity.status;
  data['pic'] = entity.pic;
  data['url'] = entity.url;
  data['position'] = entity.position;
  return data;
}

extension CarouselImageResultExtension on CarouselImageResult {
  CarouselImageResult copyWith({
    String? id,
    String? title,
    String? status,
    String? pic,
    String? url,
    int? position,
  }) {
    return CarouselImageResult()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..status = status ?? this.status
      ..pic = pic ?? this.pic
      ..url = url ?? this.url
      ..position = position ?? this.position;
  }
}