import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'model.freezed.dart';
part 'model.g.dart';


@freezed
abstract class Model with _$Model {
  const Model._(); // Musze dodac konstruktor, aby moc uzywac metod
  factory Model({
    required List<List<String>> timestamp,
    required String status,
    required String date,
    String? imageBase64
  }) = _Model;

  factory Model.fromJson(Map<String,Object?> json) => _$ModelFromJson(json);  

  String formatDate(){
      DateTime now = DateTime.parse(this.date);
      var formatter = DateFormat.yMd().add_jm();
      var formatted = formatter.format(now);
      return formatted;
  }
}



