// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HabitTearOff {
  const _$HabitTearOff();

  _Habit call(
      {@Id() int id = isarAutoIncrementId,
      bool isChallenge = false,
      int? parentId,
      required String name,
      required DateTime createdAt,
      required DateTime startDate,
      DateTime? endDate,
      int? durationSeconds,
      String? description,
      bool isArchived = false,
      String? emojiIcon,
      List<TimeOfDay> reminders = const [],
      List<String> localFileAttachmentUris = const [],
      List<int> repeatDays = everyDay,
      String? targetGoal,
      int backgroundColor = 1}) {
    return _Habit(
      id: id,
      isChallenge: isChallenge,
      parentId: parentId,
      name: name,
      createdAt: createdAt,
      startDate: startDate,
      endDate: endDate,
      durationSeconds: durationSeconds,
      description: description,
      isArchived: isArchived,
      emojiIcon: emojiIcon,
      reminders: reminders,
      localFileAttachmentUris: localFileAttachmentUris,
      repeatDays: repeatDays,
      targetGoal: targetGoal,
      backgroundColor: backgroundColor,
    );
  }
}

/// @nodoc
const $Habit = _$HabitTearOff();

/// @nodoc
mixin _$Habit {
// local isar db unique autoincrement id
  @Id()
  int get id =>
      throw _privateConstructorUsedError; // true if this habit is part of a challenge
// TODO: implement challenges
  bool get isChallenge =>
      throw _privateConstructorUsedError; // if null, habit is a routine which could contain other habits
  int? get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate =>
      throw _privateConstructorUsedError; // duration of habit in seconds
  int? get durationSeconds => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  String? get emojiIcon =>
      throw _privateConstructorUsedError; // time during the day when app will notify about the routine
  List<TimeOfDay> get reminders =>
      throw _privateConstructorUsedError; // list of file uris
  List<String> get localFileAttachmentUris =>
      throw _privateConstructorUsedError; // days on which this habit will be repeated (DateTime.monday etc)
  List<int> get repeatDays => throw _privateConstructorUsedError;
  String? get targetGoal => throw _privateConstructorUsedError;
  int get backgroundColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res>;
  $Res call(
      {@Id() int id,
      bool isChallenge,
      int? parentId,
      String name,
      DateTime createdAt,
      DateTime startDate,
      DateTime? endDate,
      int? durationSeconds,
      String? description,
      bool isArchived,
      String? emojiIcon,
      List<TimeOfDay> reminders,
      List<String> localFileAttachmentUris,
      List<int> repeatDays,
      String? targetGoal,
      int backgroundColor});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res> implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  final Habit _value;
  // ignore: unused_field
  final $Res Function(Habit) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? isChallenge = freezed,
    Object? parentId = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? durationSeconds = freezed,
    Object? description = freezed,
    Object? isArchived = freezed,
    Object? emojiIcon = freezed,
    Object? reminders = freezed,
    Object? localFileAttachmentUris = freezed,
    Object? repeatDays = freezed,
    Object? targetGoal = freezed,
    Object? backgroundColor = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChallenge: isChallenge == freezed
          ? _value.isChallenge
          : isChallenge // ignore: cast_nullable_to_non_nullable
              as bool,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationSeconds: durationSeconds == freezed
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: isArchived == freezed
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      emojiIcon: emojiIcon == freezed
          ? _value.emojiIcon
          : emojiIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
      localFileAttachmentUris: localFileAttachmentUris == freezed
          ? _value.localFileAttachmentUris
          : localFileAttachmentUris // ignore: cast_nullable_to_non_nullable
              as List<String>,
      repeatDays: repeatDays == freezed
          ? _value.repeatDays
          : repeatDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      targetGoal: targetGoal == freezed
          ? _value.targetGoal
          : targetGoal // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$HabitCopyWith(_Habit value, $Res Function(_Habit) then) =
      __$HabitCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Id() int id,
      bool isChallenge,
      int? parentId,
      String name,
      DateTime createdAt,
      DateTime startDate,
      DateTime? endDate,
      int? durationSeconds,
      String? description,
      bool isArchived,
      String? emojiIcon,
      List<TimeOfDay> reminders,
      List<String> localFileAttachmentUris,
      List<int> repeatDays,
      String? targetGoal,
      int backgroundColor});
}

