import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'headline_data.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class HeadlineData extends Equatable {
  @JsonKey(name: 'main')
  final String? main;

  const HeadlineData({
    this.main,
  });

  @override
  List<Object?> get props {
    return [
      main,
    ];
  }

  factory HeadlineData.fromJson(Map<String, dynamic> json) => _$HeadlineDataFromJson(json);

  Map<String, dynamic> toJson() => _$HeadlineDataToJson(this);
}
