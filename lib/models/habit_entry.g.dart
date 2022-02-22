// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetHabitEntryCollection on Isar {
  IsarCollection<HabitEntry> get habitEntrys {
    return getCollection('HabitEntry');
  }
}

final HabitEntrySchema = CollectionSchema(
  name: 'HabitEntry',
  schema:
      '{"name":"HabitEntry","idName":"id","properties":[{"name":"createdAt","type":"Long"},{"name":"habitId","type":"Long"},{"name":"targetGoal","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _HabitEntryNativeAdapter(),
  webAdapter: const _HabitEntryWebAdapter(),
  idName: 'id',
  propertyIds: {'createdAt': 0, 'habitId': 1, 'targetGoal': 2},
  listProperties: {},
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

class _HabitEntryWebAdapter extends IsarWebTypeAdapter<HabitEntry> {
  const _HabitEntryWebAdapter();

  @override
  Object serialize(IsarCollection<HabitEntry> collection, HabitEntry object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(
        jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'habitId', object.habitId);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'targetGoal', object.targetGoal);
    return jsObj;
  }

  @override
  HabitEntry deserialize(IsarCollection<HabitEntry> collection, dynamic jsObj) {
    final object = HabitEntry(
      createdAt: IsarNative.jsObjectGet(jsObj, 'createdAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createdAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0),
      habitId:
          IsarNative.jsObjectGet(jsObj, 'habitId') ?? double.negativeInfinity,
      id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
      targetGoal: IsarNative.jsObjectGet(jsObj, 'targetGoal'),
    );
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'createdAt':
        return (IsarNative.jsObjectGet(jsObj, 'createdAt') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'createdAt'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'habitId':
        return (IsarNative.jsObjectGet(jsObj, 'habitId') ??
            double.negativeInfinity) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'targetGoal':
        return (IsarNative.jsObjectGet(jsObj, 'targetGoal')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, HabitEntry object) {}
}

class _HabitEntryNativeAdapter extends IsarNativeTypeAdapter<HabitEntry> {
  const _HabitEntryNativeAdapter();

  @override
  void serialize(
      IsarCollection<HabitEntry> collection,
      IsarRawObject rawObj,
      HabitEntry object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.createdAt;
    final _createdAt = value0;
    final value1 = object.habitId;
    final _habitId = value1;
    final value2 = object.targetGoal;
    IsarUint8List? _targetGoal;
    if (value2 != null) {
      _targetGoal = IsarBinaryWriter.utf8Encoder.convert(value2);
    }
    dynamicSize += (_targetGoal?.length ?? 0) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeDateTime(offsets[0], _createdAt);
    writer.writeLong(offsets[1], _habitId);
    writer.writeBytes(offsets[2], _targetGoal);
  }

  @override
  HabitEntry deserialize(IsarCollection<HabitEntry> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = HabitEntry(
      createdAt: reader.readDateTime(offsets[0]),
      habitId: reader.readLong(offsets[1]),
      id: id,
      targetGoal: reader.readStringOrNull(offsets[2]),
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
        return (reader.readDateTime(offset)) as P;
      case 1:
        return (reader.readLong(offset)) as P;
      case 2:
        return (reader.readStringOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, HabitEntry object) {}
}

extension HabitEntryQueryWhereSort
    on QueryBuilder<HabitEntry, HabitEntry, QWhere> {
  QueryBuilder<HabitEntry, HabitEntry, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension HabitEntryQueryWhere
    on QueryBuilder<HabitEntry, HabitEntry, QWhereClause> {
  QueryBuilder<HabitEntry, HabitEntry, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterWhereClause> idBetween(
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

extension HabitEntryQueryFilter
    on QueryBuilder<HabitEntry, HabitEntry, QFilterCondition> {
  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition>
      createdAtGreaterThan(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> habitIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'habitId',
      value: value,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition>
      habitIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'habitId',
      value: value,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> habitIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'habitId',
      value: value,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> habitIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'habitId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> idBetween(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition>
      targetGoalIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'targetGoal',
      value: null,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> targetGoalEqualTo(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition>
      targetGoalGreaterThan(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition>
      targetGoalLessThan(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> targetGoalBetween(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition>
      targetGoalStartsWith(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition>
      targetGoalEndsWith(
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

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition>
      targetGoalContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'targetGoal',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterFilterCondition> targetGoalMatches(
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

extension HabitEntryQueryLinks
    on QueryBuilder<HabitEntry, HabitEntry, QFilterCondition> {}

extension HabitEntryQueryWhereSortBy
    on QueryBuilder<HabitEntry, HabitEntry, QSortBy> {
  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> sortByHabitId() {
    return addSortByInternal('habitId', Sort.asc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> sortByHabitIdDesc() {
    return addSortByInternal('habitId', Sort.desc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> sortByTargetGoal() {
    return addSortByInternal('targetGoal', Sort.asc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> sortByTargetGoalDesc() {
    return addSortByInternal('targetGoal', Sort.desc);
  }
}

extension HabitEntryQueryWhereSortThenBy
    on QueryBuilder<HabitEntry, HabitEntry, QSortThenBy> {
  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> thenByHabitId() {
    return addSortByInternal('habitId', Sort.asc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> thenByHabitIdDesc() {
    return addSortByInternal('habitId', Sort.desc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> thenByTargetGoal() {
    return addSortByInternal('targetGoal', Sort.asc);
  }

  QueryBuilder<HabitEntry, HabitEntry, QAfterSortBy> thenByTargetGoalDesc() {
    return addSortByInternal('targetGoal', Sort.desc);
  }
}

extension HabitEntryQueryWhereDistinct
    on QueryBuilder<HabitEntry, HabitEntry, QDistinct> {
  QueryBuilder<HabitEntry, HabitEntry, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<HabitEntry, HabitEntry, QDistinct> distinctByHabitId() {
    return addDistinctByInternal('habitId');
  }

  QueryBuilder<HabitEntry, HabitEntry, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<HabitEntry, HabitEntry, QDistinct> distinctByTargetGoal(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('targetGoal', caseSensitive: caseSensitive);
  }
}

extension HabitEntryQueryProperty
    on QueryBuilder<HabitEntry, HabitEntry, QQueryProperty> {
  QueryBuilder<HabitEntry, DateTime, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<HabitEntry, int, QQueryOperations> habitIdProperty() {
    return addPropertyNameInternal('habitId');
  }

  QueryBuilder<HabitEntry, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<HabitEntry, String?, QQueryOperations> targetGoalProperty() {
    return addPropertyNameInternal('targetGoal');
  }
}