/// @nodoc
class __$HabitCopyWithImpl<$Res> extends _$HabitCopyWithImpl<$Res>
    implements _$HabitCopyWith<$Res> {
  __$HabitCopyWithImpl(_Habit _value, $Res Function(_Habit) _then)
      : super(_value, (v) => _then(v as _Habit));

  @override
  _Habit get _value => super._value as _Habit;

  @override
  $Res call({
    Object? id = freezed,
    Object? isChallenge = freezed,
    Object? parentId = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? durationSeconds = freezed,
    Object? description = freezed,
    Object? isArchived = freezed,
    Object? emojiIcon = freezed,
    Object? reminders = freezed,
    Object? localFileAttachmentUris = freezed,
    Object? repeatDays = freezed,
    Object? targetGoal = freezed,
    Object? backgroundColor = freezed,
  }) {
    return _then(_Habit(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChallenge: isChallenge == freezed
          ? _value.isChallenge
          : isChallenge // ignore: cast_nullable_to_non_nullable
              as bool,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationSeconds: durationSeconds == freezed
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: isArchived == freezed
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      emojiIcon: emojiIcon == freezed
          ? _value.emojiIcon
          : emojiIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
      localFileAttachmentUris: localFileAttachmentUris == freezed
          ? _value.localFileAttachmentUris
          : localFileAttachmentUris // ignore: cast_nullable_to_non_nullable
              as List<String>,
      repeatDays: repeatDays == freezed
          ? _value.repeatDays
          : repeatDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      targetGoal: targetGoal == freezed
          ? _value.targetGoal
          : targetGoal // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Habit implements _Habit {
  _$_Habit(
      {@Id() this.id = isarAutoIncrementId,
      this.isChallenge = false,
      this.parentId,
      required this.name,
      required this.createdAt,
      required this.startDate,
      this.endDate,
      this.durationSeconds,
      this.description,
      this.isArchived = false,
      this.emojiIcon,
      this.reminders = const [],
      this.localFileAttachmentUris = const [],
      this.repeatDays = everyDay,
      this.targetGoal,
      this.backgroundColor = 1})
      : assert(name.length != 0, 'name cannot be empty'),
        assert(name.length > 2 && name.length < 30,
            'name length should be > 2 && < 30'),
        assert(durationSeconds == null ? true : durationSeconds > 0,
            'duration should be more that 0'),
        assert(
            description == null
                ? true
                : description.length > 0 && description.length < 300,
            'desc length should be > 0 && < 300'),
        assert(endDate == null ? true : endDate.isAfter(startDate),
            'endDate should be after startDate'),
        assert(emojiIcon == null ? true : emojiIcon.length != 0,
            'emojiIcon cannot be empty'),
        assert(
            emojiIcon == null
                ? true
                : emojiIcon.length > 1 && emojiIcon.length < 5,
            'emojiIcon length should be > 1 && < 5');

  @JsonKey()
  @override // local isar db unique autoincrement id
  @Id()
  final int id;
  @JsonKey()
  @override // true if this habit is part of a challenge
// TODO: implement challenges
  final bool isChallenge;
  @override // if null, habit is a routine which could contain other habits
  final int? parentId;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override // duration of habit in seconds
  final int? durationSeconds;
  @override
  final String? description;
  @JsonKey()
  @override
  final bool isArchived;
  @override
  final String? emojiIcon;
  @JsonKey()
  @override // time during the day when app will notify about the routine
  final List<TimeOfDay> reminders;
  @JsonKey()
  @override // list of file uris
  final List<String> localFileAttachmentUris;
  @JsonKey()
  @override // days on which this habit will be repeated (DateTime.monday etc)
  final List<int> repeatDays;
  @override
  final String? targetGoal;
  @JsonKey()
  @override
  final int backgroundColor;

  @override
  String toString() {
    return 'Habit(id: $id, isChallenge: $isChallenge, parentId: $parentId, name: $name, createdAt: $createdAt, startDate: $startDate, endDate: $endDate, durationSeconds: $durationSeconds, description: $description, isArchived: $isArchived, emojiIcon: $emojiIcon, reminders: $reminders, localFileAttachmentUris: $localFileAttachmentUris, repeatDays: $repeatDays, targetGoal: $targetGoal, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Habit &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.isChallenge, isChallenge) &&
            const DeepCollectionEquality().equals(other.parentId, parentId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality()
                .equals(other.durationSeconds, durationSeconds) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.isArchived, isArchived) &&
            const DeepCollectionEquality().equals(other.emojiIcon, emojiIcon) &&
            const DeepCollectionEquality().equals(other.reminders, reminders) &&
            const DeepCollectionEquality().equals(
                other.localFileAttachmentUris, localFileAttachmentUris) &&
            const DeepCollectionEquality()
                .equals(other.repeatDays, repeatDays) &&
            const DeepCollectionEquality()
                .equals(other.targetGoal, targetGoal) &&
            const DeepCollectionEquality()
                .equals(other.backgroundColor, backgroundColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(isChallenge),
      const DeepCollectionEquality().hash(parentId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(durationSeconds),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isArchived),
      const DeepCollectionEquality().hash(emojiIcon),
      const DeepCollectionEquality().hash(reminders),
      const DeepCollectionEquality().hash(localFileAttachmentUris),
      const DeepCollectionEquality().hash(repeatDays),
      const DeepCollectionEquality().hash(targetGoal),
      const DeepCollectionEquality().hash(backgroundColor));

  @JsonKey(ignore: true)
  @override
  _$HabitCopyWith<_Habit> get copyWith =>
      __$HabitCopyWithImpl<_Habit>(this, _$identity);
}

abstract class _Habit implements Habit {
  factory _Habit(
      {@Id() int id,
      bool isChallenge,
      int? parentId,
      required String name,
      required DateTime createdAt,
      required DateTime startDate,
      DateTime? endDate,
      int? durationSeconds,
      String? description,
      bool isArchived,
      String? emojiIcon,
      List<TimeOfDay> reminders,
      List<String> localFileAttachmentUris,
      List<int> repeatDays,
      String? targetGoal,
      int backgroundColor}) = _$_Habit;

  @override // local isar db unique autoincrement id
  @Id()
  int get id;
  @override // true if this habit is part of a challenge
// TODO: implement challenges
  bool get isChallenge;
  @override // if null, habit is a routine which could contain other habits
  int? get parentId;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override // duration of habit in seconds
  int? get durationSeconds;
  @override
  String? get description;
  @override
  bool get isArchived;
  @override
  String? get emojiIcon;
  @override // time during the day when app will notify about the routine
  List<TimeOfDay> get reminders;
  @override // list of file uris
  List<String> get localFileAttachmentUris;
  @override // days on which this habit will be repeated (DateTime.monday etc)
  List<int> get repeatDays;
  @override
  String? get targetGoal;
  @override
  int get backgroundColor;
  @override
  @JsonKey(ignore: true)
  _$HabitCopyWith<_Habit> get copyWith => throw _privateConstructorUsedError;
}
