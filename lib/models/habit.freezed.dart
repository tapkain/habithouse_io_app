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

Habit _$HabitFromJson(Map<String, dynamic> json) {
  return _Habit.fromJson(json);
}

/// @nodoc
class _$HabitTearOff {
  const _$HabitTearOff();

  _Habit call(
      {int id = autoIncrementId,
      bool isChallenge = false,
      int? parentId,
      required String name,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          required DateTime createdAt,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          required DateTime startDate,
      @JsonKey(fromJson: DateTimeUtils.fromJsonN, toJson: DateTimeUtils.toJsonN)
          DateTime? endDate,
      int? durationSeconds,
      String? description,
      bool isArchived = false,
      String? emojiIcon,
      @JsonKey(toJson: remindersToJson, fromJson: remindersFromJson)
          List<TimeOfDay> reminders = const [],
      List<String> localFileAttachmentUris = const [],
      List<int> repeatDays = DateFormatUtils.everyDay,
      String? targetGoal,
      int backgroundColor = 1,
      int sortKey = 0}) {
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
      sortKey: sortKey,
    );
  }

  Habit fromJson(Map<String, Object?> json) {
    return Habit.fromJson(json);
  }
}

/// @nodoc
const $Habit = _$HabitTearOff();

/// @nodoc
mixin _$Habit {
  int get id =>
      throw _privateConstructorUsedError; // true if this habit is part of a challenge
// TODO: implement challenges
  bool get isChallenge =>
      throw _privateConstructorUsedError; // if null, habit is a routine which could contain other habits
  int? get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTimeUtils.fromJsonN, toJson: DateTimeUtils.toJsonN)
  DateTime? get endDate =>
      throw _privateConstructorUsedError; // duration of habit in seconds
  int? get durationSeconds => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  String? get emojiIcon =>
      throw _privateConstructorUsedError; // time during the day when app will notify about the routine
  @JsonKey(toJson: remindersToJson, fromJson: remindersFromJson)
  List<TimeOfDay> get reminders =>
      throw _privateConstructorUsedError; // list of file uris
  List<String> get localFileAttachmentUris =>
      throw _privateConstructorUsedError; // days on which this habit will be repeated (DateTime.monday etc)
  List<int> get repeatDays => throw _privateConstructorUsedError;
  String? get targetGoal => throw _privateConstructorUsedError;
  int get backgroundColor =>
      throw _privateConstructorUsedError; // key to sort in queries and to display in UI
  int get sortKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res>;
  $Res call(
      {int id,
      bool isChallenge,
      int? parentId,
      String name,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          DateTime createdAt,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          DateTime startDate,
      @JsonKey(fromJson: DateTimeUtils.fromJsonN, toJson: DateTimeUtils.toJsonN)
          DateTime? endDate,
      int? durationSeconds,
      String? description,
      bool isArchived,
      String? emojiIcon,
      @JsonKey(toJson: remindersToJson, fromJson: remindersFromJson)
          List<TimeOfDay> reminders,
      List<String> localFileAttachmentUris,
      List<int> repeatDays,
      String? targetGoal,
      int backgroundColor,
      int sortKey});
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
    Object? sortKey = freezed,
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
      sortKey: sortKey == freezed
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
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
      {int id,
      bool isChallenge,
      int? parentId,
      String name,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          DateTime createdAt,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          DateTime startDate,
      @JsonKey(fromJson: DateTimeUtils.fromJsonN, toJson: DateTimeUtils.toJsonN)
          DateTime? endDate,
      int? durationSeconds,
      String? description,
      bool isArchived,
      String? emojiIcon,
      @JsonKey(toJson: remindersToJson, fromJson: remindersFromJson)
          List<TimeOfDay> reminders,
      List<String> localFileAttachmentUris,
      List<int> repeatDays,
      String? targetGoal,
      int backgroundColor,
      int sortKey});
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
    Object? sortKey = freezed,
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
      sortKey: sortKey == freezed
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Habit implements _Habit {
  _$_Habit(
      {this.id = autoIncrementId,
      this.isChallenge = false,
      this.parentId,
      required this.name,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          required this.createdAt,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          required this.startDate,
      @JsonKey(fromJson: DateTimeUtils.fromJsonN, toJson: DateTimeUtils.toJsonN)
          this.endDate,
      this.durationSeconds,
      this.description,
      this.isArchived = false,
      this.emojiIcon,
      @JsonKey(toJson: remindersToJson, fromJson: remindersFromJson)
          this.reminders = const [],
      this.localFileAttachmentUris = const [],
      this.repeatDays = DateFormatUtils.everyDay,
      this.targetGoal,
      this.backgroundColor = 1,
      this.sortKey = 0})
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
        assert((startDate.date + 1.seconds).isAfter(createdAt.date),
            'startDate should be after createdAt'),
        assert(emojiIcon == null ? true : emojiIcon.length != 0,
            'emojiIcon cannot be empty');

  factory _$_Habit.fromJson(Map<String, dynamic> json) =>
      _$$_HabitFromJson(json);

  @JsonKey()
  @override
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
  @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
  final DateTime startDate;
  @override
  @JsonKey(fromJson: DateTimeUtils.fromJsonN, toJson: DateTimeUtils.toJsonN)
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
  @override // time during the day when app will notify about the routine
  @JsonKey(toJson: remindersToJson, fromJson: remindersFromJson)
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
  @JsonKey()
  @override // key to sort in queries and to display in UI
  final int sortKey;

  @override
  String toString() {
    return 'Habit(id: $id, isChallenge: $isChallenge, parentId: $parentId, name: $name, createdAt: $createdAt, startDate: $startDate, endDate: $endDate, durationSeconds: $durationSeconds, description: $description, isArchived: $isArchived, emojiIcon: $emojiIcon, reminders: $reminders, localFileAttachmentUris: $localFileAttachmentUris, repeatDays: $repeatDays, targetGoal: $targetGoal, backgroundColor: $backgroundColor, sortKey: $sortKey)';
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
                .equals(other.backgroundColor, backgroundColor) &&
            const DeepCollectionEquality().equals(other.sortKey, sortKey));
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
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(sortKey));

  @JsonKey(ignore: true)
  @override
  _$HabitCopyWith<_Habit> get copyWith =>
      __$HabitCopyWithImpl<_Habit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HabitToJson(this);
  }
}

