// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetHabitCollection on Isar {
  IsarCollection<Habit> get habits {
    return getCollection('Habit');
  }
}

final HabitSchema = CollectionSchema(
  name: 'Habit',
  schema:
      '{"name":"Habit","idName":"id","properties":[{"name":"backgroundColor","type":"Long"},{"name":"createdAt","type":"Long"},{"name":"description","type":"String"},{"name":"durationSeconds","type":"Long"},{"name":"emojiIcon","type":"String"},{"name":"isArchived","type":"Bool"},{"name":"localFileAttachmentUris","type":"StringList"},{"name":"name","type":"String"},{"name":"parentId","type":"Long"},{"name":"repeatCron","type":"String"},{"name":"targetGoal","type":"String"},{"name":"templateId","type":"Long"}],"indexes":[],"links":[]}',
  nativeAdapter: const _HabitNativeAdapter(),
  webAdapter: const _HabitWebAdapter(),
  idName: 'id',
  propertyIds: {
    'backgroundColor': 0,
    'createdAt': 1,
    'description': 2,
    'durationSeconds': 3,
    'emojiIcon': 4,
    'isArchived': 5,
    'localFileAttachmentUris': 6,
    'name': 7,
    'parentId': 8,
    'repeatCron': 9,
    'targetGoal': 10,
    'templateId': 11
  },
  listProperties: {'localFileAttachmentUris'},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: null,
  getLinks: (obj) => [],
  version: 2,
);

class _HabitWebAdapter extends IsarWebTypeAdapter<Habit> {
  const _HabitWebAdapter();

