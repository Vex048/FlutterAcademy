// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Model _$ModelFromJson(Map<String, dynamic> json) => _Model(
  timestamp: (json['timestamp'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
      .toList(),
  status: json['status'] as String,
  date: json['date'] as String,
  imageBase64: json['imageBase64'] as String?,
);

Map<String, dynamic> _$ModelToJson(_Model instance) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'status': instance.status,
  'date': instance.date,
  'imageBase64': instance.imageBase64,
};