abstract class _Habit implements Habit {
  factory _Habit(
      {int id,
      bool isChallenge,
      int? parentId,
      required String name,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          required DateTime createdAt,
      @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
          required DateTime startDate,
      @JsonKey(fromJson: DateTimeUtils.fromJsonN, toJson: DateTimeUtils.toJsonN)
          DateTime? endDate,
      int? durationSeconds,
      String? description,
      bool isArchived,
      String? emojiIcon,
      @JsonKey(toJson: remindersToJson, fromJson: remindersFromJson)
          List<TimeOfDay> reminders,
      List<String> localFileAttachmentUris,
      List<int> repeatDays,
      String? targetGoal,
      int backgroundColor,
      int sortKey}) = _$_Habit;

  factory _Habit.fromJson(Map<String, dynamic> json) = _$_Habit.fromJson;

  @override
  int get id;
  @override // true if this habit is part of a challenge
// TODO: implement challenges
  bool get isChallenge;
  @override // if null, habit is a routine which could contain other habits
  int? get parentId;
  @override
  String get name;
  @override
  @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
  DateTime get startDate;
  @override
  @JsonKey(fromJson: DateTimeUtils.fromJsonN, toJson: DateTimeUtils.toJsonN)
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
  @JsonKey(toJson: remindersToJson, fromJson: remindersFromJson)
  List<TimeOfDay> get reminders;
  @override // list of file uris
  List<String> get localFileAttachmentUris;
  @override // days on which this habit will be repeated (DateTime.monday etc)
  List<int> get repeatDays;
  @override
  String? get targetGoal;
  @override
  int get backgroundColor;
  @override // key to sort in queries and to display in UI
  int get sortKey;
  @override
  @JsonKey(ignore: true)
  _$HabitCopyWith<_Habit> get copyWith => throw _privateConstructorUsedError;
}
