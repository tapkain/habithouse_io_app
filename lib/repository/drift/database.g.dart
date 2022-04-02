// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class HabitTableData extends DataClass implements Insertable<HabitTableData> {
  final int id;
  final int? parentId;
  final String name;
  final DateTime createdAt;
  final DateTime startDate;
  final DateTime? endDate;
  final int? durationSeconds;
  final String? description;
  final String? emojiIcon;
  final int? backgroundColor;
  final List<int> repeatDays;
  HabitTableData(
      {required this.id,
      this.parentId,
      required this.name,
      required this.createdAt,
      required this.startDate,
      this.endDate,
      this.durationSeconds,
      this.description,
      this.emojiIcon,
      this.backgroundColor,
      required this.repeatDays});
  factory HabitTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HabitTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      parentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      startDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date'])!,
      endDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      durationSeconds: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}duration_seconds']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      emojiIcon: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}emoji_icon']),
      backgroundColor: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}background_color']),
      repeatDays: $HabitTableTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}repeat_days']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int?>(parentId);
    }
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime?>(endDate);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int?>(durationSeconds);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || emojiIcon != null) {
      map['emoji_icon'] = Variable<String?>(emojiIcon);
    }
    if (!nullToAbsent || backgroundColor != null) {
      map['background_color'] = Variable<int?>(backgroundColor);
    }
    {
      final converter = $HabitTableTable.$converter0;
      map['repeat_days'] = Variable<String>(converter.mapToSql(repeatDays)!);
    }
    return map;
  }

  HabitTableCompanion toCompanion(bool nullToAbsent) {
    return HabitTableCompanion(
      id: Value(id),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      name: Value(name),
      createdAt: Value(createdAt),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      emojiIcon: emojiIcon == null && nullToAbsent
          ? const Value.absent()
          : Value(emojiIcon),
      backgroundColor: backgroundColor == null && nullToAbsent
          ? const Value.absent()
          : Value(backgroundColor),
      repeatDays: Value(repeatDays),
    );
  }

  factory HabitTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitTableData(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      description: serializer.fromJson<String?>(json['description']),
      emojiIcon: serializer.fromJson<String?>(json['emojiIcon']),
      backgroundColor: serializer.fromJson<int?>(json['backgroundColor']),
      repeatDays: serializer.fromJson<List<int>>(json['repeatDays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int?>(parentId),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'description': serializer.toJson<String?>(description),
      'emojiIcon': serializer.toJson<String?>(emojiIcon),
      'backgroundColor': serializer.toJson<int?>(backgroundColor),
      'repeatDays': serializer.toJson<List<int>>(repeatDays),
    };
  }

  HabitTableData copyWith(
          {int? id,
          int? parentId,
          String? name,
          DateTime? createdAt,
          DateTime? startDate,
          DateTime? endDate,
          int? durationSeconds,
          String? description,
          String? emojiIcon,
          int? backgroundColor,
          List<int>? repeatDays}) =>
      HabitTableData(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        durationSeconds: durationSeconds ?? this.durationSeconds,
        description: description ?? this.description,
        emojiIcon: emojiIcon ?? this.emojiIcon,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        repeatDays: repeatDays ?? this.repeatDays,
      );
  @override
  String toString() {
    return (StringBuffer('HabitTableData(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('description: $description, ')
          ..write('emojiIcon: $emojiIcon, ')
          ..write('backgroundColor: $backgroundColor, ')
          ..write('repeatDays: $repeatDays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      parentId,
      name,
      createdAt,
      startDate,
      endDate,
      durationSeconds,
      description,
      emojiIcon,
      backgroundColor,
      repeatDays);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitTableData &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.durationSeconds == this.durationSeconds &&
          other.description == this.description &&
          other.emojiIcon == this.emojiIcon &&
          other.backgroundColor == this.backgroundColor &&
          other.repeatDays == this.repeatDays);
}

class HabitTableCompanion extends UpdateCompanion<HabitTableData> {
  final Value<int> id;
  final Value<int?> parentId;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<int?> durationSeconds;
  final Value<String?> description;
  final Value<String?> emojiIcon;
  final Value<int?> backgroundColor;
  final Value<List<int>> repeatDays;
  const HabitTableCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.description = const Value.absent(),
    this.emojiIcon = const Value.absent(),
    this.backgroundColor = const Value.absent(),
    this.repeatDays = const Value.absent(),
  });
  HabitTableCompanion.insert({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    required String name,
    required DateTime createdAt,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.description = const Value.absent(),
    this.emojiIcon = const Value.absent(),
    this.backgroundColor = const Value.absent(),
    required List<int> repeatDays,
  })  : name = Value(name),
        createdAt = Value(createdAt),
        startDate = Value(startDate),
        repeatDays = Value(repeatDays);
  static Insertable<HabitTableData> custom({
    Expression<int>? id,
    Expression<int?>? parentId,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? startDate,
    Expression<DateTime?>? endDate,
    Expression<int?>? durationSeconds,
    Expression<String?>? description,
    Expression<String?>? emojiIcon,
    Expression<int?>? backgroundColor,
    Expression<List<int>>? repeatDays,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (description != null) 'description': description,
      if (emojiIcon != null) 'emoji_icon': emojiIcon,
      if (backgroundColor != null) 'background_color': backgroundColor,
      if (repeatDays != null) 'repeat_days': repeatDays,
    });
  }

  HabitTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? parentId,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<DateTime>? startDate,
      Value<DateTime?>? endDate,
      Value<int?>? durationSeconds,
      Value<String?>? description,
      Value<String?>? emojiIcon,
      Value<int?>? backgroundColor,
      Value<List<int>>? repeatDays}) {
    return HabitTableCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      description: description ?? this.description,
      emojiIcon: emojiIcon ?? this.emojiIcon,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      repeatDays: repeatDays ?? this.repeatDays,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int?>(parentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime?>(endDate.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int?>(durationSeconds.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (emojiIcon.present) {
      map['emoji_icon'] = Variable<String?>(emojiIcon.value);
    }
    if (backgroundColor.present) {
      map['background_color'] = Variable<int?>(backgroundColor.value);
    }
    if (repeatDays.present) {
      final converter = $HabitTableTable.$converter0;
      map['repeat_days'] =
          Variable<String>(converter.mapToSql(repeatDays.value)!);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitTableCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('description: $description, ')
          ..write('emojiIcon: $emojiIcon, ')
          ..write('backgroundColor: $backgroundColor, ')
          ..write('repeatDays: $repeatDays')
          ..write(')'))
        .toString();
  }
}

class $HabitTableTable extends HabitTable
    with TableInfo<$HabitTableTable, HabitTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int?> parentId = GeneratedColumn<int?>(
      'parent_id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES habit_table (id)');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime?> startDate = GeneratedColumn<DateTime?>(
      'start_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime?> endDate = GeneratedColumn<DateTime?>(
      'end_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<int?> durationSeconds = GeneratedColumn<int?>(
      'duration_seconds', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _emojiIconMeta = const VerificationMeta('emojiIcon');
  @override
  late final GeneratedColumn<String?> emojiIcon = GeneratedColumn<String?>(
      'emoji_icon', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _backgroundColorMeta =
      const VerificationMeta('backgroundColor');
  @override
  late final GeneratedColumn<int?> backgroundColor = GeneratedColumn<int?>(
      'background_color', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _repeatDaysMeta = const VerificationMeta('repeatDays');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String?> repeatDays =
      GeneratedColumn<String?>('repeat_days', aliasedName, false,
              type: const StringType(), requiredDuringInsert: true)
          .withConverter<List<int>>($HabitTableTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        parentId,
        name,
        createdAt,
        startDate,
        endDate,
        durationSeconds,
        description,
        emojiIcon,
        backgroundColor,
        repeatDays
      ];
  @override
  String get aliasedName => _alias ?? 'habit_table';
  @override
  String get actualTableName => 'habit_table';
  @override
  VerificationContext validateIntegrity(Insertable<HabitTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('emoji_icon')) {
      context.handle(_emojiIconMeta,
          emojiIcon.isAcceptableOrUnknown(data['emoji_icon']!, _emojiIconMeta));
    }
    if (data.containsKey('background_color')) {
      context.handle(
          _backgroundColorMeta,
          backgroundColor.isAcceptableOrUnknown(
              data['background_color']!, _backgroundColorMeta));
    }
    context.handle(_repeatDaysMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return HabitTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HabitTableTable createAlias(String alias) {
    return $HabitTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converter0 = ListConverter<int>(
      fromJson: (j) => int.parse(j), toJson: (v) => v.toString());
}

class HabitEntryTableData extends DataClass
    implements Insertable<HabitEntryTableData> {
  final int id;
  final int habitId;
  final DateTime createdAt;
  HabitEntryTableData(
      {required this.id, required this.habitId, required this.createdAt});
  factory HabitEntryTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HabitEntryTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      habitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}habit_id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['habit_id'] = Variable<int>(habitId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HabitEntryTableCompanion toCompanion(bool nullToAbsent) {
    return HabitEntryTableCompanion(
      id: Value(id),
      habitId: Value(habitId),
      createdAt: Value(createdAt),
    );
  }

  factory HabitEntryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitEntryTableData(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<int>(json['habitId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<int>(habitId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HabitEntryTableData copyWith({int? id, int? habitId, DateTime? createdAt}) =>
      HabitEntryTableData(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('HabitEntryTableData(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habitId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitEntryTableData &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.createdAt == this.createdAt);
}

class HabitEntryTableCompanion extends UpdateCompanion<HabitEntryTableData> {
  final Value<int> id;
  final Value<int> habitId;
  final Value<DateTime> createdAt;
  const HabitEntryTableCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HabitEntryTableCompanion.insert({
    this.id = const Value.absent(),
    required int habitId,
    required DateTime createdAt,
  })  : habitId = Value(habitId),
        createdAt = Value(createdAt);
  static Insertable<HabitEntryTableData> custom({
    Expression<int>? id,
    Expression<int>? habitId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HabitEntryTableCompanion copyWith(
      {Value<int>? id, Value<int>? habitId, Value<DateTime>? createdAt}) {
    return HabitEntryTableCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitEntryTableCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HabitEntryTableTable extends HabitEntryTable
    with TableInfo<$HabitEntryTableTable, HabitEntryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitEntryTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _habitIdMeta = const VerificationMeta('habitId');
  @override
  late final GeneratedColumn<int?> habitId = GeneratedColumn<int?>(
      'habit_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES habit_table (id)');
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, habitId, createdAt];
  @override
  String get aliasedName => _alias ?? 'habit_entry_table';
  @override
  String get actualTableName => 'habit_entry_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<HabitEntryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitEntryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return HabitEntryTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HabitEntryTableTable createAlias(String alias) {
    return $HabitEntryTableTable(attachedDatabase, alias);
  }
}

class SharedPrefsTableData extends DataClass
    implements Insertable<SharedPrefsTableData> {
  final int id;
  final bool isFirstLaunch;
  SharedPrefsTableData({required this.id, required this.isFirstLaunch});
  factory SharedPrefsTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SharedPrefsTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      isFirstLaunch: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_first_launch'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_first_launch'] = Variable<bool>(isFirstLaunch);
    return map;
  }

  SharedPrefsTableCompanion toCompanion(bool nullToAbsent) {
    return SharedPrefsTableCompanion(
      id: Value(id),
      isFirstLaunch: Value(isFirstLaunch),
    );
  }

  factory SharedPrefsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SharedPrefsTableData(
      id: serializer.fromJson<int>(json['id']),
      isFirstLaunch: serializer.fromJson<bool>(json['isFirstLaunch']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isFirstLaunch': serializer.toJson<bool>(isFirstLaunch),
    };
  }

  SharedPrefsTableData copyWith({int? id, bool? isFirstLaunch}) =>
      SharedPrefsTableData(
        id: id ?? this.id,
        isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
      );
  @override
  String toString() {
    return (StringBuffer('SharedPrefsTableData(')
          ..write('id: $id, ')
          ..write('isFirstLaunch: $isFirstLaunch')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isFirstLaunch);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SharedPrefsTableData &&
          other.id == this.id &&
          other.isFirstLaunch == this.isFirstLaunch);
}

class SharedPrefsTableCompanion extends UpdateCompanion<SharedPrefsTableData> {
  final Value<int> id;
  final Value<bool> isFirstLaunch;
  const SharedPrefsTableCompanion({
    this.id = const Value.absent(),
    this.isFirstLaunch = const Value.absent(),
  });
  SharedPrefsTableCompanion.insert({
    this.id = const Value.absent(),
    this.isFirstLaunch = const Value.absent(),
  });
  static Insertable<SharedPrefsTableData> custom({
    Expression<int>? id,
    Expression<bool>? isFirstLaunch,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isFirstLaunch != null) 'is_first_launch': isFirstLaunch,
    });
  }

  SharedPrefsTableCompanion copyWith(
      {Value<int>? id, Value<bool>? isFirstLaunch}) {
    return SharedPrefsTableCompanion(
      id: id ?? this.id,
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isFirstLaunch.present) {
      map['is_first_launch'] = Variable<bool>(isFirstLaunch.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SharedPrefsTableCompanion(')
          ..write('id: $id, ')
          ..write('isFirstLaunch: $isFirstLaunch')
          ..write(')'))
        .toString();
  }
}

class $SharedPrefsTableTable extends SharedPrefsTable
    with TableInfo<$SharedPrefsTableTable, SharedPrefsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SharedPrefsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _isFirstLaunchMeta =
      const VerificationMeta('isFirstLaunch');
  @override
  late final GeneratedColumn<bool?> isFirstLaunch = GeneratedColumn<bool?>(
      'is_first_launch', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_first_launch IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, isFirstLaunch];
  @override
  String get aliasedName => _alias ?? 'shared_prefs_table';
  @override
  String get actualTableName => 'shared_prefs_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<SharedPrefsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_first_launch')) {
      context.handle(
          _isFirstLaunchMeta,
          isFirstLaunch.isAcceptableOrUnknown(
              data['is_first_launch']!, _isFirstLaunchMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SharedPrefsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SharedPrefsTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SharedPrefsTableTable createAlias(String alias) {
    return $SharedPrefsTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $HabitTableTable habitTable = $HabitTableTable(this);
  late final $HabitEntryTableTable habitEntryTable =
      $HabitEntryTableTable(this);
  late final $SharedPrefsTableTable sharedPrefsTable =
      $SharedPrefsTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [habitTable, habitEntryTable, sharedPrefsTable];
}
