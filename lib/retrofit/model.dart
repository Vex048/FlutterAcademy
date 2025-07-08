import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';


@freezed
abstract class Model with _$Model {
  factory Model({
    required List<List<String>> timestamp,
    required String status,
    required String date,
    String? imageBase64
  }) = _Model;

  factory Model.fromJson(Map<String,Object?> json) => _$ModelFromJson(json);  

}

