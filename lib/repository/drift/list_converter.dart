import 'package:drift/drift.dart';

const _delimeter = ',';

class ListConverter<T> extends TypeConverter<List<T>, String> {
  ListConverter({required this.fromJson, required this.toJson});

  final T Function(dynamic) fromJson;
  final dynamic Function(T) toJson;

  @override
  List<T> mapToDart(String? fromDb) {
    if (fromDb == null) {
      return [];
    }
    return fromDb.split(_delimeter).map((e) => fromJson(e)).toList();
  }

  @override
  String? mapToSql(List<T>? value) {
    if (value == null) {
      return null;
    }

    return value.map((e) => toJson(e)).join(_delimeter);
  }
}
