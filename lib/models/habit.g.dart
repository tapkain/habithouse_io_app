// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetHabitCollection on Isar {
  IsarCollection<Habit> get habits {
    return getCollection('Habit');
  }
}

final HabitSchema = CollectionSchema(
  name: 'Habit',
  schema:
      '{"name":"Habit","properties":[{"name":"createdAt","type":"Long"},{"name":"description","type":"String"},{"name":"emojiIcon","type":"String"},{"name":"isArchived","type":"Byte"},{"name":"name","type":"String"},{"name":"parentId","type":"Long"},{"name":"reminders","type":"LongList"},{"name":"repeatCron","type":"String"},{"name":"targetGoal","type":"String"}],"indexes":[],"links":[]}',
  adapter: const _HabitAdapter(),
  idName: 'id',
  propertyIds: {
    'createdAt': 0,
    'description': 1,
    'emojiIcon': 2,
    'isArchived': 3,
    'name': 4,
    'parentId': 5,
    'reminders': 6,
    'repeatCron': 7,
    'targetGoal': 8
  },
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) => obj.id,
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 1,
);

class _HabitAdapter extends IsarTypeAdapter<Habit> {
  const _HabitAdapter();

  @override
  void serialize(IsarCollection<Habit> collection, IsarRawObject rawObj,
      Habit object, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.createdAt;
    final _createdAt = value0;
    final value1 = object.description;
    IsarUint8List? _description;
    if (value1 != null) {
      _description = BinaryWriter.utf8Encoder.convert(value1);
    }
    dynamicSize += _description?.length ?? 0;
    final value2 = object.emojiIcon;
    IsarUint8List? _emojiIcon;
    if (value2 != null) {
      _emojiIcon = BinaryWriter.utf8Encoder.convert(value2);
    }
    dynamicSize += _emojiIcon?.length ?? 0;
    final value3 = object.isArchived;
    final _isArchived = value3;
    final value4 = object.name;
    final _name = BinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += _name.length;
    final value5 = object.parentId;
    final _parentId = value5;
    final value6 = object.reminders;
    dynamicSize += (value6?.length ?? 0) * 8;
    final _reminders = value6;
    final value7 = object.repeatCron;
    IsarUint8List? _repeatCron;
    if (value7 != null) {
      _repeatCron = BinaryWriter.utf8Encoder.convert(value7);
    }
    dynamicSize += _repeatCron?.length ?? 0;
    final value8 = object.targetGoal;
    IsarUint8List? _targetGoal;
    if (value8 != null) {
      _targetGoal = BinaryWriter.utf8Encoder.convert(value8);
    }
    dynamicSize += _targetGoal?.length ?? 0;
    final size = dynamicSize + 67;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = bufAsBytes(rawObj.buffer, size);
    final writer = BinaryWriter(buffer, 67);
    writer.writeDateTime(offsets[0], _createdAt);
    writer.writeBytes(offsets[1], _description);
    writer.writeBytes(offsets[2], _emojiIcon);
    writer.writeBool(offsets[3], _isArchived);
    writer.writeBytes(offsets[4], _name);
    writer.writeLong(offsets[5], _parentId);
    writer.writeDateTimeList(offsets[6], _reminders);
    writer.writeBytes(offsets[7], _repeatCron);
    writer.writeBytes(offsets[8], _targetGoal);
  }

