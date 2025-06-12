// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSaleModelCollection on Isar {
  IsarCollection<SaleModel> get saleModels => this.collection();
}

const SaleModelSchema = CollectionSchema(
  name: r'SaleModel',
  id: 8410161235942925352,
  properties: {
    r'quantitySold': PropertySchema(
      id: 0,
      name: r'quantitySold',
      type: IsarType.long,
    ),
    r'saleDate': PropertySchema(
      id: 1,
      name: r'saleDate',
      type: IsarType.dateTime,
    ),
    r'totalValueInCents': PropertySchema(
      id: 2,
      name: r'totalValueInCents',
      type: IsarType.long,
    )
  },
  estimateSize: _saleModelEstimateSize,
  serialize: _saleModelSerialize,
  deserialize: _saleModelDeserialize,
  deserializeProp: _saleModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'product': LinkSchema(
      id: 3600921880965762113,
      name: r'product',
      target: r'ProductModel',
      single: true,
    ),
    r'route': LinkSchema(
      id: -1442572860544916688,
      name: r'route',
      target: r'RouteModel',
      single: true,
    ),
    r'customer': LinkSchema(
      id: 684696268298061235,
      name: r'customer',
      target: r'CustomerModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _saleModelGetId,
  getLinks: _saleModelGetLinks,
  attach: _saleModelAttach,
  version: '3.1.8',
);

int _saleModelEstimateSize(
  SaleModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _saleModelSerialize(
  SaleModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.quantitySold);
  writer.writeDateTime(offsets[1], object.saleDate);
  writer.writeLong(offsets[2], object.totalValueInCents);
}

SaleModel _saleModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SaleModel();
  object.id = id;
  object.quantitySold = reader.readLong(offsets[0]);
  object.totalValueInCents = reader.readLong(offsets[2]);
  return object;
}

P _saleModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _saleModelGetId(SaleModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _saleModelGetLinks(SaleModel object) {
  return [object.product, object.route, object.customer];
}

void _saleModelAttach(IsarCollection<dynamic> col, Id id, SaleModel object) {
  object.id = id;
  object.product
      .attach(col, col.isar.collection<ProductModel>(), r'product', id);
  object.route.attach(col, col.isar.collection<RouteModel>(), r'route', id);
  object.customer
      .attach(col, col.isar.collection<CustomerModel>(), r'customer', id);
}

extension SaleModelQueryWhereSort
    on QueryBuilder<SaleModel, SaleModel, QWhere> {
  QueryBuilder<SaleModel, SaleModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SaleModelQueryWhere
    on QueryBuilder<SaleModel, SaleModel, QWhereClause> {
  QueryBuilder<SaleModel, SaleModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SaleModel, SaleModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterWhereClause> idBetween(
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

extension SaleModelQueryFilter
    on QueryBuilder<SaleModel, SaleModel, QFilterCondition> {
  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> quantitySoldEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantitySold',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition>
      quantitySoldGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantitySold',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition>
      quantitySoldLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantitySold',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> quantitySoldBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantitySold',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> saleDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saleDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> saleDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saleDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> saleDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saleDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> saleDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saleDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition>
      totalValueInCentsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalValueInCents',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition>
      totalValueInCentsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalValueInCents',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition>
      totalValueInCentsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalValueInCents',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition>
      totalValueInCentsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalValueInCents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SaleModelQueryObject
    on QueryBuilder<SaleModel, SaleModel, QFilterCondition> {}

extension SaleModelQueryLinks
    on QueryBuilder<SaleModel, SaleModel, QFilterCondition> {
  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> product(
      FilterQuery<ProductModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> route(
      FilterQuery<RouteModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'route');
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> routeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'route', 0, true, 0, true);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> customer(
      FilterQuery<CustomerModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterFilterCondition> customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }
}

extension SaleModelQuerySortBy on QueryBuilder<SaleModel, SaleModel, QSortBy> {
  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> sortByQuantitySold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantitySold', Sort.asc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> sortByQuantitySoldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantitySold', Sort.desc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> sortBySaleDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleDate', Sort.asc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> sortBySaleDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleDate', Sort.desc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> sortByTotalValueInCents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValueInCents', Sort.asc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy>
      sortByTotalValueInCentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValueInCents', Sort.desc);
    });
  }
}

extension SaleModelQuerySortThenBy
    on QueryBuilder<SaleModel, SaleModel, QSortThenBy> {
  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> thenByQuantitySold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantitySold', Sort.asc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> thenByQuantitySoldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantitySold', Sort.desc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> thenBySaleDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleDate', Sort.asc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> thenBySaleDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleDate', Sort.desc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy> thenByTotalValueInCents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValueInCents', Sort.asc);
    });
  }

  QueryBuilder<SaleModel, SaleModel, QAfterSortBy>
      thenByTotalValueInCentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValueInCents', Sort.desc);
    });
  }
}

extension SaleModelQueryWhereDistinct
    on QueryBuilder<SaleModel, SaleModel, QDistinct> {
  QueryBuilder<SaleModel, SaleModel, QDistinct> distinctByQuantitySold() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantitySold');
    });
  }

  QueryBuilder<SaleModel, SaleModel, QDistinct> distinctBySaleDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saleDate');
    });
  }

  QueryBuilder<SaleModel, SaleModel, QDistinct> distinctByTotalValueInCents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalValueInCents');
    });
  }
}

extension SaleModelQueryProperty
    on QueryBuilder<SaleModel, SaleModel, QQueryProperty> {
  QueryBuilder<SaleModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SaleModel, int, QQueryOperations> quantitySoldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantitySold');
    });
  }

  QueryBuilder<SaleModel, DateTime, QQueryOperations> saleDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saleDate');
    });
  }

  QueryBuilder<SaleModel, int, QQueryOperations> totalValueInCentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalValueInCents');
    });
  }
}
