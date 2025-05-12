import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xatter/utils/json_picker.dart';

class MapReader {
  // TODO : talvez achar uma forma dessa classe aqui lembrar de que algumas classes precisam de um id para serem instanciadas
  // considerando que o id exige lógica adicional ao extrair do firesetore
  final Map<String, dynamic> map;

  MapReader(this.map);

  String getStringOrEmpty(String key) => JsonPicker.getStringOrEmpty(map, key);
  String getStringOrThrow(String key) => JsonPicker.getStringOrThrow(map, key);
  String? getStringOrNull(String key) => JsonPicker.getStringOrNull(map, key);

  int getIntOrThrow(String key) => JsonPicker.getIntOrThrow(map, key);
  int getIntOrZero(String key) => JsonPicker.getIntOrZero(map, key);
  int? getIntOrNull(String key) => JsonPicker.getIntOrNull(map, key);

  Timestamp getTimestampOrThrow(String key) =>
      JsonPicker.getTimestampOrThrow(map, key);
  Timestamp? getTimestampOrNull(String key) =>
      JsonPicker.getTimestampOrNull(map, key);
  Timestamp getTimestampOrDefault(String key) =>
      JsonPicker.getTimestampOrDefault(map, key);

  bool getBoolOrThrow(String key) => JsonPicker.getBoolOrThrow(map, key);
  bool getBoolOrFalse(String key) => JsonPicker.getBoolOrFalse(map, key);
  bool? getBoolOrNull(String key) => JsonPicker.getBoolOrNull(map, key);
}
