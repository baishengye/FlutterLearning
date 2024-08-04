import 'package:xiaomishop/generated/json/base/json_convert_content.dart';
import 'package:xiaomishop/app/data/hot_selling_good_entity.dart';

HotSellingGoodEntity $HotSellingGoodEntityFromJson(Map<String, dynamic> json) {
  final HotSellingGoodEntity hotSellingGoodEntity = HotSellingGoodEntity();
  final List<HotSellingGoodResult>? result = (json['result'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<HotSellingGoodResult>(e) as HotSellingGoodResult)
      .toList();
  if (result != null) {
    hotSellingGoodEntity.result = result;
  }
  return hotSellingGoodEntity;
}

Map<String, dynamic> $HotSellingGoodEntityToJson(HotSellingGoodEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['result'] = entity.result?.map((v) => v.toJson()).toList();
  return data;
}

extension HotSellingGoodEntityExtension on HotSellingGoodEntity {
  HotSellingGoodEntity copyWith({
    List<HotSellingGoodResult>? result,
  }) {
    return HotSellingGoodEntity()
      ..result = result ?? this.result;
  }
}

HotSellingGoodResult $HotSellingGoodResultFromJson(Map<String, dynamic> json) {
  final HotSellingGoodResult hotSellingGoodResult = HotSellingGoodResult();
  final String? id = jsonConvert.convert<String>(json['_id']);
  if (id != null) {
    hotSellingGoodResult.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    hotSellingGoodResult.title = title;
  }
  final String? cid = jsonConvert.convert<String>(json['cid']);
  if (cid != null) {
    hotSellingGoodResult.cid = cid;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    hotSellingGoodResult.price = price;
  }
  final String? pic = jsonConvert.convert<String>(json['pic']);
  if (pic != null) {
    hotSellingGoodResult.pic = pic;
  }
  final String? subTitle = jsonConvert.convert<String>(json['sub_title']);
  if (subTitle != null) {
    hotSellingGoodResult.subTitle = subTitle;
  }
  final String? sPic = jsonConvert.convert<String>(json['s_pic']);
  if (sPic != null) {
    hotSellingGoodResult.sPic = sPic;
  }
  return hotSellingGoodResult;
}

Map<String, dynamic> $HotSellingGoodResultToJson(HotSellingGoodResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = entity.id;
  data['title'] = entity.title;
  data['cid'] = entity.cid;
  data['price'] = entity.price;
  data['pic'] = entity.pic;
  data['sub_title'] = entity.subTitle;
  data['s_pic'] = entity.sPic;
  return data;
}

extension HotSellingGoodResultExtension on HotSellingGoodResult {
  HotSellingGoodResult copyWith({
    String? id,
    String? title,
    String? cid,
    int? price,
    String? pic,
    String? subTitle,
    String? sPic,
  }) {
    return HotSellingGoodResult()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..cid = cid ?? this.cid
      ..price = price ?? this.price
      ..pic = pic ?? this.pic
      ..subTitle = subTitle ?? this.subTitle
      ..sPic = sPic ?? this.sPic;
  }
}