  @override
  Habit deserialize(IsarCollection<Habit> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = Habit();
    object.createdAt = reader.readDateTimeOrNull(offsets[0]);
    object.description = reader.readStringOrNull(offsets[1]);
    object.emojiIcon = reader.readStringOrNull(offsets[2]);
    object.id = id;
    object.isArchived = reader.readBool(offsets[3]);
    object.name = reader.readString(offsets[4]);
    object.parentId = reader.readLongOrNull(offsets[5]);
    object.reminders = reader.readDateTimeList(offsets[6]);
    object.repeatCron = reader.readStringOrNull(offsets[7]);
    object.targetGoal = reader.readStringOrNull(offsets[8]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, BinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 1:
        return (reader.readStringOrNull(offset)) as P;
      case 2:
        return (reader.readStringOrNull(offset)) as P;
      case 3:
        return (reader.readBool(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      case 5:
        return (reader.readLongOrNull(offset)) as P;
      case 6:
        return (reader.readDateTimeList(offset)) as P;
      case 7:
        return (reader.readStringOrNull(offset)) as P;
      case 8:
        return (reader.readStringOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension HabitQueryWhereSort on QueryBuilder<Habit, Habit, QWhere> {
  QueryBuilder<Habit, Habit, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension HabitQueryWhere on QueryBuilder<Habit, Habit, QWhereClause> {
  QueryBuilder<Habit, Habit, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Habit, Habit, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension HabitQueryFilter on QueryBuilder<Habit, Habit, QFilterCondition> {
  QueryBuilder<Habit, Habit, QAfterFilterCondition> createdAtIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'createdAt',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> descriptionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'description',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> emojiIconIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'emojiIcon',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> emojiIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'emojiIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> emojiIconGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'emojiIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> emojiIconLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'emojiIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> emojiIconBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'emojiIcon',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> emojiIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'emojiIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> emojiIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'emojiIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> emojiIconContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'emojiIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> emojiIconMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'emojiIcon',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> isArchivedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isArchived',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> parentIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'parentId',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> parentIdEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'parentId',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> parentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'parentId',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> parentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'parentId',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> parentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'parentId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> remindersIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'reminders',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> remindersAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'reminders',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> remindersAnyEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'reminders',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> remindersAnyGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'reminders',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> remindersAnyLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'reminders',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> remindersAnyBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'reminders',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> repeatCronIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'repeatCron',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> repeatCronEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'repeatCron',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> repeatCronGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'repeatCron',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> repeatCronLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'repeatCron',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> repeatCronBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'repeatCron',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> repeatCronStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'repeatCron',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> repeatCronEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'repeatCron',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> repeatCronContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'repeatCron',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> repeatCronMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'repeatCron',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> targetGoalIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'targetGoal',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> targetGoalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'targetGoal',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> targetGoalGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'targetGoal',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> targetGoalLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'targetGoal',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> targetGoalBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'targetGoal',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> targetGoalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'targetGoal',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> targetGoalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'targetGoal',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> targetGoalContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'targetGoal',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> targetGoalMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'targetGoal',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension HabitQueryWhereSortBy on QueryBuilder<Habit, Habit, QSortBy> {
  QueryBuilder<Habit, Habit, QAfterSortBy> sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByEmojiIcon() {
    return addSortByInternal('emojiIcon', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByEmojiIconDesc() {
    return addSortByInternal('emojiIcon', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByIsArchived() {
    return addSortByInternal('isArchived', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByIsArchivedDesc() {
    return addSortByInternal('isArchived', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByParentId() {
    return addSortByInternal('parentId', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByParentIdDesc() {
    return addSortByInternal('parentId', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByRepeatCron() {
    return addSortByInternal('repeatCron', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByRepeatCronDesc() {
    return addSortByInternal('repeatCron', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByTargetGoal() {
    return addSortByInternal('targetGoal', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByTargetGoalDesc() {
    return addSortByInternal('targetGoal', Sort.desc);
  }
}

extension HabitQueryWhereSortThenBy on QueryBuilder<Habit, Habit, QSortThenBy> {
  QueryBuilder<Habit, Habit, QAfterSortBy> thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByEmojiIcon() {
    return addSortByInternal('emojiIcon', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByEmojiIconDesc() {
    return addSortByInternal('emojiIcon', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByIsArchived() {
    return addSortByInternal('isArchived', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByIsArchivedDesc() {
    return addSortByInternal('isArchived', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByParentId() {
    return addSortByInternal('parentId', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByParentIdDesc() {
    return addSortByInternal('parentId', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByRepeatCron() {
    return addSortByInternal('repeatCron', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByRepeatCronDesc() {
    return addSortByInternal('repeatCron', Sort.desc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByTargetGoal() {
    return addSortByInternal('targetGoal', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByTargetGoalDesc() {
    return addSortByInternal('targetGoal', Sort.desc);
  }
}

extension HabitQueryWhereDistinct on QueryBuilder<Habit, Habit, QDistinct> {
  QueryBuilder<Habit, Habit, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByEmojiIcon(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('emojiIcon', caseSensitive: caseSensitive);
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByIsArchived() {
    return addDistinctByInternal('isArchived');
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByParentId() {
    return addDistinctByInternal('parentId');
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByRepeatCron(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('repeatCron', caseSensitive: caseSensitive);
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByTargetGoal(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('targetGoal', caseSensitive: caseSensitive);
  }
}

extension HabitQueryProperty on QueryBuilder<Habit, Habit, QQueryProperty> {
  QueryBuilder<Habit, DateTime?, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<Habit, String?, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<Habit, String?, QQueryOperations> emojiIconProperty() {
    return addPropertyNameInternal('emojiIcon');
  }

  QueryBuilder<Habit, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Habit, bool, QQueryOperations> isArchivedProperty() {
    return addPropertyNameInternal('isArchived');
  }

  QueryBuilder<Habit, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Habit, int?, QQueryOperations> parentIdProperty() {
    return addPropertyNameInternal('parentId');
  }

  QueryBuilder<Habit, List<DateTime>?, QQueryOperations> remindersProperty() {
    return addPropertyNameInternal('reminders');
  }

  QueryBuilder<Habit, String?, QQueryOperations> repeatCronProperty() {
    return addPropertyNameInternal('repeatCron');
  }

  QueryBuilder<Habit, String?, QQueryOperations> targetGoalProperty() {
    return addPropertyNameInternal('targetGoal');
  }
}