  @override
  Object serialize(IsarCollection<Habit> collection, Habit object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'backgroundColor', object.backgroundColor);
    IsarNative.jsObjectSet(
        jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'description', object.description);
    IsarNative.jsObjectSet(jsObj, 'durationSeconds', object.durationSeconds);
    IsarNative.jsObjectSet(jsObj, 'emojiIcon', object.emojiIcon);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'isArchived', object.isArchived);
    IsarNative.jsObjectSet(
        jsObj, 'localFileAttachmentUris', object.localFileAttachmentUris);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    IsarNative.jsObjectSet(jsObj, 'parentId', object.parentId);
    IsarNative.jsObjectSet(jsObj, 'repeatCron', object.repeatCron);
    IsarNative.jsObjectSet(jsObj, 'targetGoal', object.targetGoal);
    IsarNative.jsObjectSet(jsObj, 'templateId', object.templateId);
    return jsObj;
  }

  @override
  Habit deserialize(IsarCollection<Habit> collection, dynamic jsObj) {
    final object = Habit(
      backgroundColor: IsarNative.jsObjectGet(jsObj, 'backgroundColor'),
      createdAt: IsarNative.jsObjectGet(jsObj, 'createdAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createdAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0),
      description: IsarNative.jsObjectGet(jsObj, 'description'),
      durationSeconds: IsarNative.jsObjectGet(jsObj, 'durationSeconds'),
      emojiIcon: IsarNative.jsObjectGet(jsObj, 'emojiIcon'),
      id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
      isArchived: IsarNative.jsObjectGet(jsObj, 'isArchived') ?? false,
      localFileAttachmentUris:
          (IsarNative.jsObjectGet(jsObj, 'localFileAttachmentUris') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>(),
      name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
      parentId: IsarNative.jsObjectGet(jsObj, 'parentId'),
      repeatCron: IsarNative.jsObjectGet(jsObj, 'repeatCron'),
      targetGoal: IsarNative.jsObjectGet(jsObj, 'targetGoal'),
      templateId: IsarNative.jsObjectGet(jsObj, 'templateId'),
    );
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'backgroundColor':
        return (IsarNative.jsObjectGet(jsObj, 'backgroundColor')) as P;
      case 'createdAt':
        return (IsarNative.jsObjectGet(jsObj, 'createdAt') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'createdAt'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'description':
        return (IsarNative.jsObjectGet(jsObj, 'description')) as P;
      case 'durationSeconds':
        return (IsarNative.jsObjectGet(jsObj, 'durationSeconds')) as P;
      case 'emojiIcon':
        return (IsarNative.jsObjectGet(jsObj, 'emojiIcon')) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'isArchived':
        return (IsarNative.jsObjectGet(jsObj, 'isArchived') ?? false) as P;
      case 'localFileAttachmentUris':
        return ((IsarNative.jsObjectGet(jsObj, 'localFileAttachmentUris')
                as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>()) as P;
      case 'name':
        return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
      case 'parentId':
        return (IsarNative.jsObjectGet(jsObj, 'parentId')) as P;
      case 'repeatCron':
        return (IsarNative.jsObjectGet(jsObj, 'repeatCron')) as P;
      case 'targetGoal':
        return (IsarNative.jsObjectGet(jsObj, 'targetGoal')) as P;
      case 'templateId':
        return (IsarNative.jsObjectGet(jsObj, 'templateId')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Habit object) {}
}

class _HabitNativeAdapter extends IsarNativeTypeAdapter<Habit> {
  const _HabitNativeAdapter();

  @override
  void serialize(IsarCollection<Habit> collection, IsarRawObject rawObj,
      Habit object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.backgroundColor;
    final _backgroundColor = value0;
    final value1 = object.createdAt;
    final _createdAt = value1;
    final value2 = object.description;
    IsarUint8List? _description;
    if (value2 != null) {
      _description = IsarBinaryWriter.utf8Encoder.convert(value2);
    }
    dynamicSize += (_description?.length ?? 0) as int;
    final value3 = object.durationSeconds;
    final _durationSeconds = value3;
    final value4 = object.emojiIcon;
    IsarUint8List? _emojiIcon;
    if (value4 != null) {
      _emojiIcon = IsarBinaryWriter.utf8Encoder.convert(value4);
    }
    dynamicSize += (_emojiIcon?.length ?? 0) as int;
    final value5 = object.isArchived;
    final _isArchived = value5;
    final value6 = object.localFileAttachmentUris;
    dynamicSize += (value6?.length ?? 0) * 8;
    List<IsarUint8List?>? bytesList6;
    if (value6 != null) {
      bytesList6 = [];
      for (var str in value6) {
        final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
        bytesList6.add(bytes);
        dynamicSize += bytes.length as int;
      }
    }
    final _localFileAttachmentUris = bytesList6;
    final value7 = object.name;
    final _name = IsarBinaryWriter.utf8Encoder.convert(value7);
    dynamicSize += (_name.length) as int;
    final value8 = object.parentId;
    final _parentId = value8;
    final value9 = object.repeatCron;
    IsarUint8List? _repeatCron;
    if (value9 != null) {
      _repeatCron = IsarBinaryWriter.utf8Encoder.convert(value9);
    }
    dynamicSize += (_repeatCron?.length ?? 0) as int;
    final value10 = object.targetGoal;
    IsarUint8List? _targetGoal;
    if (value10 != null) {
      _targetGoal = IsarBinaryWriter.utf8Encoder.convert(value10);
    }
    dynamicSize += (_targetGoal?.length ?? 0) as int;
    final value11 = object.templateId;
    final _templateId = value11;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _backgroundColor);
    writer.writeDateTime(offsets[1], _createdAt);
    writer.writeBytes(offsets[2], _description);
    writer.writeLong(offsets[3], _durationSeconds);
    writer.writeBytes(offsets[4], _emojiIcon);
    writer.writeBool(offsets[5], _isArchived);
    writer.writeStringList(offsets[6], _localFileAttachmentUris);
    writer.writeBytes(offsets[7], _name);
    writer.writeLong(offsets[8], _parentId);
    writer.writeBytes(offsets[9], _repeatCron);
    writer.writeBytes(offsets[10], _targetGoal);
    writer.writeLong(offsets[11], _templateId);
  }

  @override
  Habit deserialize(IsarCollection<Habit> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Habit(
      backgroundColor: reader.readLongOrNull(offsets[0]),
      createdAt: reader.readDateTime(offsets[1]),
      description: reader.readStringOrNull(offsets[2]),
      durationSeconds: reader.readLongOrNull(offsets[3]),
      emojiIcon: reader.readStringOrNull(offsets[4]),
      id: id,
      isArchived: reader.readBool(offsets[5]),
      localFileAttachmentUris: reader.readStringList(offsets[6]),
      name: reader.readString(offsets[7]),
      parentId: reader.readLongOrNull(offsets[8]),
      repeatCron: reader.readStringOrNull(offsets[9]),
      targetGoal: reader.readStringOrNull(offsets[10]),
      templateId: reader.readLongOrNull(offsets[11]),
    );
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readLongOrNull(offset)) as P;
      case 1:
        return (reader.readDateTime(offset)) as P;
      case 2:
        return (reader.readStringOrNull(offset)) as P;
      case 3:
        return (reader.readLongOrNull(offset)) as P;
      case 4:
        return (reader.readStringOrNull(offset)) as P;
      case 5:
        return (reader.readBool(offset)) as P;
      case 6:
        return (reader.readStringList(offset)) as P;
      case 7:
        return (reader.readString(offset)) as P;
      case 8:
        return (reader.readLongOrNull(offset)) as P;
      case 9:
        return (reader.readStringOrNull(offset)) as P;
      case 10:
        return (reader.readStringOrNull(offset)) as P;
      case 11:
        return (reader.readLongOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Habit object) {}
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
  QueryBuilder<Habit, Habit, QAfterFilterCondition> backgroundColorIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'backgroundColor',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> backgroundColorEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'backgroundColor',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> backgroundColorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'backgroundColor',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> backgroundColorLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'backgroundColor',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> backgroundColorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'backgroundColor',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
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
    DateTime value, {
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
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<Habit, Habit, QAfterFilterCondition> durationSecondsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'durationSeconds',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> durationSecondsEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'durationSeconds',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> durationSecondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'durationSeconds',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> durationSecondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'durationSeconds',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> durationSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'durationSeconds',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
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

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'localFileAttachmentUris',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'localFileAttachmentUris',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'localFileAttachmentUris',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'localFileAttachmentUris',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'localFileAttachmentUris',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'localFileAttachmentUris',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'localFileAttachmentUris',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'localFileAttachmentUris',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisAnyContains(String value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'localFileAttachmentUris',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition>
      localFileAttachmentUrisAnyMatches(String pattern,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'localFileAttachmentUris',
      value: pattern,
      caseSensitive: caseSensitive,
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

  QueryBuilder<Habit, Habit, QAfterFilterCondition> templateIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'templateId',
      value: null,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> templateIdEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'templateId',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> templateIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'templateId',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> templateIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'templateId',
      value: value,
    ));
  }

  QueryBuilder<Habit, Habit, QAfterFilterCondition> templateIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'templateId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension HabitQueryLinks on QueryBuilder<Habit, Habit, QFilterCondition> {}

extension HabitQueryWhereSortBy on QueryBuilder<Habit, Habit, QSortBy> {
  QueryBuilder<Habit, Habit, QAfterSortBy> sortByBackgroundColor() {
    return addSortByInternal('backgroundColor', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByBackgroundColorDesc() {
    return addSortByInternal('backgroundColor', Sort.desc);
  }

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

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByDurationSeconds() {
    return addSortByInternal('durationSeconds', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByDurationSecondsDesc() {
    return addSortByInternal('durationSeconds', Sort.desc);
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

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByTemplateId() {
    return addSortByInternal('templateId', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> sortByTemplateIdDesc() {
    return addSortByInternal('templateId', Sort.desc);
  }
}

extension HabitQueryWhereSortThenBy on QueryBuilder<Habit, Habit, QSortThenBy> {
  QueryBuilder<Habit, Habit, QAfterSortBy> thenByBackgroundColor() {
    return addSortByInternal('backgroundColor', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByBackgroundColorDesc() {
    return addSortByInternal('backgroundColor', Sort.desc);
  }

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

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByDurationSeconds() {
    return addSortByInternal('durationSeconds', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByDurationSecondsDesc() {
    return addSortByInternal('durationSeconds', Sort.desc);
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

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByTemplateId() {
    return addSortByInternal('templateId', Sort.asc);
  }

  QueryBuilder<Habit, Habit, QAfterSortBy> thenByTemplateIdDesc() {
    return addSortByInternal('templateId', Sort.desc);
  }
}

extension HabitQueryWhereDistinct on QueryBuilder<Habit, Habit, QDistinct> {
  QueryBuilder<Habit, Habit, QDistinct> distinctByBackgroundColor() {
    return addDistinctByInternal('backgroundColor');
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<Habit, Habit, QDistinct> distinctByDurationSeconds() {
    return addDistinctByInternal('durationSeconds');
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

  QueryBuilder<Habit, Habit, QDistinct> distinctByTemplateId() {
    return addDistinctByInternal('templateId');
  }
}

extension HabitQueryProperty on QueryBuilder<Habit, Habit, QQueryProperty> {
  QueryBuilder<Habit, int?, QQueryOperations> backgroundColorProperty() {
    return addPropertyNameInternal('backgroundColor');
  }

  QueryBuilder<Habit, DateTime, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<Habit, String?, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<Habit, int?, QQueryOperations> durationSecondsProperty() {
    return addPropertyNameInternal('durationSeconds');
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

  QueryBuilder<Habit, List<String>?, QQueryOperations>
      localFileAttachmentUrisProperty() {
    return addPropertyNameInternal('localFileAttachmentUris');
  }

  QueryBuilder<Habit, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Habit, int?, QQueryOperations> parentIdProperty() {
    return addPropertyNameInternal('parentId');
  }

  QueryBuilder<Habit, String?, QQueryOperations> repeatCronProperty() {
    return addPropertyNameInternal('repeatCron');
  }

  QueryBuilder<Habit, String?, QQueryOperations> targetGoalProperty() {
    return addPropertyNameInternal('targetGoal');
  }

  QueryBuilder<Habit, int?, QQueryOperations> templateIdProperty() {
    return addPropertyNameInternal('templateId');
  }
}
