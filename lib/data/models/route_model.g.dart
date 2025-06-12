// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRouteModelCollection on Isar {
  IsarCollection<RouteModel> get routeModels => this.collection();
}

const RouteModelSchema = CollectionSchema(
  name: r'RouteModel',
  id: -8114983142624987954,
  properties: {
    r'routeName': PropertySchema(
      id: 0,
      name: r'routeName',
      type: IsarType.string,
    )
  },
  estimateSize: _routeModelEstimateSize,
  serialize: _routeModelSerialize,
  deserialize: _routeModelDeserialize,
  deserializeProp: _routeModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'customers': LinkSchema(
      id: 3969424988241203715,
      name: r'customers',
      target: r'CustomerModel',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _routeModelGetId,
  getLinks: _routeModelGetLinks,
  attach: _routeModelAttach,
  version: '3.1.8',
);

int _routeModelEstimateSize(
  RouteModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.routeName.length * 3;
  return bytesCount;
}

void _routeModelSerialize(
  RouteModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.routeName);
}

RouteModel _routeModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RouteModel();
  object.id = id;
  object.routeName = reader.readString(offsets[0]);
  return object;
}

P _routeModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _routeModelGetId(RouteModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _routeModelGetLinks(RouteModel object) {
  return [object.customers];
}

void _routeModelAttach(IsarCollection<dynamic> col, Id id, RouteModel object) {
  object.id = id;
  object.customers
      .attach(col, col.isar.collection<CustomerModel>(), r'customers', id);
}

extension RouteModelQueryWhereSort
    on QueryBuilder<RouteModel, RouteModel, QWhere> {
  QueryBuilder<RouteModel, RouteModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RouteModelQueryWhere
    on QueryBuilder<RouteModel, RouteModel, QWhereClause> {
  QueryBuilder<RouteModel, RouteModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RouteModelQueryFilter
    on QueryBuilder<RouteModel, RouteModel, QFilterCondition> {
  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> routeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      routeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> routeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> routeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'routeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      routeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> routeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> routeNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> routeNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'routeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      routeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'routeName',
        value: '',
      ));
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      routeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'routeName',
        value: '',
      ));
    });
  }
}

extension RouteModelQueryObject
    on QueryBuilder<RouteModel, RouteModel, QFilterCondition> {}

extension RouteModelQueryLinks
    on QueryBuilder<RouteModel, RouteModel, QFilterCondition> {
  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition> customers(
      FilterQuery<CustomerModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customers');
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      customersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customers', length, true, length, true);
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      customersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customers', 0, true, 0, true);
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      customersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customers', 0, false, 999999, true);
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      customersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customers', 0, true, length, include);
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      customersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customers', length, include, 999999, true);
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterFilterCondition>
      customersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'customers', lower, includeLower, upper, includeUpper);
    });
  }
}

extension RouteModelQuerySortBy
    on QueryBuilder<RouteModel, RouteModel, QSortBy> {
  QueryBuilder<RouteModel, RouteModel, QAfterSortBy> sortByRouteName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeName', Sort.asc);
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterSortBy> sortByRouteNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeName', Sort.desc);
    });
  }
}

extension RouteModelQuerySortThenBy
    on QueryBuilder<RouteModel, RouteModel, QSortThenBy> {
  QueryBuilder<RouteModel, RouteModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterSortBy> thenByRouteName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeName', Sort.asc);
    });
  }

  QueryBuilder<RouteModel, RouteModel, QAfterSortBy> thenByRouteNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeName', Sort.desc);
    });
  }
}

extension RouteModelQueryWhereDistinct
    on QueryBuilder<RouteModel, RouteModel, QDistinct> {
  QueryBuilder<RouteModel, RouteModel, QDistinct> distinctByRouteName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'routeName', caseSensitive: caseSensitive);
    });
  }
}

extension RouteModelQueryProperty
    on QueryBuilder<RouteModel, RouteModel, QQueryProperty> {
  QueryBuilder<RouteModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RouteModel, String, QQueryOperations> routeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'routeName');
    });
  }
}
