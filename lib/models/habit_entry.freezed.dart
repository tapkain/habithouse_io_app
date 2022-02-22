// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'habit_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HabitEntryTearOff {
  const _$HabitEntryTearOff();

  _HabitEntry call(
      {@Id() int id = isarAutoIncrementId,
      required int habitId,
      required DateTime createdAt,
      String? targetGoal}) {
    return _HabitEntry(
      id: id,
      habitId: habitId,
      createdAt: createdAt,
      targetGoal: targetGoal,
    );
  }
}

/// @nodoc
const $HabitEntry = _$HabitEntryTearOff();

/// @nodoc
mixin _$HabitEntry {
  @Id()
  int get id => throw _privateConstructorUsedError;
  int get habitId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get targetGoal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HabitEntryCopyWith<HabitEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitEntryCopyWith<$Res> {
  factory $HabitEntryCopyWith(
          HabitEntry value, $Res Function(HabitEntry) then) =
      _$HabitEntryCopyWithImpl<$Res>;
  $Res call(
      {@Id() int id, int habitId, DateTime createdAt, String? targetGoal});
}

/// @nodoc
class _$HabitEntryCopyWithImpl<$Res> implements $HabitEntryCopyWith<$Res> {
  _$HabitEntryCopyWithImpl(this._value, this._then);

  final HabitEntry _value;
  // ignore: unused_field
  final $Res Function(HabitEntry) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? habitId = freezed,
    Object? createdAt = freezed,
    Object? targetGoal = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      habitId: habitId == freezed
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetGoal: targetGoal == freezed
          ? _value.targetGoal
          : targetGoal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HabitEntryCopyWith<$Res> implements $HabitEntryCopyWith<$Res> {
  factory _$HabitEntryCopyWith(
          _HabitEntry value, $Res Function(_HabitEntry) then) =
      __$HabitEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Id() int id, int habitId, DateTime createdAt, String? targetGoal});
}

/// @nodoc
class __$HabitEntryCopyWithImpl<$Res> extends _$HabitEntryCopyWithImpl<$Res>
    implements _$HabitEntryCopyWith<$Res> {
  __$HabitEntryCopyWithImpl(
      _HabitEntry _value, $Res Function(_HabitEntry) _then)
      : super(_value, (v) => _then(v as _HabitEntry));

  @override
  _HabitEntry get _value => super._value as _HabitEntry;

  @override
  $Res call({
    Object? id = freezed,
    Object? habitId = freezed,
    Object? createdAt = freezed,
    Object? targetGoal = freezed,
  }) {
    return _then(_HabitEntry(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      habitId: habitId == freezed
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetGoal: targetGoal == freezed
          ? _value.targetGoal
          : targetGoal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HabitEntry implements _HabitEntry {
  const _$_HabitEntry(
      {@Id() this.id = isarAutoIncrementId,
      required this.habitId,
      required this.createdAt,
      this.targetGoal});

  @JsonKey()
  @override
  @Id()
  final int id;
  @override
  final int habitId;
  @override
  final DateTime createdAt;
  @override
  final String? targetGoal;

  @override
  String toString() {
    return 'HabitEntry(id: $id, habitId: $habitId, createdAt: $createdAt, targetGoal: $targetGoal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HabitEntry &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.habitId, habitId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.targetGoal, targetGoal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(habitId),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(targetGoal));

  @JsonKey(ignore: true)
  @override
  _$HabitEntryCopyWith<_HabitEntry> get copyWith =>
      __$HabitEntryCopyWithImpl<_HabitEntry>(this, _$identity);
}

abstract class _HabitEntry implements HabitEntry {
  const factory _HabitEntry(
      {@Id() int id,
      required int habitId,
      required DateTime createdAt,
      String? targetGoal}) = _$_HabitEntry;

  @override
  @Id()
  int get id;
  @override
  int get habitId;
  @override
  DateTime get createdAt;
  @override
  String? get targetGoal;
  @override
  @JsonKey(ignore: true)
  _$HabitEntryCopyWith<_HabitEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
