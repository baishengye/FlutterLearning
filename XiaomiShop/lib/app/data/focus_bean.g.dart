// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusBean _$FocusBeanFromJson(Map<String, dynamic> json) => FocusBean(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => FocusResultBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FocusBeanToJson(FocusBean instance) => <String, dynamic>{
      'result': instance.result,
    };

FocusResultBean _$FocusResultBeanFromJson(Map<String, dynamic> json) =>
    FocusResultBean(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      status: json['status'] as String?,
      pic: json['pic'] as String?,
      url: json['url'] as String?,
      position: json['position'] as num?,
    );

Map<String, dynamic> _$FocusResultBeanToJson(FocusResultBean instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'pic': instance.pic,
      'url': instance.url,
      'position': instance.position,
    };
