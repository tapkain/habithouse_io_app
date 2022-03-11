// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_prefs.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetSharedPrefsCollection on Isar {
  IsarCollection<SharedPrefs> get sharedPrefss {
    return getCollection('SharedPrefs');
  }
}

final SharedPrefsSchema = CollectionSchema(
  name: 'SharedPrefs',
  schema:
      '{"name":"SharedPrefs","idName":"id","properties":[{"name":"isFirstLaunch","type":"Bool"}],"indexes":[],"links":[]}',
  nativeAdapter: const _SharedPrefsNativeAdapter(),
  webAdapter: const _SharedPrefsWebAdapter(),
  idName: 'id',
  propertyIds: {'isFirstLaunch': 0},
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

class _SharedPrefsWebAdapter extends IsarWebTypeAdapter<SharedPrefs> {
  const _SharedPrefsWebAdapter();

  @override
  Object serialize(IsarCollection<SharedPrefs> collection, SharedPrefs object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'isFirstLaunch', object.isFirstLaunch);
    return jsObj;
  }

  @override
  SharedPrefs deserialize(
      IsarCollection<SharedPrefs> collection, dynamic jsObj) {
    final object = SharedPrefs(
      id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
      isFirstLaunch: IsarNative.jsObjectGet(jsObj, 'isFirstLaunch') ?? false,
    );
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'isFirstLaunch':
        return (IsarNative.jsObjectGet(jsObj, 'isFirstLaunch') ?? false) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, SharedPrefs object) {}
}

class _SharedPrefsNativeAdapter extends IsarNativeTypeAdapter<SharedPrefs> {
  const _SharedPrefsNativeAdapter();

  @override
  void serialize(
      IsarCollection<SharedPrefs> collection,
      IsarRawObject rawObj,
      SharedPrefs object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.isFirstLaunch;
    final _isFirstLaunch = value0;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBool(offsets[0], _isFirstLaunch);
  }

  @override
  SharedPrefs deserialize(IsarCollection<SharedPrefs> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = SharedPrefs(
      id: id,
      isFirstLaunch: reader.readBool(offsets[0]),
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
        return (reader.readBool(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, SharedPrefs object) {}
}

extension SharedPrefsQueryWhereSort
    on QueryBuilder<SharedPrefs, SharedPrefs, QWhere> {
  QueryBuilder<SharedPrefs, SharedPrefs, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension SharedPrefsQueryWhere
    on QueryBuilder<SharedPrefs, SharedPrefs, QWhereClause> {
  QueryBuilder<SharedPrefs, SharedPrefs, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterWhereClause> idNotEqualTo(
      int id) {
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

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterWhereClause> idBetween(
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

extension SharedPrefsQueryFilter
    on QueryBuilder<SharedPrefs, SharedPrefs, QFilterCondition> {
  QueryBuilder<SharedPrefs, SharedPrefs, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterFilterCondition>
      isFirstLaunchEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isFirstLaunch',
      value: value,
    ));
  }
}

extension SharedPrefsQueryLinks
    on QueryBuilder<SharedPrefs, SharedPrefs, QFilterCondition> {}

extension SharedPrefsQueryWhereSortBy
    on QueryBuilder<SharedPrefs, SharedPrefs, QSortBy> {
  QueryBuilder<SharedPrefs, SharedPrefs, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterSortBy> sortByIsFirstLaunch() {
    return addSortByInternal('isFirstLaunch', Sort.asc);
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterSortBy>
      sortByIsFirstLaunchDesc() {
    return addSortByInternal('isFirstLaunch', Sort.desc);
  }
}

extension SharedPrefsQueryWhereSortThenBy
    on QueryBuilder<SharedPrefs, SharedPrefs, QSortThenBy> {
  QueryBuilder<SharedPrefs, SharedPrefs, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterSortBy> thenByIsFirstLaunch() {
    return addSortByInternal('isFirstLaunch', Sort.asc);
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QAfterSortBy>
      thenByIsFirstLaunchDesc() {
    return addSortByInternal('isFirstLaunch', Sort.desc);
  }
}

extension SharedPrefsQueryWhereDistinct
    on QueryBuilder<SharedPrefs, SharedPrefs, QDistinct> {
  QueryBuilder<SharedPrefs, SharedPrefs, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<SharedPrefs, SharedPrefs, QDistinct> distinctByIsFirstLaunch() {
    return addDistinctByInternal('isFirstLaunch');
  }
}

extension SharedPrefsQueryProperty
    on QueryBuilder<SharedPrefs, SharedPrefs, QQueryProperty> {
  QueryBuilder<SharedPrefs, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<SharedPrefs, bool, QQueryOperations> isFirstLaunchProperty() {
    return addPropertyNameInternal('isFirstLaunch');
  }
}
