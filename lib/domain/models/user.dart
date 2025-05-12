import 'package:xatter/utils/map_reader.dart';

class UserBase {
  final String name;

  UserBase({required this.name});

  factory UserBase.fromJson(MapReader mapReader) {
    return UserBase(name: mapReader.getStringOrEmpty('name'));
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}

class User extends UserBase {
  final String id;

  User({required this.id, required super.name});

  factory User.fromJson(MapReader mapReader) {
    final base = UserBase.fromJson(mapReader);

    return User(id: mapReader.getStringOrThrow('id'), name: base.name);
  }
}
