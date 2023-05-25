import 'package:json_annotation/json_annotation.dart';

part 'headline_data.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class HeadlineData {
  @JsonKey(name: 'main')
  final String? main;

  HeadlineData({
    this.main,
  });

  factory HeadlineData.fromJson(Map<String, dynamic> json) => _$HeadlineDataFromJson(json);

  Map<String, dynamic> toJson() => _$HeadlineDataToJson(this);
}
