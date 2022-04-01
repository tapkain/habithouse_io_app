// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shared_prefs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SharedPrefs _$SharedPrefsFromJson(Map<String, dynamic> json) {
  return _SharedPrefs.fromJson(json);
}

/// @nodoc
class _$SharedPrefsTearOff {
  const _$SharedPrefsTearOff();

  _SharedPrefs call({int id = autoIncrementId, bool isFirstLaunch = true}) {
    return _SharedPrefs(
      id: id,
      isFirstLaunch: isFirstLaunch,
    );
  }

  SharedPrefs fromJson(Map<String, Object?> json) {
    return SharedPrefs.fromJson(json);
  }
}

/// @nodoc
const $SharedPrefs = _$SharedPrefsTearOff();

/// @nodoc
mixin _$SharedPrefs {
  int get id => throw _privateConstructorUsedError;
  bool get isFirstLaunch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SharedPrefsCopyWith<SharedPrefs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedPrefsCopyWith<$Res> {
  factory $SharedPrefsCopyWith(
          SharedPrefs value, $Res Function(SharedPrefs) then) =
      _$SharedPrefsCopyWithImpl<$Res>;
  $Res call({int id, bool isFirstLaunch});
}

/// @nodoc
class _$SharedPrefsCopyWithImpl<$Res> implements $SharedPrefsCopyWith<$Res> {
  _$SharedPrefsCopyWithImpl(this._value, this._then);

  final SharedPrefs _value;
  // ignore: unused_field
  final $Res Function(SharedPrefs) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? isFirstLaunch = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isFirstLaunch: isFirstLaunch == freezed
          ? _value.isFirstLaunch
          : isFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SharedPrefsCopyWith<$Res>
    implements $SharedPrefsCopyWith<$Res> {
  factory _$SharedPrefsCopyWith(
          _SharedPrefs value, $Res Function(_SharedPrefs) then) =
      __$SharedPrefsCopyWithImpl<$Res>;
  @override
  $Res call({int id, bool isFirstLaunch});
}

/// @nodoc
class __$SharedPrefsCopyWithImpl<$Res> extends _$SharedPrefsCopyWithImpl<$Res>
    implements _$SharedPrefsCopyWith<$Res> {
  __$SharedPrefsCopyWithImpl(
      _SharedPrefs _value, $Res Function(_SharedPrefs) _then)
      : super(_value, (v) => _then(v as _SharedPrefs));

  @override
  _SharedPrefs get _value => super._value as _SharedPrefs;

  @override
  $Res call({
    Object? id = freezed,
    Object? isFirstLaunch = freezed,
  }) {
    return _then(_SharedPrefs(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isFirstLaunch: isFirstLaunch == freezed
          ? _value.isFirstLaunch
          : isFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SharedPrefs implements _SharedPrefs {
  const _$_SharedPrefs({this.id = autoIncrementId, this.isFirstLaunch = true});

  factory _$_SharedPrefs.fromJson(Map<String, dynamic> json) =>
      _$$_SharedPrefsFromJson(json);

  @JsonKey()
  @override
  final int id;
  @JsonKey()
  @override
  final bool isFirstLaunch;

  @override
  String toString() {
    return 'SharedPrefs(id: $id, isFirstLaunch: $isFirstLaunch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SharedPrefs &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.isFirstLaunch, isFirstLaunch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(isFirstLaunch));

  @JsonKey(ignore: true)
  @override
  _$SharedPrefsCopyWith<_SharedPrefs> get copyWith =>
      __$SharedPrefsCopyWithImpl<_SharedPrefs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SharedPrefsToJson(this);
  }
}

abstract class _SharedPrefs implements SharedPrefs {
  const factory _SharedPrefs({int id, bool isFirstLaunch}) = _$_SharedPrefs;

  factory _SharedPrefs.fromJson(Map<String, dynamic> json) =
      _$_SharedPrefs.fromJson;

  @override
  int get id;
  @override
  bool get isFirstLaunch;
  @override
  @JsonKey(ignore: true)
  _$SharedPrefsCopyWith<_SharedPrefs> get copyWith =>
      throw _privateConstructorUsedError;
}
