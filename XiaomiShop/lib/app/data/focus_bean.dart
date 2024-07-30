import 'package:json_annotation/json_annotation.dart';

part 'focus_bean.g.dart';

@JsonSerializable()
class FocusBean {
  List<FocusResultBean>? result;

  FocusBean({this.result});

  factory FocusBean.fromJson(Map<String, dynamic> json) => _$FocusBeanFromJson(json);

  Map<String, dynamic> toJson() => _$FocusBeanToJson(this);
}

@JsonSerializable()
class FocusResultBean {
  @JsonKey(name: "_id")
  String? id;
  String? title;
  String? status;
  String? pic;
  String? url;
  num? position;

  FocusResultBean({this.id, this.title, this.status, this.pic, this.url, this.position});

  factory FocusResultBean.fromJson(Map<String, dynamic> json) => _$FocusResultBeanFromJson(json);

  Map<String, dynamic> toJson() => _$FocusResultBeanToJson(this);
}

