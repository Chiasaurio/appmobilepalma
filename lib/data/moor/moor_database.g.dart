// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// ignore_for_file: type=lint
class $AplicacionesTable extends Aplicaciones
    with TableInfo<$AplicacionesTable, Aplicacione> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AplicacionesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dosisMeta = const VerificationMeta('dosis');
  @override
  late final GeneratedColumn<double> dosis = GeneratedColumn<double>(
      'dosis', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<int> area = GeneratedColumn<int>(
      'area', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fechaAplicacionMeta =
      const VerificationMeta('fechaAplicacion');
  @override
  late final GeneratedColumn<DateTime> fechaAplicacion =
      GeneratedColumn<DateTime>('fecha_aplicacion', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fechaReingresoMeta =
      const VerificationMeta('fechaReingreso');
  @override
  late final GeneratedColumn<DateTime> fechaReingreso =
      GeneratedColumn<DateTime>('fecha_reingreso', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _idCensoMeta =
      const VerificationMeta('idCenso');
  @override
  late final GeneratedColumn<int> idCenso = GeneratedColumn<int>(
      'id_censo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idProductoAgroquimicoMeta =
      const VerificationMeta('idProductoAgroquimico');
  @override
  late final GeneratedColumn<int> idProductoAgroquimico = GeneratedColumn<int>(
      'id_producto_agroquimico', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        dosis,
        area,
        fechaAplicacion,
        fechaReingreso,
        idCenso,
        idProductoAgroquimico,
        responsable,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'aplicaciones';
  @override
  String get actualTableName => 'aplicaciones';
  @override
  VerificationContext validateIntegrity(Insertable<Aplicacione> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('dosis')) {
      context.handle(
          _dosisMeta, dosis.isAcceptableOrUnknown(data['dosis']!, _dosisMeta));
    } else if (isInserting) {
      context.missing(_dosisMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('fecha_aplicacion')) {
      context.handle(
          _fechaAplicacionMeta,
          fechaAplicacion.isAcceptableOrUnknown(
              data['fecha_aplicacion']!, _fechaAplicacionMeta));
    } else if (isInserting) {
      context.missing(_fechaAplicacionMeta);
    }
    if (data.containsKey('fecha_reingreso')) {
      context.handle(
          _fechaReingresoMeta,
          fechaReingreso.isAcceptableOrUnknown(
              data['fecha_reingreso']!, _fechaReingresoMeta));
    } else if (isInserting) {
      context.missing(_fechaReingresoMeta);
    }
    if (data.containsKey('id_censo')) {
      context.handle(_idCensoMeta,
          idCenso.isAcceptableOrUnknown(data['id_censo']!, _idCensoMeta));
    } else if (isInserting) {
      context.missing(_idCensoMeta);
    }
    if (data.containsKey('id_producto_agroquimico')) {
      context.handle(
          _idProductoAgroquimicoMeta,
          idProductoAgroquimico.isAcceptableOrUnknown(
              data['id_producto_agroquimico']!, _idProductoAgroquimicoMeta));
    } else if (isInserting) {
      context.missing(_idProductoAgroquimicoMeta);
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Aplicacione map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Aplicacione(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dosis: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dosis'])!,
      area: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}area'])!,
      fechaAplicacion: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_aplicacion'])!,
      fechaReingreso: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_reingreso'])!,
      idCenso: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_censo'])!,
      idProductoAgroquimico: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_producto_agroquimico'])!,
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $AplicacionesTable createAlias(String alias) {
    return $AplicacionesTable(attachedDatabase, alias);
  }
}

class Aplicacione extends DataClass implements Insertable<Aplicacione> {
  final int id;
  final double dosis;
  final int area;
  final DateTime fechaAplicacion;
  final DateTime fechaReingreso;
  final int idCenso;
  final int idProductoAgroquimico;
  final String responsable;
  final bool sincronizado;
  const Aplicacione(
      {required this.id,
      required this.dosis,
      required this.area,
      required this.fechaAplicacion,
      required this.fechaReingreso,
      required this.idCenso,
      required this.idProductoAgroquimico,
      required this.responsable,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['dosis'] = Variable<double>(dosis);
    map['area'] = Variable<int>(area);
    map['fecha_aplicacion'] = Variable<DateTime>(fechaAplicacion);
    map['fecha_reingreso'] = Variable<DateTime>(fechaReingreso);
    map['id_censo'] = Variable<int>(idCenso);
    map['id_producto_agroquimico'] = Variable<int>(idProductoAgroquimico);
    map['responsable'] = Variable<String>(responsable);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  AplicacionesCompanion toCompanion(bool nullToAbsent) {
    return AplicacionesCompanion(
      id: Value(id),
      dosis: Value(dosis),
      area: Value(area),
      fechaAplicacion: Value(fechaAplicacion),
      fechaReingreso: Value(fechaReingreso),
      idCenso: Value(idCenso),
      idProductoAgroquimico: Value(idProductoAgroquimico),
      responsable: Value(responsable),
      sincronizado: Value(sincronizado),
    );
  }

  factory Aplicacione.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Aplicacione(
      id: serializer.fromJson<int>(json['id']),
      dosis: serializer.fromJson<double>(json['dosis']),
      area: serializer.fromJson<int>(json['area']),
      fechaAplicacion: serializer.fromJson<DateTime>(json['fechaAplicacion']),
      fechaReingreso: serializer.fromJson<DateTime>(json['fechaReingreso']),
      idCenso: serializer.fromJson<int>(json['idCenso']),
      idProductoAgroquimico:
          serializer.fromJson<int>(json['idProductoAgroquimico']),
      responsable: serializer.fromJson<String>(json['responsable']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dosis': serializer.toJson<double>(dosis),
      'area': serializer.toJson<int>(area),
      'fechaAplicacion': serializer.toJson<DateTime>(fechaAplicacion),
      'fechaReingreso': serializer.toJson<DateTime>(fechaReingreso),
      'idCenso': serializer.toJson<int>(idCenso),
      'idProductoAgroquimico': serializer.toJson<int>(idProductoAgroquimico),
      'responsable': serializer.toJson<String>(responsable),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  Aplicacione copyWith(
          {int? id,
          double? dosis,
          int? area,
          DateTime? fechaAplicacion,
          DateTime? fechaReingreso,
          int? idCenso,
          int? idProductoAgroquimico,
          String? responsable,
          bool? sincronizado}) =>
      Aplicacione(
        id: id ?? this.id,
        dosis: dosis ?? this.dosis,
        area: area ?? this.area,
        fechaAplicacion: fechaAplicacion ?? this.fechaAplicacion,
        fechaReingreso: fechaReingreso ?? this.fechaReingreso,
        idCenso: idCenso ?? this.idCenso,
        idProductoAgroquimico:
            idProductoAgroquimico ?? this.idProductoAgroquimico,
        responsable: responsable ?? this.responsable,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('Aplicacione(')
          ..write('id: $id, ')
          ..write('dosis: $dosis, ')
          ..write('area: $area, ')
          ..write('fechaAplicacion: $fechaAplicacion, ')
          ..write('fechaReingreso: $fechaReingreso, ')
          ..write('idCenso: $idCenso, ')
          ..write('idProductoAgroquimico: $idProductoAgroquimico, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      dosis,
      area,
      fechaAplicacion,
      fechaReingreso,
      idCenso,
      idProductoAgroquimico,
      responsable,
      sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Aplicacione &&
          other.id == this.id &&
          other.dosis == this.dosis &&
          other.area == this.area &&
          other.fechaAplicacion == this.fechaAplicacion &&
          other.fechaReingreso == this.fechaReingreso &&
          other.idCenso == this.idCenso &&
          other.idProductoAgroquimico == this.idProductoAgroquimico &&
          other.responsable == this.responsable &&
          other.sincronizado == this.sincronizado);
}

class AplicacionesCompanion extends UpdateCompanion<Aplicacione> {
  final Value<int> id;
  final Value<double> dosis;
  final Value<int> area;
  final Value<DateTime> fechaAplicacion;
  final Value<DateTime> fechaReingreso;
  final Value<int> idCenso;
  final Value<int> idProductoAgroquimico;
  final Value<String> responsable;
  final Value<bool> sincronizado;
  const AplicacionesCompanion({
    this.id = const Value.absent(),
    this.dosis = const Value.absent(),
    this.area = const Value.absent(),
    this.fechaAplicacion = const Value.absent(),
    this.fechaReingreso = const Value.absent(),
    this.idCenso = const Value.absent(),
    this.idProductoAgroquimico = const Value.absent(),
    this.responsable = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  AplicacionesCompanion.insert({
    this.id = const Value.absent(),
    required double dosis,
    required int area,
    required DateTime fechaAplicacion,
    required DateTime fechaReingreso,
    required int idCenso,
    required int idProductoAgroquimico,
    required String responsable,
    this.sincronizado = const Value.absent(),
  })  : dosis = Value(dosis),
        area = Value(area),
        fechaAplicacion = Value(fechaAplicacion),
        fechaReingreso = Value(fechaReingreso),
        idCenso = Value(idCenso),
        idProductoAgroquimico = Value(idProductoAgroquimico),
        responsable = Value(responsable);
  static Insertable<Aplicacione> custom({
    Expression<int>? id,
    Expression<double>? dosis,
    Expression<int>? area,
    Expression<DateTime>? fechaAplicacion,
    Expression<DateTime>? fechaReingreso,
    Expression<int>? idCenso,
    Expression<int>? idProductoAgroquimico,
    Expression<String>? responsable,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dosis != null) 'dosis': dosis,
      if (area != null) 'area': area,
      if (fechaAplicacion != null) 'fecha_aplicacion': fechaAplicacion,
      if (fechaReingreso != null) 'fecha_reingreso': fechaReingreso,
      if (idCenso != null) 'id_censo': idCenso,
      if (idProductoAgroquimico != null)
        'id_producto_agroquimico': idProductoAgroquimico,
      if (responsable != null) 'responsable': responsable,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  AplicacionesCompanion copyWith(
      {Value<int>? id,
      Value<double>? dosis,
      Value<int>? area,
      Value<DateTime>? fechaAplicacion,
      Value<DateTime>? fechaReingreso,
      Value<int>? idCenso,
      Value<int>? idProductoAgroquimico,
      Value<String>? responsable,
      Value<bool>? sincronizado}) {
    return AplicacionesCompanion(
      id: id ?? this.id,
      dosis: dosis ?? this.dosis,
      area: area ?? this.area,
      fechaAplicacion: fechaAplicacion ?? this.fechaAplicacion,
      fechaReingreso: fechaReingreso ?? this.fechaReingreso,
      idCenso: idCenso ?? this.idCenso,
      idProductoAgroquimico:
          idProductoAgroquimico ?? this.idProductoAgroquimico,
      responsable: responsable ?? this.responsable,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dosis.present) {
      map['dosis'] = Variable<double>(dosis.value);
    }
    if (area.present) {
      map['area'] = Variable<int>(area.value);
    }
    if (fechaAplicacion.present) {
      map['fecha_aplicacion'] = Variable<DateTime>(fechaAplicacion.value);
    }
    if (fechaReingreso.present) {
      map['fecha_reingreso'] = Variable<DateTime>(fechaReingreso.value);
    }
    if (idCenso.present) {
      map['id_censo'] = Variable<int>(idCenso.value);
    }
    if (idProductoAgroquimico.present) {
      map['id_producto_agroquimico'] =
          Variable<int>(idProductoAgroquimico.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AplicacionesCompanion(')
          ..write('id: $id, ')
          ..write('dosis: $dosis, ')
          ..write('area: $area, ')
          ..write('fechaAplicacion: $fechaAplicacion, ')
          ..write('fechaReingreso: $fechaReingreso, ')
          ..write('idCenso: $idCenso, ')
          ..write('idProductoAgroquimico: $idProductoAgroquimico, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $CensoTable extends Censo with TableInfo<$CensoTable, CensoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CensoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idCensoMeta =
      const VerificationMeta('idCenso');
  @override
  late final GeneratedColumn<int> idCenso = GeneratedColumn<int>(
      'id_censo', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _fechaCensoMeta =
      const VerificationMeta('fechaCenso');
  @override
  late final GeneratedColumn<DateTime> fechaCenso = GeneratedColumn<DateTime>(
      'fecha_censo', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _identificadorMeta =
      const VerificationMeta('identificador');
  @override
  late final GeneratedColumn<String> identificador = GeneratedColumn<String>(
      'identificador', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _observacionCensoMeta =
      const VerificationMeta('observacionCenso');
  @override
  late final GeneratedColumn<String> observacionCenso = GeneratedColumn<String>(
      'observacion_censo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nombreLoteMeta =
      const VerificationMeta('nombreLote');
  @override
  late final GeneratedColumn<String> nombreLote = GeneratedColumn<String>(
      'nombre_lote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numeroIndividuosMeta =
      const VerificationMeta('numeroIndividuos');
  @override
  late final GeneratedColumn<int> numeroIndividuos = GeneratedColumn<int>(
      'numero_individuos', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombrePlagaMeta =
      const VerificationMeta('nombrePlaga');
  @override
  late final GeneratedColumn<String> nombrePlaga = GeneratedColumn<String>(
      'nombre_plaga', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _estadoPlagaMeta =
      const VerificationMeta('estadoPlaga');
  @override
  late final GeneratedColumn<String> estadoPlaga = GeneratedColumn<String>(
      'estado_plaga', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Pendiente por fumigar'));
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idCenso,
        fechaCenso,
        identificador,
        observacionCenso,
        nombreLote,
        numeroIndividuos,
        nombrePlaga,
        estadoPlaga,
        sincronizado,
        responsable,
        latitude,
        longitude
      ];
  @override
  String get aliasedName => _alias ?? 'censo';
  @override
  String get actualTableName => 'censo';
  @override
  VerificationContext validateIntegrity(Insertable<CensoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_censo')) {
      context.handle(_idCensoMeta,
          idCenso.isAcceptableOrUnknown(data['id_censo']!, _idCensoMeta));
    }
    if (data.containsKey('fecha_censo')) {
      context.handle(
          _fechaCensoMeta,
          fechaCenso.isAcceptableOrUnknown(
              data['fecha_censo']!, _fechaCensoMeta));
    } else if (isInserting) {
      context.missing(_fechaCensoMeta);
    }
    if (data.containsKey('identificador')) {
      context.handle(
          _identificadorMeta,
          identificador.isAcceptableOrUnknown(
              data['identificador']!, _identificadorMeta));
    } else if (isInserting) {
      context.missing(_identificadorMeta);
    }
    if (data.containsKey('observacion_censo')) {
      context.handle(
          _observacionCensoMeta,
          observacionCenso.isAcceptableOrUnknown(
              data['observacion_censo']!, _observacionCensoMeta));
    }
    if (data.containsKey('nombre_lote')) {
      context.handle(
          _nombreLoteMeta,
          nombreLote.isAcceptableOrUnknown(
              data['nombre_lote']!, _nombreLoteMeta));
    } else if (isInserting) {
      context.missing(_nombreLoteMeta);
    }
    if (data.containsKey('numero_individuos')) {
      context.handle(
          _numeroIndividuosMeta,
          numeroIndividuos.isAcceptableOrUnknown(
              data['numero_individuos']!, _numeroIndividuosMeta));
    }
    if (data.containsKey('nombre_plaga')) {
      context.handle(
          _nombrePlagaMeta,
          nombrePlaga.isAcceptableOrUnknown(
              data['nombre_plaga']!, _nombrePlagaMeta));
    } else if (isInserting) {
      context.missing(_nombrePlagaMeta);
    }
    if (data.containsKey('estado_plaga')) {
      context.handle(
          _estadoPlagaMeta,
          estadoPlaga.isAcceptableOrUnknown(
              data['estado_plaga']!, _estadoPlagaMeta));
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CensoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CensoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idCenso: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_censo']),
      fechaCenso: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_censo'])!,
      identificador: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identificador'])!,
      observacionCenso: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}observacion_censo']),
      nombreLote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_lote'])!,
      numeroIndividuos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}numero_individuos']),
      nombrePlaga: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_plaga'])!,
      estadoPlaga: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}estado_plaga'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude']),
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude']),
    );
  }

  @override
  $CensoTable createAlias(String alias) {
    return $CensoTable(attachedDatabase, alias);
  }
}

class CensoData extends DataClass implements Insertable<CensoData> {
  final int id;
  final int? idCenso;
  final DateTime fechaCenso;
  final String identificador;
  final String? observacionCenso;
  final String nombreLote;
  final int? numeroIndividuos;
  final String nombrePlaga;
  final String estadoPlaga;
  final bool sincronizado;
  final String responsable;
  final double? latitude;
  final double? longitude;
  const CensoData(
      {required this.id,
      this.idCenso,
      required this.fechaCenso,
      required this.identificador,
      this.observacionCenso,
      required this.nombreLote,
      this.numeroIndividuos,
      required this.nombrePlaga,
      required this.estadoPlaga,
      required this.sincronizado,
      required this.responsable,
      this.latitude,
      this.longitude});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idCenso != null) {
      map['id_censo'] = Variable<int>(idCenso);
    }
    map['fecha_censo'] = Variable<DateTime>(fechaCenso);
    map['identificador'] = Variable<String>(identificador);
    if (!nullToAbsent || observacionCenso != null) {
      map['observacion_censo'] = Variable<String>(observacionCenso);
    }
    map['nombre_lote'] = Variable<String>(nombreLote);
    if (!nullToAbsent || numeroIndividuos != null) {
      map['numero_individuos'] = Variable<int>(numeroIndividuos);
    }
    map['nombre_plaga'] = Variable<String>(nombrePlaga);
    map['estado_plaga'] = Variable<String>(estadoPlaga);
    map['sincronizado'] = Variable<bool>(sincronizado);
    map['responsable'] = Variable<String>(responsable);
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    return map;
  }

  CensoCompanion toCompanion(bool nullToAbsent) {
    return CensoCompanion(
      id: Value(id),
      idCenso: idCenso == null && nullToAbsent
          ? const Value.absent()
          : Value(idCenso),
      fechaCenso: Value(fechaCenso),
      identificador: Value(identificador),
      observacionCenso: observacionCenso == null && nullToAbsent
          ? const Value.absent()
          : Value(observacionCenso),
      nombreLote: Value(nombreLote),
      numeroIndividuos: numeroIndividuos == null && nullToAbsent
          ? const Value.absent()
          : Value(numeroIndividuos),
      nombrePlaga: Value(nombrePlaga),
      estadoPlaga: Value(estadoPlaga),
      sincronizado: Value(sincronizado),
      responsable: Value(responsable),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
    );
  }

  factory CensoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CensoData(
      id: serializer.fromJson<int>(json['id']),
      idCenso: serializer.fromJson<int?>(json['idCenso']),
      fechaCenso: serializer.fromJson<DateTime>(json['fechaCenso']),
      identificador: serializer.fromJson<String>(json['identificador']),
      observacionCenso: serializer.fromJson<String?>(json['observacionCenso']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      numeroIndividuos: serializer.fromJson<int?>(json['numeroIndividuos']),
      nombrePlaga: serializer.fromJson<String>(json['nombrePlaga']),
      estadoPlaga: serializer.fromJson<String>(json['estadoPlaga']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
      responsable: serializer.fromJson<String>(json['responsable']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCenso': serializer.toJson<int?>(idCenso),
      'fechaCenso': serializer.toJson<DateTime>(fechaCenso),
      'identificador': serializer.toJson<String>(identificador),
      'observacionCenso': serializer.toJson<String?>(observacionCenso),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'numeroIndividuos': serializer.toJson<int?>(numeroIndividuos),
      'nombrePlaga': serializer.toJson<String>(nombrePlaga),
      'estadoPlaga': serializer.toJson<String>(estadoPlaga),
      'sincronizado': serializer.toJson<bool>(sincronizado),
      'responsable': serializer.toJson<String>(responsable),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
    };
  }

  CensoData copyWith(
          {int? id,
          Value<int?> idCenso = const Value.absent(),
          DateTime? fechaCenso,
          String? identificador,
          Value<String?> observacionCenso = const Value.absent(),
          String? nombreLote,
          Value<int?> numeroIndividuos = const Value.absent(),
          String? nombrePlaga,
          String? estadoPlaga,
          bool? sincronizado,
          String? responsable,
          Value<double?> latitude = const Value.absent(),
          Value<double?> longitude = const Value.absent()}) =>
      CensoData(
        id: id ?? this.id,
        idCenso: idCenso.present ? idCenso.value : this.idCenso,
        fechaCenso: fechaCenso ?? this.fechaCenso,
        identificador: identificador ?? this.identificador,
        observacionCenso: observacionCenso.present
            ? observacionCenso.value
            : this.observacionCenso,
        nombreLote: nombreLote ?? this.nombreLote,
        numeroIndividuos: numeroIndividuos.present
            ? numeroIndividuos.value
            : this.numeroIndividuos,
        nombrePlaga: nombrePlaga ?? this.nombrePlaga,
        estadoPlaga: estadoPlaga ?? this.estadoPlaga,
        sincronizado: sincronizado ?? this.sincronizado,
        responsable: responsable ?? this.responsable,
        latitude: latitude.present ? latitude.value : this.latitude,
        longitude: longitude.present ? longitude.value : this.longitude,
      );
  @override
  String toString() {
    return (StringBuffer('CensoData(')
          ..write('id: $id, ')
          ..write('idCenso: $idCenso, ')
          ..write('fechaCenso: $fechaCenso, ')
          ..write('identificador: $identificador, ')
          ..write('observacionCenso: $observacionCenso, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('numeroIndividuos: $numeroIndividuos, ')
          ..write('nombrePlaga: $nombrePlaga, ')
          ..write('estadoPlaga: $estadoPlaga, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('responsable: $responsable, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      idCenso,
      fechaCenso,
      identificador,
      observacionCenso,
      nombreLote,
      numeroIndividuos,
      nombrePlaga,
      estadoPlaga,
      sincronizado,
      responsable,
      latitude,
      longitude);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CensoData &&
          other.id == this.id &&
          other.idCenso == this.idCenso &&
          other.fechaCenso == this.fechaCenso &&
          other.identificador == this.identificador &&
          other.observacionCenso == this.observacionCenso &&
          other.nombreLote == this.nombreLote &&
          other.numeroIndividuos == this.numeroIndividuos &&
          other.nombrePlaga == this.nombrePlaga &&
          other.estadoPlaga == this.estadoPlaga &&
          other.sincronizado == this.sincronizado &&
          other.responsable == this.responsable &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude);
}

class CensoCompanion extends UpdateCompanion<CensoData> {
  final Value<int> id;
  final Value<int?> idCenso;
  final Value<DateTime> fechaCenso;
  final Value<String> identificador;
  final Value<String?> observacionCenso;
  final Value<String> nombreLote;
  final Value<int?> numeroIndividuos;
  final Value<String> nombrePlaga;
  final Value<String> estadoPlaga;
  final Value<bool> sincronizado;
  final Value<String> responsable;
  final Value<double?> latitude;
  final Value<double?> longitude;
  const CensoCompanion({
    this.id = const Value.absent(),
    this.idCenso = const Value.absent(),
    this.fechaCenso = const Value.absent(),
    this.identificador = const Value.absent(),
    this.observacionCenso = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.numeroIndividuos = const Value.absent(),
    this.nombrePlaga = const Value.absent(),
    this.estadoPlaga = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.responsable = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
  });
  CensoCompanion.insert({
    this.id = const Value.absent(),
    this.idCenso = const Value.absent(),
    required DateTime fechaCenso,
    required String identificador,
    this.observacionCenso = const Value.absent(),
    required String nombreLote,
    this.numeroIndividuos = const Value.absent(),
    required String nombrePlaga,
    this.estadoPlaga = const Value.absent(),
    this.sincronizado = const Value.absent(),
    required String responsable,
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
  })  : fechaCenso = Value(fechaCenso),
        identificador = Value(identificador),
        nombreLote = Value(nombreLote),
        nombrePlaga = Value(nombrePlaga),
        responsable = Value(responsable);
  static Insertable<CensoData> custom({
    Expression<int>? id,
    Expression<int>? idCenso,
    Expression<DateTime>? fechaCenso,
    Expression<String>? identificador,
    Expression<String>? observacionCenso,
    Expression<String>? nombreLote,
    Expression<int>? numeroIndividuos,
    Expression<String>? nombrePlaga,
    Expression<String>? estadoPlaga,
    Expression<bool>? sincronizado,
    Expression<String>? responsable,
    Expression<double>? latitude,
    Expression<double>? longitude,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCenso != null) 'id_censo': idCenso,
      if (fechaCenso != null) 'fecha_censo': fechaCenso,
      if (identificador != null) 'identificador': identificador,
      if (observacionCenso != null) 'observacion_censo': observacionCenso,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (numeroIndividuos != null) 'numero_individuos': numeroIndividuos,
      if (nombrePlaga != null) 'nombre_plaga': nombrePlaga,
      if (estadoPlaga != null) 'estado_plaga': estadoPlaga,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (responsable != null) 'responsable': responsable,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    });
  }

  CensoCompanion copyWith(
      {Value<int>? id,
      Value<int?>? idCenso,
      Value<DateTime>? fechaCenso,
      Value<String>? identificador,
      Value<String?>? observacionCenso,
      Value<String>? nombreLote,
      Value<int?>? numeroIndividuos,
      Value<String>? nombrePlaga,
      Value<String>? estadoPlaga,
      Value<bool>? sincronizado,
      Value<String>? responsable,
      Value<double?>? latitude,
      Value<double?>? longitude}) {
    return CensoCompanion(
      id: id ?? this.id,
      idCenso: idCenso ?? this.idCenso,
      fechaCenso: fechaCenso ?? this.fechaCenso,
      identificador: identificador ?? this.identificador,
      observacionCenso: observacionCenso ?? this.observacionCenso,
      nombreLote: nombreLote ?? this.nombreLote,
      numeroIndividuos: numeroIndividuos ?? this.numeroIndividuos,
      nombrePlaga: nombrePlaga ?? this.nombrePlaga,
      estadoPlaga: estadoPlaga ?? this.estadoPlaga,
      sincronizado: sincronizado ?? this.sincronizado,
      responsable: responsable ?? this.responsable,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idCenso.present) {
      map['id_censo'] = Variable<int>(idCenso.value);
    }
    if (fechaCenso.present) {
      map['fecha_censo'] = Variable<DateTime>(fechaCenso.value);
    }
    if (identificador.present) {
      map['identificador'] = Variable<String>(identificador.value);
    }
    if (observacionCenso.present) {
      map['observacion_censo'] = Variable<String>(observacionCenso.value);
    }
    if (nombreLote.present) {
      map['nombre_lote'] = Variable<String>(nombreLote.value);
    }
    if (numeroIndividuos.present) {
      map['numero_individuos'] = Variable<int>(numeroIndividuos.value);
    }
    if (nombrePlaga.present) {
      map['nombre_plaga'] = Variable<String>(nombrePlaga.value);
    }
    if (estadoPlaga.present) {
      map['estado_plaga'] = Variable<String>(estadoPlaga.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CensoCompanion(')
          ..write('id: $id, ')
          ..write('idCenso: $idCenso, ')
          ..write('fechaCenso: $fechaCenso, ')
          ..write('identificador: $identificador, ')
          ..write('observacionCenso: $observacionCenso, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('numeroIndividuos: $numeroIndividuos, ')
          ..write('nombrePlaga: $nombrePlaga, ')
          ..write('estadoPlaga: $estadoPlaga, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('responsable: $responsable, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }
}

class $CosechasTable extends Cosechas with TableInfo<$CosechasTable, Cosecha> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CosechasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idCosechaMeta =
      const VerificationMeta('idCosecha');
  @override
  late final GeneratedColumn<int> idCosecha = GeneratedColumn<int>(
      'id_cosecha', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreLoteMeta =
      const VerificationMeta('nombreLote');
  @override
  late final GeneratedColumn<String> nombreLote = GeneratedColumn<String>(
      'nombre_lote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  @override
  late final GeneratedColumn<DateTime> fechaIngreso = GeneratedColumn<DateTime>(
      'fecha_ingreso', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fechaSalidaMeta =
      const VerificationMeta('fechaSalida');
  @override
  late final GeneratedColumn<DateTime> fechaSalida = GeneratedColumn<DateTime>(
      'fecha_salida', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cantidadRacimosMeta =
      const VerificationMeta('cantidadRacimos');
  @override
  late final GeneratedColumn<int> cantidadRacimos = GeneratedColumn<int>(
      'cantidad_racimos', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kilosMeta = const VerificationMeta('kilos');
  @override
  late final GeneratedColumn<int> kilos = GeneratedColumn<int>(
      'kilos', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idViajeMeta =
      const VerificationMeta('idViaje');
  @override
  late final GeneratedColumn<int> idViaje = GeneratedColumn<int>(
      'id_viaje', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _completadaMeta =
      const VerificationMeta('completada');
  @override
  late final GeneratedColumn<bool> completada =
      GeneratedColumn<bool>('completada', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("completada" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idCosecha,
        nombreLote,
        fechaIngreso,
        fechaSalida,
        cantidadRacimos,
        kilos,
        idViaje,
        completada,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'cosechas';
  @override
  String get actualTableName => 'cosechas';
  @override
  VerificationContext validateIntegrity(Insertable<Cosecha> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_cosecha')) {
      context.handle(_idCosechaMeta,
          idCosecha.isAcceptableOrUnknown(data['id_cosecha']!, _idCosechaMeta));
    }
    if (data.containsKey('nombre_lote')) {
      context.handle(
          _nombreLoteMeta,
          nombreLote.isAcceptableOrUnknown(
              data['nombre_lote']!, _nombreLoteMeta));
    } else if (isInserting) {
      context.missing(_nombreLoteMeta);
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
          _fechaIngresoMeta,
          fechaIngreso.isAcceptableOrUnknown(
              data['fecha_ingreso']!, _fechaIngresoMeta));
    } else if (isInserting) {
      context.missing(_fechaIngresoMeta);
    }
    if (data.containsKey('fecha_salida')) {
      context.handle(
          _fechaSalidaMeta,
          fechaSalida.isAcceptableOrUnknown(
              data['fecha_salida']!, _fechaSalidaMeta));
    }
    if (data.containsKey('cantidad_racimos')) {
      context.handle(
          _cantidadRacimosMeta,
          cantidadRacimos.isAcceptableOrUnknown(
              data['cantidad_racimos']!, _cantidadRacimosMeta));
    } else if (isInserting) {
      context.missing(_cantidadRacimosMeta);
    }
    if (data.containsKey('kilos')) {
      context.handle(
          _kilosMeta, kilos.isAcceptableOrUnknown(data['kilos']!, _kilosMeta));
    } else if (isInserting) {
      context.missing(_kilosMeta);
    }
    if (data.containsKey('id_viaje')) {
      context.handle(_idViajeMeta,
          idViaje.isAcceptableOrUnknown(data['id_viaje']!, _idViajeMeta));
    }
    if (data.containsKey('completada')) {
      context.handle(
          _completadaMeta,
          completada.isAcceptableOrUnknown(
              data['completada']!, _completadaMeta));
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cosecha map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cosecha(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idCosecha: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_cosecha']),
      nombreLote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_lote'])!,
      fechaIngreso: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_ingreso'])!,
      fechaSalida: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_salida']),
      cantidadRacimos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad_racimos'])!,
      kilos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kilos'])!,
      idViaje: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_viaje']),
      completada: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completada'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $CosechasTable createAlias(String alias) {
    return $CosechasTable(attachedDatabase, alias);
  }
}

class Cosecha extends DataClass implements Insertable<Cosecha> {
  final int id;
  final int? idCosecha;
  final String nombreLote;
  final DateTime fechaIngreso;
  final DateTime? fechaSalida;
  final int cantidadRacimos;
  final int kilos;
  final int? idViaje;
  final bool completada;
  final bool sincronizado;
  const Cosecha(
      {required this.id,
      this.idCosecha,
      required this.nombreLote,
      required this.fechaIngreso,
      this.fechaSalida,
      required this.cantidadRacimos,
      required this.kilos,
      this.idViaje,
      required this.completada,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idCosecha != null) {
      map['id_cosecha'] = Variable<int>(idCosecha);
    }
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    if (!nullToAbsent || fechaSalida != null) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida);
    }
    map['cantidad_racimos'] = Variable<int>(cantidadRacimos);
    map['kilos'] = Variable<int>(kilos);
    if (!nullToAbsent || idViaje != null) {
      map['id_viaje'] = Variable<int>(idViaje);
    }
    map['completada'] = Variable<bool>(completada);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  CosechasCompanion toCompanion(bool nullToAbsent) {
    return CosechasCompanion(
      id: Value(id),
      idCosecha: idCosecha == null && nullToAbsent
          ? const Value.absent()
          : Value(idCosecha),
      nombreLote: Value(nombreLote),
      fechaIngreso: Value(fechaIngreso),
      fechaSalida: fechaSalida == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaSalida),
      cantidadRacimos: Value(cantidadRacimos),
      kilos: Value(kilos),
      idViaje: idViaje == null && nullToAbsent
          ? const Value.absent()
          : Value(idViaje),
      completada: Value(completada),
      sincronizado: Value(sincronizado),
    );
  }

  factory Cosecha.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cosecha(
      id: serializer.fromJson<int>(json['id']),
      idCosecha: serializer.fromJson<int?>(json['idCosecha']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      fechaSalida: serializer.fromJson<DateTime?>(json['fechaSalida']),
      cantidadRacimos: serializer.fromJson<int>(json['cantidadRacimos']),
      kilos: serializer.fromJson<int>(json['kilos']),
      idViaje: serializer.fromJson<int?>(json['idViaje']),
      completada: serializer.fromJson<bool>(json['completada']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCosecha': serializer.toJson<int?>(idCosecha),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'fechaSalida': serializer.toJson<DateTime?>(fechaSalida),
      'cantidadRacimos': serializer.toJson<int>(cantidadRacimos),
      'kilos': serializer.toJson<int>(kilos),
      'idViaje': serializer.toJson<int?>(idViaje),
      'completada': serializer.toJson<bool>(completada),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  Cosecha copyWith(
          {int? id,
          Value<int?> idCosecha = const Value.absent(),
          String? nombreLote,
          DateTime? fechaIngreso,
          Value<DateTime?> fechaSalida = const Value.absent(),
          int? cantidadRacimos,
          int? kilos,
          Value<int?> idViaje = const Value.absent(),
          bool? completada,
          bool? sincronizado}) =>
      Cosecha(
        id: id ?? this.id,
        idCosecha: idCosecha.present ? idCosecha.value : this.idCosecha,
        nombreLote: nombreLote ?? this.nombreLote,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        fechaSalida: fechaSalida.present ? fechaSalida.value : this.fechaSalida,
        cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
        kilos: kilos ?? this.kilos,
        idViaje: idViaje.present ? idViaje.value : this.idViaje,
        completada: completada ?? this.completada,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('Cosecha(')
          ..write('id: $id, ')
          ..write('idCosecha: $idCosecha, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('kilos: $kilos, ')
          ..write('idViaje: $idViaje, ')
          ..write('completada: $completada, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idCosecha, nombreLote, fechaIngreso,
      fechaSalida, cantidadRacimos, kilos, idViaje, completada, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cosecha &&
          other.id == this.id &&
          other.idCosecha == this.idCosecha &&
          other.nombreLote == this.nombreLote &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaSalida == this.fechaSalida &&
          other.cantidadRacimos == this.cantidadRacimos &&
          other.kilos == this.kilos &&
          other.idViaje == this.idViaje &&
          other.completada == this.completada &&
          other.sincronizado == this.sincronizado);
}

class CosechasCompanion extends UpdateCompanion<Cosecha> {
  final Value<int> id;
  final Value<int?> idCosecha;
  final Value<String> nombreLote;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaSalida;
  final Value<int> cantidadRacimos;
  final Value<int> kilos;
  final Value<int?> idViaje;
  final Value<bool> completada;
  final Value<bool> sincronizado;
  const CosechasCompanion({
    this.id = const Value.absent(),
    this.idCosecha = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.cantidadRacimos = const Value.absent(),
    this.kilos = const Value.absent(),
    this.idViaje = const Value.absent(),
    this.completada = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  CosechasCompanion.insert({
    this.id = const Value.absent(),
    this.idCosecha = const Value.absent(),
    required String nombreLote,
    required DateTime fechaIngreso,
    this.fechaSalida = const Value.absent(),
    required int cantidadRacimos,
    required int kilos,
    this.idViaje = const Value.absent(),
    this.completada = const Value.absent(),
    this.sincronizado = const Value.absent(),
  })  : nombreLote = Value(nombreLote),
        fechaIngreso = Value(fechaIngreso),
        cantidadRacimos = Value(cantidadRacimos),
        kilos = Value(kilos);
  static Insertable<Cosecha> custom({
    Expression<int>? id,
    Expression<int>? idCosecha,
    Expression<String>? nombreLote,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime>? fechaSalida,
    Expression<int>? cantidadRacimos,
    Expression<int>? kilos,
    Expression<int>? idViaje,
    Expression<bool>? completada,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCosecha != null) 'id_cosecha': idCosecha,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (cantidadRacimos != null) 'cantidad_racimos': cantidadRacimos,
      if (kilos != null) 'kilos': kilos,
      if (idViaje != null) 'id_viaje': idViaje,
      if (completada != null) 'completada': completada,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  CosechasCompanion copyWith(
      {Value<int>? id,
      Value<int?>? idCosecha,
      Value<String>? nombreLote,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? fechaSalida,
      Value<int>? cantidadRacimos,
      Value<int>? kilos,
      Value<int?>? idViaje,
      Value<bool>? completada,
      Value<bool>? sincronizado}) {
    return CosechasCompanion(
      id: id ?? this.id,
      idCosecha: idCosecha ?? this.idCosecha,
      nombreLote: nombreLote ?? this.nombreLote,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
      kilos: kilos ?? this.kilos,
      idViaje: idViaje ?? this.idViaje,
      completada: completada ?? this.completada,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idCosecha.present) {
      map['id_cosecha'] = Variable<int>(idCosecha.value);
    }
    if (nombreLote.present) {
      map['nombre_lote'] = Variable<String>(nombreLote.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (fechaSalida.present) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida.value);
    }
    if (cantidadRacimos.present) {
      map['cantidad_racimos'] = Variable<int>(cantidadRacimos.value);
    }
    if (kilos.present) {
      map['kilos'] = Variable<int>(kilos.value);
    }
    if (idViaje.present) {
      map['id_viaje'] = Variable<int>(idViaje.value);
    }
    if (completada.present) {
      map['completada'] = Variable<bool>(completada.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CosechasCompanion(')
          ..write('id: $id, ')
          ..write('idCosecha: $idCosecha, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('kilos: $kilos, ')
          ..write('idViaje: $idViaje, ')
          ..write('completada: $completada, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $CosechaDiariaTable extends CosechaDiaria
    with TableInfo<$CosechaDiariaTable, CosechaDiariaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CosechaDiariaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idCosechaMeta =
      const VerificationMeta('idCosecha');
  @override
  late final GeneratedColumn<int> idCosecha = GeneratedColumn<int>(
      'id_cosecha', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES cosechas(id)');
  static const VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  @override
  late final GeneratedColumn<DateTime> fechaIngreso = GeneratedColumn<DateTime>(
      'fecha_ingreso', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _kilosMeta = const VerificationMeta('kilos');
  @override
  late final GeneratedColumn<int> kilos = GeneratedColumn<int>(
      'kilos', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _cantidadRacimosMeta =
      const VerificationMeta('cantidadRacimos');
  @override
  late final GeneratedColumn<int> cantidadRacimos = GeneratedColumn<int>(
      'cantidad_racimos', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idCosecha,
        fechaIngreso,
        kilos,
        cantidadRacimos,
        responsable,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'cosecha_diaria';
  @override
  String get actualTableName => 'cosecha_diaria';
  @override
  VerificationContext validateIntegrity(Insertable<CosechaDiariaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_cosecha')) {
      context.handle(_idCosechaMeta,
          idCosecha.isAcceptableOrUnknown(data['id_cosecha']!, _idCosechaMeta));
    } else if (isInserting) {
      context.missing(_idCosechaMeta);
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
          _fechaIngresoMeta,
          fechaIngreso.isAcceptableOrUnknown(
              data['fecha_ingreso']!, _fechaIngresoMeta));
    } else if (isInserting) {
      context.missing(_fechaIngresoMeta);
    }
    if (data.containsKey('kilos')) {
      context.handle(
          _kilosMeta, kilos.isAcceptableOrUnknown(data['kilos']!, _kilosMeta));
    } else if (isInserting) {
      context.missing(_kilosMeta);
    }
    if (data.containsKey('cantidad_racimos')) {
      context.handle(
          _cantidadRacimosMeta,
          cantidadRacimos.isAcceptableOrUnknown(
              data['cantidad_racimos']!, _cantidadRacimosMeta));
    } else if (isInserting) {
      context.missing(_cantidadRacimosMeta);
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CosechaDiariaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CosechaDiariaData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idCosecha: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_cosecha'])!,
      fechaIngreso: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_ingreso'])!,
      kilos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kilos'])!,
      cantidadRacimos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad_racimos'])!,
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $CosechaDiariaTable createAlias(String alias) {
    return $CosechaDiariaTable(attachedDatabase, alias);
  }
}

class CosechaDiariaData extends DataClass
    implements Insertable<CosechaDiariaData> {
  final int id;
  final int idCosecha;
  final DateTime fechaIngreso;
  final int kilos;
  final int cantidadRacimos;
  final String responsable;
  final bool sincronizado;
  const CosechaDiariaData(
      {required this.id,
      required this.idCosecha,
      required this.fechaIngreso,
      required this.kilos,
      required this.cantidadRacimos,
      required this.responsable,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_cosecha'] = Variable<int>(idCosecha);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    map['kilos'] = Variable<int>(kilos);
    map['cantidad_racimos'] = Variable<int>(cantidadRacimos);
    map['responsable'] = Variable<String>(responsable);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  CosechaDiariaCompanion toCompanion(bool nullToAbsent) {
    return CosechaDiariaCompanion(
      id: Value(id),
      idCosecha: Value(idCosecha),
      fechaIngreso: Value(fechaIngreso),
      kilos: Value(kilos),
      cantidadRacimos: Value(cantidadRacimos),
      responsable: Value(responsable),
      sincronizado: Value(sincronizado),
    );
  }

  factory CosechaDiariaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CosechaDiariaData(
      id: serializer.fromJson<int>(json['id']),
      idCosecha: serializer.fromJson<int>(json['idCosecha']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      kilos: serializer.fromJson<int>(json['kilos']),
      cantidadRacimos: serializer.fromJson<int>(json['cantidadRacimos']),
      responsable: serializer.fromJson<String>(json['responsable']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCosecha': serializer.toJson<int>(idCosecha),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'kilos': serializer.toJson<int>(kilos),
      'cantidadRacimos': serializer.toJson<int>(cantidadRacimos),
      'responsable': serializer.toJson<String>(responsable),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  CosechaDiariaData copyWith(
          {int? id,
          int? idCosecha,
          DateTime? fechaIngreso,
          int? kilos,
          int? cantidadRacimos,
          String? responsable,
          bool? sincronizado}) =>
      CosechaDiariaData(
        id: id ?? this.id,
        idCosecha: idCosecha ?? this.idCosecha,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        kilos: kilos ?? this.kilos,
        cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
        responsable: responsable ?? this.responsable,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('CosechaDiariaData(')
          ..write('id: $id, ')
          ..write('idCosecha: $idCosecha, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('kilos: $kilos, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idCosecha, fechaIngreso, kilos,
      cantidadRacimos, responsable, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CosechaDiariaData &&
          other.id == this.id &&
          other.idCosecha == this.idCosecha &&
          other.fechaIngreso == this.fechaIngreso &&
          other.kilos == this.kilos &&
          other.cantidadRacimos == this.cantidadRacimos &&
          other.responsable == this.responsable &&
          other.sincronizado == this.sincronizado);
}

class CosechaDiariaCompanion extends UpdateCompanion<CosechaDiariaData> {
  final Value<int> id;
  final Value<int> idCosecha;
  final Value<DateTime> fechaIngreso;
  final Value<int> kilos;
  final Value<int> cantidadRacimos;
  final Value<String> responsable;
  final Value<bool> sincronizado;
  const CosechaDiariaCompanion({
    this.id = const Value.absent(),
    this.idCosecha = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.kilos = const Value.absent(),
    this.cantidadRacimos = const Value.absent(),
    this.responsable = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  CosechaDiariaCompanion.insert({
    this.id = const Value.absent(),
    required int idCosecha,
    required DateTime fechaIngreso,
    required int kilos,
    required int cantidadRacimos,
    required String responsable,
    this.sincronizado = const Value.absent(),
  })  : idCosecha = Value(idCosecha),
        fechaIngreso = Value(fechaIngreso),
        kilos = Value(kilos),
        cantidadRacimos = Value(cantidadRacimos),
        responsable = Value(responsable);
  static Insertable<CosechaDiariaData> custom({
    Expression<int>? id,
    Expression<int>? idCosecha,
    Expression<DateTime>? fechaIngreso,
    Expression<int>? kilos,
    Expression<int>? cantidadRacimos,
    Expression<String>? responsable,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCosecha != null) 'id_cosecha': idCosecha,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (kilos != null) 'kilos': kilos,
      if (cantidadRacimos != null) 'cantidad_racimos': cantidadRacimos,
      if (responsable != null) 'responsable': responsable,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  CosechaDiariaCompanion copyWith(
      {Value<int>? id,
      Value<int>? idCosecha,
      Value<DateTime>? fechaIngreso,
      Value<int>? kilos,
      Value<int>? cantidadRacimos,
      Value<String>? responsable,
      Value<bool>? sincronizado}) {
    return CosechaDiariaCompanion(
      id: id ?? this.id,
      idCosecha: idCosecha ?? this.idCosecha,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      kilos: kilos ?? this.kilos,
      cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
      responsable: responsable ?? this.responsable,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idCosecha.present) {
      map['id_cosecha'] = Variable<int>(idCosecha.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (kilos.present) {
      map['kilos'] = Variable<int>(kilos.value);
    }
    if (cantidadRacimos.present) {
      map['cantidad_racimos'] = Variable<int>(cantidadRacimos.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CosechaDiariaCompanion(')
          ..write('id: $id, ')
          ..write('idCosecha: $idCosecha, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('kilos: $kilos, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $EnfermedadesTable extends Enfermedades
    with TableInfo<$EnfermedadesTable, Enfermedade> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnfermedadesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nombreEnfermedadMeta =
      const VerificationMeta('nombreEnfermedad');
  @override
  late final GeneratedColumn<String> nombreEnfermedad = GeneratedColumn<String>(
      'nombre_enfermedad', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _procedimientoEnfermedadMeta =
      const VerificationMeta('procedimientoEnfermedad');
  @override
  late final GeneratedColumn<String> procedimientoEnfermedad =
      GeneratedColumn<String>('procedimiento_enfermedad', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaUltimaActualizacionMeta =
      const VerificationMeta('fechaUltimaActualizacion');
  @override
  late final GeneratedColumn<DateTime> fechaUltimaActualizacion =
      GeneratedColumn<DateTime>('fecha_ultima_actualizacion', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [nombreEnfermedad, procedimientoEnfermedad, fechaUltimaActualizacion];
  @override
  String get aliasedName => _alias ?? 'enfermedades';
  @override
  String get actualTableName => 'enfermedades';
  @override
  VerificationContext validateIntegrity(Insertable<Enfermedade> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nombre_enfermedad')) {
      context.handle(
          _nombreEnfermedadMeta,
          nombreEnfermedad.isAcceptableOrUnknown(
              data['nombre_enfermedad']!, _nombreEnfermedadMeta));
    } else if (isInserting) {
      context.missing(_nombreEnfermedadMeta);
    }
    if (data.containsKey('procedimiento_enfermedad')) {
      context.handle(
          _procedimientoEnfermedadMeta,
          procedimientoEnfermedad.isAcceptableOrUnknown(
              data['procedimiento_enfermedad']!, _procedimientoEnfermedadMeta));
    } else if (isInserting) {
      context.missing(_procedimientoEnfermedadMeta);
    }
    if (data.containsKey('fecha_ultima_actualizacion')) {
      context.handle(
          _fechaUltimaActualizacionMeta,
          fechaUltimaActualizacion.isAcceptableOrUnknown(
              data['fecha_ultima_actualizacion']!,
              _fechaUltimaActualizacionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {nombreEnfermedad};
  @override
  Enfermedade map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Enfermedade(
      nombreEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nombre_enfermedad'])!,
      procedimientoEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}procedimiento_enfermedad'])!,
      fechaUltimaActualizacion: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}fecha_ultima_actualizacion']),
    );
  }

  @override
  $EnfermedadesTable createAlias(String alias) {
    return $EnfermedadesTable(attachedDatabase, alias);
  }
}

class Enfermedade extends DataClass implements Insertable<Enfermedade> {
  final String nombreEnfermedad;
  final String procedimientoEnfermedad;
  final DateTime? fechaUltimaActualizacion;
  const Enfermedade(
      {required this.nombreEnfermedad,
      required this.procedimientoEnfermedad,
      this.fechaUltimaActualizacion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nombre_enfermedad'] = Variable<String>(nombreEnfermedad);
    map['procedimiento_enfermedad'] = Variable<String>(procedimientoEnfermedad);
    if (!nullToAbsent || fechaUltimaActualizacion != null) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion);
    }
    return map;
  }

  EnfermedadesCompanion toCompanion(bool nullToAbsent) {
    return EnfermedadesCompanion(
      nombreEnfermedad: Value(nombreEnfermedad),
      procedimientoEnfermedad: Value(procedimientoEnfermedad),
      fechaUltimaActualizacion: fechaUltimaActualizacion == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaUltimaActualizacion),
    );
  }

  factory Enfermedade.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Enfermedade(
      nombreEnfermedad: serializer.fromJson<String>(json['nombreEnfermedad']),
      procedimientoEnfermedad:
          serializer.fromJson<String>(json['procedimientoEnfermedad']),
      fechaUltimaActualizacion:
          serializer.fromJson<DateTime?>(json['fechaUltimaActualizacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nombreEnfermedad': serializer.toJson<String>(nombreEnfermedad),
      'procedimientoEnfermedad':
          serializer.toJson<String>(procedimientoEnfermedad),
      'fechaUltimaActualizacion':
          serializer.toJson<DateTime?>(fechaUltimaActualizacion),
    };
  }

  Enfermedade copyWith(
          {String? nombreEnfermedad,
          String? procedimientoEnfermedad,
          Value<DateTime?> fechaUltimaActualizacion = const Value.absent()}) =>
      Enfermedade(
        nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
        procedimientoEnfermedad:
            procedimientoEnfermedad ?? this.procedimientoEnfermedad,
        fechaUltimaActualizacion: fechaUltimaActualizacion.present
            ? fechaUltimaActualizacion.value
            : this.fechaUltimaActualizacion,
      );
  @override
  String toString() {
    return (StringBuffer('Enfermedade(')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('procedimientoEnfermedad: $procedimientoEnfermedad, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      nombreEnfermedad, procedimientoEnfermedad, fechaUltimaActualizacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Enfermedade &&
          other.nombreEnfermedad == this.nombreEnfermedad &&
          other.procedimientoEnfermedad == this.procedimientoEnfermedad &&
          other.fechaUltimaActualizacion == this.fechaUltimaActualizacion);
}

class EnfermedadesCompanion extends UpdateCompanion<Enfermedade> {
  final Value<String> nombreEnfermedad;
  final Value<String> procedimientoEnfermedad;
  final Value<DateTime?> fechaUltimaActualizacion;
  const EnfermedadesCompanion({
    this.nombreEnfermedad = const Value.absent(),
    this.procedimientoEnfermedad = const Value.absent(),
    this.fechaUltimaActualizacion = const Value.absent(),
  });
  EnfermedadesCompanion.insert({
    required String nombreEnfermedad,
    required String procedimientoEnfermedad,
    this.fechaUltimaActualizacion = const Value.absent(),
  })  : nombreEnfermedad = Value(nombreEnfermedad),
        procedimientoEnfermedad = Value(procedimientoEnfermedad);
  static Insertable<Enfermedade> custom({
    Expression<String>? nombreEnfermedad,
    Expression<String>? procedimientoEnfermedad,
    Expression<DateTime>? fechaUltimaActualizacion,
  }) {
    return RawValuesInsertable({
      if (nombreEnfermedad != null) 'nombre_enfermedad': nombreEnfermedad,
      if (procedimientoEnfermedad != null)
        'procedimiento_enfermedad': procedimientoEnfermedad,
      if (fechaUltimaActualizacion != null)
        'fecha_ultima_actualizacion': fechaUltimaActualizacion,
    });
  }

  EnfermedadesCompanion copyWith(
      {Value<String>? nombreEnfermedad,
      Value<String>? procedimientoEnfermedad,
      Value<DateTime?>? fechaUltimaActualizacion}) {
    return EnfermedadesCompanion(
      nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
      procedimientoEnfermedad:
          procedimientoEnfermedad ?? this.procedimientoEnfermedad,
      fechaUltimaActualizacion:
          fechaUltimaActualizacion ?? this.fechaUltimaActualizacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nombreEnfermedad.present) {
      map['nombre_enfermedad'] = Variable<String>(nombreEnfermedad.value);
    }
    if (procedimientoEnfermedad.present) {
      map['procedimiento_enfermedad'] =
          Variable<String>(procedimientoEnfermedad.value);
    }
    if (fechaUltimaActualizacion.present) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnfermedadesCompanion(')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('procedimientoEnfermedad: $procedimientoEnfermedad, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }
}

class $EtapasTable extends Etapas with TableInfo<$EtapasTable, Etapa> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EtapasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreEnfermedadMeta =
      const VerificationMeta('nombreEnfermedad');
  @override
  late final GeneratedColumn<String> nombreEnfermedad = GeneratedColumn<String>(
      'nombre_enfermedad', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES enfermedades(nombre_enfermedad)');
  static const VerificationMeta _nombreEtapaMeta =
      const VerificationMeta('nombreEtapa');
  @override
  late final GeneratedColumn<String> nombreEtapa = GeneratedColumn<String>(
      'nombre_etapa', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _procedimientoEtapaMeta =
      const VerificationMeta('procedimientoEtapa');
  @override
  late final GeneratedColumn<String> procedimientoEtapa =
      GeneratedColumn<String>('procedimiento_etapa', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nombreEnfermedad, nombreEtapa, procedimientoEtapa];
  @override
  String get aliasedName => _alias ?? 'etapas';
  @override
  String get actualTableName => 'etapas';
  @override
  VerificationContext validateIntegrity(Insertable<Etapa> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre_enfermedad')) {
      context.handle(
          _nombreEnfermedadMeta,
          nombreEnfermedad.isAcceptableOrUnknown(
              data['nombre_enfermedad']!, _nombreEnfermedadMeta));
    } else if (isInserting) {
      context.missing(_nombreEnfermedadMeta);
    }
    if (data.containsKey('nombre_etapa')) {
      context.handle(
          _nombreEtapaMeta,
          nombreEtapa.isAcceptableOrUnknown(
              data['nombre_etapa']!, _nombreEtapaMeta));
    } else if (isInserting) {
      context.missing(_nombreEtapaMeta);
    }
    if (data.containsKey('procedimiento_etapa')) {
      context.handle(
          _procedimientoEtapaMeta,
          procedimientoEtapa.isAcceptableOrUnknown(
              data['procedimiento_etapa']!, _procedimientoEtapaMeta));
    } else if (isInserting) {
      context.missing(_procedimientoEtapaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Etapa map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Etapa(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nombreEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nombre_enfermedad'])!,
      nombreEtapa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_etapa'])!,
      procedimientoEtapa: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}procedimiento_etapa'])!,
    );
  }

  @override
  $EtapasTable createAlias(String alias) {
    return $EtapasTable(attachedDatabase, alias);
  }
}

class Etapa extends DataClass implements Insertable<Etapa> {
  final int id;
  final String nombreEnfermedad;
  final String nombreEtapa;
  final String procedimientoEtapa;
  const Etapa(
      {required this.id,
      required this.nombreEnfermedad,
      required this.nombreEtapa,
      required this.procedimientoEtapa});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre_enfermedad'] = Variable<String>(nombreEnfermedad);
    map['nombre_etapa'] = Variable<String>(nombreEtapa);
    map['procedimiento_etapa'] = Variable<String>(procedimientoEtapa);
    return map;
  }

  EtapasCompanion toCompanion(bool nullToAbsent) {
    return EtapasCompanion(
      id: Value(id),
      nombreEnfermedad: Value(nombreEnfermedad),
      nombreEtapa: Value(nombreEtapa),
      procedimientoEtapa: Value(procedimientoEtapa),
    );
  }

  factory Etapa.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Etapa(
      id: serializer.fromJson<int>(json['id']),
      nombreEnfermedad: serializer.fromJson<String>(json['nombreEnfermedad']),
      nombreEtapa: serializer.fromJson<String>(json['nombreEtapa']),
      procedimientoEtapa:
          serializer.fromJson<String>(json['procedimientoEtapa']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombreEnfermedad': serializer.toJson<String>(nombreEnfermedad),
      'nombreEtapa': serializer.toJson<String>(nombreEtapa),
      'procedimientoEtapa': serializer.toJson<String>(procedimientoEtapa),
    };
  }

  Etapa copyWith(
          {int? id,
          String? nombreEnfermedad,
          String? nombreEtapa,
          String? procedimientoEtapa}) =>
      Etapa(
        id: id ?? this.id,
        nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
        nombreEtapa: nombreEtapa ?? this.nombreEtapa,
        procedimientoEtapa: procedimientoEtapa ?? this.procedimientoEtapa,
      );
  @override
  String toString() {
    return (StringBuffer('Etapa(')
          ..write('id: $id, ')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('nombreEtapa: $nombreEtapa, ')
          ..write('procedimientoEtapa: $procedimientoEtapa')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nombreEnfermedad, nombreEtapa, procedimientoEtapa);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Etapa &&
          other.id == this.id &&
          other.nombreEnfermedad == this.nombreEnfermedad &&
          other.nombreEtapa == this.nombreEtapa &&
          other.procedimientoEtapa == this.procedimientoEtapa);
}

class EtapasCompanion extends UpdateCompanion<Etapa> {
  final Value<int> id;
  final Value<String> nombreEnfermedad;
  final Value<String> nombreEtapa;
  final Value<String> procedimientoEtapa;
  const EtapasCompanion({
    this.id = const Value.absent(),
    this.nombreEnfermedad = const Value.absent(),
    this.nombreEtapa = const Value.absent(),
    this.procedimientoEtapa = const Value.absent(),
  });
  EtapasCompanion.insert({
    this.id = const Value.absent(),
    required String nombreEnfermedad,
    required String nombreEtapa,
    required String procedimientoEtapa,
  })  : nombreEnfermedad = Value(nombreEnfermedad),
        nombreEtapa = Value(nombreEtapa),
        procedimientoEtapa = Value(procedimientoEtapa);
  static Insertable<Etapa> custom({
    Expression<int>? id,
    Expression<String>? nombreEnfermedad,
    Expression<String>? nombreEtapa,
    Expression<String>? procedimientoEtapa,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombreEnfermedad != null) 'nombre_enfermedad': nombreEnfermedad,
      if (nombreEtapa != null) 'nombre_etapa': nombreEtapa,
      if (procedimientoEtapa != null) 'procedimiento_etapa': procedimientoEtapa,
    });
  }

  EtapasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nombreEnfermedad,
      Value<String>? nombreEtapa,
      Value<String>? procedimientoEtapa}) {
    return EtapasCompanion(
      id: id ?? this.id,
      nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
      nombreEtapa: nombreEtapa ?? this.nombreEtapa,
      procedimientoEtapa: procedimientoEtapa ?? this.procedimientoEtapa,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombreEnfermedad.present) {
      map['nombre_enfermedad'] = Variable<String>(nombreEnfermedad.value);
    }
    if (nombreEtapa.present) {
      map['nombre_etapa'] = Variable<String>(nombreEtapa.value);
    }
    if (procedimientoEtapa.present) {
      map['procedimiento_etapa'] = Variable<String>(procedimientoEtapa.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EtapasCompanion(')
          ..write('id: $id, ')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('nombreEtapa: $nombreEtapa, ')
          ..write('procedimientoEtapa: $procedimientoEtapa')
          ..write(')'))
        .toString();
  }
}

class $EtapasPlagaTable extends EtapasPlaga
    with TableInfo<$EtapasPlagaTable, EtapasPlagaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EtapasPlagaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idEtapasPlagaMeta =
      const VerificationMeta('idEtapasPlaga');
  @override
  late final GeneratedColumn<int> idEtapasPlaga = GeneratedColumn<int>(
      'id_etapas_plaga', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nombrePlagaMeta =
      const VerificationMeta('nombrePlaga');
  @override
  late final GeneratedColumn<String> nombrePlaga = GeneratedColumn<String>(
      'nombre_plaga', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES plagas(nombre_comun_plaga)');
  static const VerificationMeta _nombreEtapaMeta =
      const VerificationMeta('nombreEtapa');
  @override
  late final GeneratedColumn<String> nombreEtapa = GeneratedColumn<String>(
      'nombre_etapa', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _procedimientoEtapaMeta =
      const VerificationMeta('procedimientoEtapa');
  @override
  late final GeneratedColumn<String> procedimientoEtapa =
      GeneratedColumn<String>('procedimiento_etapa', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idEtapasPlaga, nombrePlaga, nombreEtapa, procedimientoEtapa];
  @override
  String get aliasedName => _alias ?? 'etapas_plaga';
  @override
  String get actualTableName => 'etapas_plaga';
  @override
  VerificationContext validateIntegrity(Insertable<EtapasPlagaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_etapas_plaga')) {
      context.handle(
          _idEtapasPlagaMeta,
          idEtapasPlaga.isAcceptableOrUnknown(
              data['id_etapas_plaga']!, _idEtapasPlagaMeta));
    }
    if (data.containsKey('nombre_plaga')) {
      context.handle(
          _nombrePlagaMeta,
          nombrePlaga.isAcceptableOrUnknown(
              data['nombre_plaga']!, _nombrePlagaMeta));
    } else if (isInserting) {
      context.missing(_nombrePlagaMeta);
    }
    if (data.containsKey('nombre_etapa')) {
      context.handle(
          _nombreEtapaMeta,
          nombreEtapa.isAcceptableOrUnknown(
              data['nombre_etapa']!, _nombreEtapaMeta));
    } else if (isInserting) {
      context.missing(_nombreEtapaMeta);
    }
    if (data.containsKey('procedimiento_etapa')) {
      context.handle(
          _procedimientoEtapaMeta,
          procedimientoEtapa.isAcceptableOrUnknown(
              data['procedimiento_etapa']!, _procedimientoEtapaMeta));
    } else if (isInserting) {
      context.missing(_procedimientoEtapaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idEtapasPlaga};
  @override
  EtapasPlagaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EtapasPlagaData(
      idEtapasPlaga: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_etapas_plaga'])!,
      nombrePlaga: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_plaga'])!,
      nombreEtapa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_etapa'])!,
      procedimientoEtapa: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}procedimiento_etapa'])!,
    );
  }

  @override
  $EtapasPlagaTable createAlias(String alias) {
    return $EtapasPlagaTable(attachedDatabase, alias);
  }
}

class EtapasPlagaData extends DataClass implements Insertable<EtapasPlagaData> {
  final int idEtapasPlaga;
  final String nombrePlaga;
  final String nombreEtapa;
  final String procedimientoEtapa;
  const EtapasPlagaData(
      {required this.idEtapasPlaga,
      required this.nombrePlaga,
      required this.nombreEtapa,
      required this.procedimientoEtapa});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_etapas_plaga'] = Variable<int>(idEtapasPlaga);
    map['nombre_plaga'] = Variable<String>(nombrePlaga);
    map['nombre_etapa'] = Variable<String>(nombreEtapa);
    map['procedimiento_etapa'] = Variable<String>(procedimientoEtapa);
    return map;
  }

  EtapasPlagaCompanion toCompanion(bool nullToAbsent) {
    return EtapasPlagaCompanion(
      idEtapasPlaga: Value(idEtapasPlaga),
      nombrePlaga: Value(nombrePlaga),
      nombreEtapa: Value(nombreEtapa),
      procedimientoEtapa: Value(procedimientoEtapa),
    );
  }

  factory EtapasPlagaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EtapasPlagaData(
      idEtapasPlaga: serializer.fromJson<int>(json['idEtapasPlaga']),
      nombrePlaga: serializer.fromJson<String>(json['nombrePlaga']),
      nombreEtapa: serializer.fromJson<String>(json['nombreEtapa']),
      procedimientoEtapa:
          serializer.fromJson<String>(json['procedimientoEtapa']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idEtapasPlaga': serializer.toJson<int>(idEtapasPlaga),
      'nombrePlaga': serializer.toJson<String>(nombrePlaga),
      'nombreEtapa': serializer.toJson<String>(nombreEtapa),
      'procedimientoEtapa': serializer.toJson<String>(procedimientoEtapa),
    };
  }

  EtapasPlagaData copyWith(
          {int? idEtapasPlaga,
          String? nombrePlaga,
          String? nombreEtapa,
          String? procedimientoEtapa}) =>
      EtapasPlagaData(
        idEtapasPlaga: idEtapasPlaga ?? this.idEtapasPlaga,
        nombrePlaga: nombrePlaga ?? this.nombrePlaga,
        nombreEtapa: nombreEtapa ?? this.nombreEtapa,
        procedimientoEtapa: procedimientoEtapa ?? this.procedimientoEtapa,
      );
  @override
  String toString() {
    return (StringBuffer('EtapasPlagaData(')
          ..write('idEtapasPlaga: $idEtapasPlaga, ')
          ..write('nombrePlaga: $nombrePlaga, ')
          ..write('nombreEtapa: $nombreEtapa, ')
          ..write('procedimientoEtapa: $procedimientoEtapa')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idEtapasPlaga, nombrePlaga, nombreEtapa, procedimientoEtapa);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EtapasPlagaData &&
          other.idEtapasPlaga == this.idEtapasPlaga &&
          other.nombrePlaga == this.nombrePlaga &&
          other.nombreEtapa == this.nombreEtapa &&
          other.procedimientoEtapa == this.procedimientoEtapa);
}

class EtapasPlagaCompanion extends UpdateCompanion<EtapasPlagaData> {
  final Value<int> idEtapasPlaga;
  final Value<String> nombrePlaga;
  final Value<String> nombreEtapa;
  final Value<String> procedimientoEtapa;
  const EtapasPlagaCompanion({
    this.idEtapasPlaga = const Value.absent(),
    this.nombrePlaga = const Value.absent(),
    this.nombreEtapa = const Value.absent(),
    this.procedimientoEtapa = const Value.absent(),
  });
  EtapasPlagaCompanion.insert({
    this.idEtapasPlaga = const Value.absent(),
    required String nombrePlaga,
    required String nombreEtapa,
    required String procedimientoEtapa,
  })  : nombrePlaga = Value(nombrePlaga),
        nombreEtapa = Value(nombreEtapa),
        procedimientoEtapa = Value(procedimientoEtapa);
  static Insertable<EtapasPlagaData> custom({
    Expression<int>? idEtapasPlaga,
    Expression<String>? nombrePlaga,
    Expression<String>? nombreEtapa,
    Expression<String>? procedimientoEtapa,
  }) {
    return RawValuesInsertable({
      if (idEtapasPlaga != null) 'id_etapas_plaga': idEtapasPlaga,
      if (nombrePlaga != null) 'nombre_plaga': nombrePlaga,
      if (nombreEtapa != null) 'nombre_etapa': nombreEtapa,
      if (procedimientoEtapa != null) 'procedimiento_etapa': procedimientoEtapa,
    });
  }

  EtapasPlagaCompanion copyWith(
      {Value<int>? idEtapasPlaga,
      Value<String>? nombrePlaga,
      Value<String>? nombreEtapa,
      Value<String>? procedimientoEtapa}) {
    return EtapasPlagaCompanion(
      idEtapasPlaga: idEtapasPlaga ?? this.idEtapasPlaga,
      nombrePlaga: nombrePlaga ?? this.nombrePlaga,
      nombreEtapa: nombreEtapa ?? this.nombreEtapa,
      procedimientoEtapa: procedimientoEtapa ?? this.procedimientoEtapa,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idEtapasPlaga.present) {
      map['id_etapas_plaga'] = Variable<int>(idEtapasPlaga.value);
    }
    if (nombrePlaga.present) {
      map['nombre_plaga'] = Variable<String>(nombrePlaga.value);
    }
    if (nombreEtapa.present) {
      map['nombre_etapa'] = Variable<String>(nombreEtapa.value);
    }
    if (procedimientoEtapa.present) {
      map['procedimiento_etapa'] = Variable<String>(procedimientoEtapa.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EtapasPlagaCompanion(')
          ..write('idEtapasPlaga: $idEtapasPlaga, ')
          ..write('nombrePlaga: $nombrePlaga, ')
          ..write('nombreEtapa: $nombreEtapa, ')
          ..write('procedimientoEtapa: $procedimientoEtapa')
          ..write(')'))
        .toString();
  }
}

class $ErradicacionTable extends Erradicacion
    with TableInfo<$ErradicacionTable, ErradicacionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ErradicacionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _causaErradicacionMeta =
      const VerificationMeta('causaErradicacion');
  @override
  late final GeneratedColumn<String> causaErradicacion =
      GeneratedColumn<String>('causa_erradicacion', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _idPalmaMeta =
      const VerificationMeta('idPalma');
  @override
  late final GeneratedColumn<String> idPalma = GeneratedColumn<String>(
      'id_palma', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _observacionesMeta =
      const VerificationMeta('observaciones');
  @override
  late final GeneratedColumn<String> observaciones = GeneratedColumn<String>(
      'observaciones', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fechaRegistroMeta =
      const VerificationMeta('fechaRegistro');
  @override
  late final GeneratedColumn<DateTime> fechaRegistro =
      GeneratedColumn<DateTime>('fecha_registro', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        causaErradicacion,
        idPalma,
        observaciones,
        fechaRegistro,
        responsable,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'erradicacion';
  @override
  String get actualTableName => 'erradicacion';
  @override
  VerificationContext validateIntegrity(Insertable<ErradicacionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('causa_erradicacion')) {
      context.handle(
          _causaErradicacionMeta,
          causaErradicacion.isAcceptableOrUnknown(
              data['causa_erradicacion']!, _causaErradicacionMeta));
    }
    if (data.containsKey('id_palma')) {
      context.handle(_idPalmaMeta,
          idPalma.isAcceptableOrUnknown(data['id_palma']!, _idPalmaMeta));
    } else if (isInserting) {
      context.missing(_idPalmaMeta);
    }
    if (data.containsKey('observaciones')) {
      context.handle(
          _observacionesMeta,
          observaciones.isAcceptableOrUnknown(
              data['observaciones']!, _observacionesMeta));
    }
    if (data.containsKey('fecha_registro')) {
      context.handle(
          _fechaRegistroMeta,
          fechaRegistro.isAcceptableOrUnknown(
              data['fecha_registro']!, _fechaRegistroMeta));
    } else if (isInserting) {
      context.missing(_fechaRegistroMeta);
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ErradicacionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ErradicacionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      causaErradicacion: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}causa_erradicacion']),
      idPalma: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_palma'])!,
      observaciones: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}observaciones']),
      fechaRegistro: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_registro'])!,
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $ErradicacionTable createAlias(String alias) {
    return $ErradicacionTable(attachedDatabase, alias);
  }
}

class ErradicacionData extends DataClass
    implements Insertable<ErradicacionData> {
  final int id;
  final String? causaErradicacion;
  final String idPalma;
  final String? observaciones;
  final DateTime fechaRegistro;
  final String responsable;
  final bool sincronizado;
  const ErradicacionData(
      {required this.id,
      this.causaErradicacion,
      required this.idPalma,
      this.observaciones,
      required this.fechaRegistro,
      required this.responsable,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || causaErradicacion != null) {
      map['causa_erradicacion'] = Variable<String>(causaErradicacion);
    }
    map['id_palma'] = Variable<String>(idPalma);
    if (!nullToAbsent || observaciones != null) {
      map['observaciones'] = Variable<String>(observaciones);
    }
    map['fecha_registro'] = Variable<DateTime>(fechaRegistro);
    map['responsable'] = Variable<String>(responsable);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  ErradicacionCompanion toCompanion(bool nullToAbsent) {
    return ErradicacionCompanion(
      id: Value(id),
      causaErradicacion: causaErradicacion == null && nullToAbsent
          ? const Value.absent()
          : Value(causaErradicacion),
      idPalma: Value(idPalma),
      observaciones: observaciones == null && nullToAbsent
          ? const Value.absent()
          : Value(observaciones),
      fechaRegistro: Value(fechaRegistro),
      responsable: Value(responsable),
      sincronizado: Value(sincronizado),
    );
  }

  factory ErradicacionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ErradicacionData(
      id: serializer.fromJson<int>(json['id']),
      causaErradicacion:
          serializer.fromJson<String?>(json['causaErradicacion']),
      idPalma: serializer.fromJson<String>(json['idPalma']),
      observaciones: serializer.fromJson<String?>(json['observaciones']),
      fechaRegistro: serializer.fromJson<DateTime>(json['fechaRegistro']),
      responsable: serializer.fromJson<String>(json['responsable']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'causaErradicacion': serializer.toJson<String?>(causaErradicacion),
      'idPalma': serializer.toJson<String>(idPalma),
      'observaciones': serializer.toJson<String?>(observaciones),
      'fechaRegistro': serializer.toJson<DateTime>(fechaRegistro),
      'responsable': serializer.toJson<String>(responsable),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  ErradicacionData copyWith(
          {int? id,
          Value<String?> causaErradicacion = const Value.absent(),
          String? idPalma,
          Value<String?> observaciones = const Value.absent(),
          DateTime? fechaRegistro,
          String? responsable,
          bool? sincronizado}) =>
      ErradicacionData(
        id: id ?? this.id,
        causaErradicacion: causaErradicacion.present
            ? causaErradicacion.value
            : this.causaErradicacion,
        idPalma: idPalma ?? this.idPalma,
        observaciones:
            observaciones.present ? observaciones.value : this.observaciones,
        fechaRegistro: fechaRegistro ?? this.fechaRegistro,
        responsable: responsable ?? this.responsable,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('ErradicacionData(')
          ..write('id: $id, ')
          ..write('causaErradicacion: $causaErradicacion, ')
          ..write('idPalma: $idPalma, ')
          ..write('observaciones: $observaciones, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, causaErradicacion, idPalma, observaciones,
      fechaRegistro, responsable, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ErradicacionData &&
          other.id == this.id &&
          other.causaErradicacion == this.causaErradicacion &&
          other.idPalma == this.idPalma &&
          other.observaciones == this.observaciones &&
          other.fechaRegistro == this.fechaRegistro &&
          other.responsable == this.responsable &&
          other.sincronizado == this.sincronizado);
}

class ErradicacionCompanion extends UpdateCompanion<ErradicacionData> {
  final Value<int> id;
  final Value<String?> causaErradicacion;
  final Value<String> idPalma;
  final Value<String?> observaciones;
  final Value<DateTime> fechaRegistro;
  final Value<String> responsable;
  final Value<bool> sincronizado;
  const ErradicacionCompanion({
    this.id = const Value.absent(),
    this.causaErradicacion = const Value.absent(),
    this.idPalma = const Value.absent(),
    this.observaciones = const Value.absent(),
    this.fechaRegistro = const Value.absent(),
    this.responsable = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  ErradicacionCompanion.insert({
    this.id = const Value.absent(),
    this.causaErradicacion = const Value.absent(),
    required String idPalma,
    this.observaciones = const Value.absent(),
    required DateTime fechaRegistro,
    required String responsable,
    this.sincronizado = const Value.absent(),
  })  : idPalma = Value(idPalma),
        fechaRegistro = Value(fechaRegistro),
        responsable = Value(responsable);
  static Insertable<ErradicacionData> custom({
    Expression<int>? id,
    Expression<String>? causaErradicacion,
    Expression<String>? idPalma,
    Expression<String>? observaciones,
    Expression<DateTime>? fechaRegistro,
    Expression<String>? responsable,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (causaErradicacion != null) 'causa_erradicacion': causaErradicacion,
      if (idPalma != null) 'id_palma': idPalma,
      if (observaciones != null) 'observaciones': observaciones,
      if (fechaRegistro != null) 'fecha_registro': fechaRegistro,
      if (responsable != null) 'responsable': responsable,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  ErradicacionCompanion copyWith(
      {Value<int>? id,
      Value<String?>? causaErradicacion,
      Value<String>? idPalma,
      Value<String?>? observaciones,
      Value<DateTime>? fechaRegistro,
      Value<String>? responsable,
      Value<bool>? sincronizado}) {
    return ErradicacionCompanion(
      id: id ?? this.id,
      causaErradicacion: causaErradicacion ?? this.causaErradicacion,
      idPalma: idPalma ?? this.idPalma,
      observaciones: observaciones ?? this.observaciones,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
      responsable: responsable ?? this.responsable,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (causaErradicacion.present) {
      map['causa_erradicacion'] = Variable<String>(causaErradicacion.value);
    }
    if (idPalma.present) {
      map['id_palma'] = Variable<String>(idPalma.value);
    }
    if (observaciones.present) {
      map['observaciones'] = Variable<String>(observaciones.value);
    }
    if (fechaRegistro.present) {
      map['fecha_registro'] = Variable<DateTime>(fechaRegistro.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ErradicacionCompanion(')
          ..write('id: $id, ')
          ..write('causaErradicacion: $causaErradicacion, ')
          ..write('idPalma: $idPalma, ')
          ..write('observaciones: $observaciones, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $LotesTable extends Lotes with TableInfo<$LotesTable, Lote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nombreLoteMeta =
      const VerificationMeta('nombreLote');
  @override
  late final GeneratedColumn<String> nombreLote = GeneratedColumn<String>(
      'nombre_lote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hectareasMeta =
      const VerificationMeta('hectareas');
  @override
  late final GeneratedColumn<int> hectareas = GeneratedColumn<int>(
      'hectareas', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numeropalmasMeta =
      const VerificationMeta('numeropalmas');
  @override
  late final GeneratedColumn<int> numeropalmas = GeneratedColumn<int>(
      'numeropalmas', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fechaUltimaActualizacionMeta =
      const VerificationMeta('fechaUltimaActualizacion');
  @override
  late final GeneratedColumn<DateTime> fechaUltimaActualizacion =
      GeneratedColumn<DateTime>('fecha_ultima_actualizacion', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nombreLote, hectareas, numeropalmas, fechaUltimaActualizacion];
  @override
  String get aliasedName => _alias ?? 'lotes';
  @override
  String get actualTableName => 'lotes';
  @override
  VerificationContext validateIntegrity(Insertable<Lote> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre_lote')) {
      context.handle(
          _nombreLoteMeta,
          nombreLote.isAcceptableOrUnknown(
              data['nombre_lote']!, _nombreLoteMeta));
    } else if (isInserting) {
      context.missing(_nombreLoteMeta);
    }
    if (data.containsKey('hectareas')) {
      context.handle(_hectareasMeta,
          hectareas.isAcceptableOrUnknown(data['hectareas']!, _hectareasMeta));
    } else if (isInserting) {
      context.missing(_hectareasMeta);
    }
    if (data.containsKey('numeropalmas')) {
      context.handle(
          _numeropalmasMeta,
          numeropalmas.isAcceptableOrUnknown(
              data['numeropalmas']!, _numeropalmasMeta));
    } else if (isInserting) {
      context.missing(_numeropalmasMeta);
    }
    if (data.containsKey('fecha_ultima_actualizacion')) {
      context.handle(
          _fechaUltimaActualizacionMeta,
          fechaUltimaActualizacion.isAcceptableOrUnknown(
              data['fecha_ultima_actualizacion']!,
              _fechaUltimaActualizacionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lote(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nombreLote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_lote'])!,
      hectareas: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hectareas'])!,
      numeropalmas: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}numeropalmas'])!,
      fechaUltimaActualizacion: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}fecha_ultima_actualizacion']),
    );
  }

  @override
  $LotesTable createAlias(String alias) {
    return $LotesTable(attachedDatabase, alias);
  }
}

class Lote extends DataClass implements Insertable<Lote> {
  final int id;
  final String nombreLote;
  final int hectareas;
  final int numeropalmas;
  final DateTime? fechaUltimaActualizacion;
  const Lote(
      {required this.id,
      required this.nombreLote,
      required this.hectareas,
      required this.numeropalmas,
      this.fechaUltimaActualizacion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['hectareas'] = Variable<int>(hectareas);
    map['numeropalmas'] = Variable<int>(numeropalmas);
    if (!nullToAbsent || fechaUltimaActualizacion != null) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion);
    }
    return map;
  }

  LotesCompanion toCompanion(bool nullToAbsent) {
    return LotesCompanion(
      id: Value(id),
      nombreLote: Value(nombreLote),
      hectareas: Value(hectareas),
      numeropalmas: Value(numeropalmas),
      fechaUltimaActualizacion: fechaUltimaActualizacion == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaUltimaActualizacion),
    );
  }

  factory Lote.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lote(
      id: serializer.fromJson<int>(json['id']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      hectareas: serializer.fromJson<int>(json['hectareas']),
      numeropalmas: serializer.fromJson<int>(json['numeropalmas']),
      fechaUltimaActualizacion:
          serializer.fromJson<DateTime?>(json['fechaUltimaActualizacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'hectareas': serializer.toJson<int>(hectareas),
      'numeropalmas': serializer.toJson<int>(numeropalmas),
      'fechaUltimaActualizacion':
          serializer.toJson<DateTime?>(fechaUltimaActualizacion),
    };
  }

  Lote copyWith(
          {int? id,
          String? nombreLote,
          int? hectareas,
          int? numeropalmas,
          Value<DateTime?> fechaUltimaActualizacion = const Value.absent()}) =>
      Lote(
        id: id ?? this.id,
        nombreLote: nombreLote ?? this.nombreLote,
        hectareas: hectareas ?? this.hectareas,
        numeropalmas: numeropalmas ?? this.numeropalmas,
        fechaUltimaActualizacion: fechaUltimaActualizacion.present
            ? fechaUltimaActualizacion.value
            : this.fechaUltimaActualizacion,
      );
  @override
  String toString() {
    return (StringBuffer('Lote(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('hectareas: $hectareas, ')
          ..write('numeropalmas: $numeropalmas, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, nombreLote, hectareas, numeropalmas, fechaUltimaActualizacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lote &&
          other.id == this.id &&
          other.nombreLote == this.nombreLote &&
          other.hectareas == this.hectareas &&
          other.numeropalmas == this.numeropalmas &&
          other.fechaUltimaActualizacion == this.fechaUltimaActualizacion);
}

class LotesCompanion extends UpdateCompanion<Lote> {
  final Value<int> id;
  final Value<String> nombreLote;
  final Value<int> hectareas;
  final Value<int> numeropalmas;
  final Value<DateTime?> fechaUltimaActualizacion;
  const LotesCompanion({
    this.id = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.hectareas = const Value.absent(),
    this.numeropalmas = const Value.absent(),
    this.fechaUltimaActualizacion = const Value.absent(),
  });
  LotesCompanion.insert({
    this.id = const Value.absent(),
    required String nombreLote,
    required int hectareas,
    required int numeropalmas,
    this.fechaUltimaActualizacion = const Value.absent(),
  })  : nombreLote = Value(nombreLote),
        hectareas = Value(hectareas),
        numeropalmas = Value(numeropalmas);
  static Insertable<Lote> custom({
    Expression<int>? id,
    Expression<String>? nombreLote,
    Expression<int>? hectareas,
    Expression<int>? numeropalmas,
    Expression<DateTime>? fechaUltimaActualizacion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (hectareas != null) 'hectareas': hectareas,
      if (numeropalmas != null) 'numeropalmas': numeropalmas,
      if (fechaUltimaActualizacion != null)
        'fecha_ultima_actualizacion': fechaUltimaActualizacion,
    });
  }

  LotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? nombreLote,
      Value<int>? hectareas,
      Value<int>? numeropalmas,
      Value<DateTime?>? fechaUltimaActualizacion}) {
    return LotesCompanion(
      id: id ?? this.id,
      nombreLote: nombreLote ?? this.nombreLote,
      hectareas: hectareas ?? this.hectareas,
      numeropalmas: numeropalmas ?? this.numeropalmas,
      fechaUltimaActualizacion:
          fechaUltimaActualizacion ?? this.fechaUltimaActualizacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombreLote.present) {
      map['nombre_lote'] = Variable<String>(nombreLote.value);
    }
    if (hectareas.present) {
      map['hectareas'] = Variable<int>(hectareas.value);
    }
    if (numeropalmas.present) {
      map['numeropalmas'] = Variable<int>(numeropalmas.value);
    }
    if (fechaUltimaActualizacion.present) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LotesCompanion(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('hectareas: $hectareas, ')
          ..write('numeropalmas: $numeropalmas, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }
}

class $PalmasTable extends Palmas with TableInfo<$PalmasTable, Palma> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PalmasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nombreLoteMeta =
      const VerificationMeta('nombreLote');
  @override
  late final GeneratedColumn<String> nombreLote = GeneratedColumn<String>(
      'nombre_lote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numerolineaMeta =
      const VerificationMeta('numerolinea');
  @override
  late final GeneratedColumn<int> numerolinea = GeneratedColumn<int>(
      'numerolinea', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numeroenlineaMeta =
      const VerificationMeta('numeroenlinea');
  @override
  late final GeneratedColumn<int> numeroenlinea = GeneratedColumn<int>(
      'numeroenlinea', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _estadopalmaMeta =
      const VerificationMeta('estadopalma');
  @override
  late final GeneratedColumn<String> estadopalma = GeneratedColumn<String>(
      'estadopalma', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _identificadorMeta =
      const VerificationMeta('identificador');
  @override
  late final GeneratedColumn<String> identificador = GeneratedColumn<String>(
      'identificador', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orientacionMeta =
      const VerificationMeta('orientacion');
  @override
  late final GeneratedColumn<String> orientacion = GeneratedColumn<String>(
      'orientacion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        nombreLote,
        numerolinea,
        numeroenlinea,
        estadopalma,
        identificador,
        orientacion,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'palmas';
  @override
  String get actualTableName => 'palmas';
  @override
  VerificationContext validateIntegrity(Insertable<Palma> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nombre_lote')) {
      context.handle(
          _nombreLoteMeta,
          nombreLote.isAcceptableOrUnknown(
              data['nombre_lote']!, _nombreLoteMeta));
    } else if (isInserting) {
      context.missing(_nombreLoteMeta);
    }
    if (data.containsKey('numerolinea')) {
      context.handle(
          _numerolineaMeta,
          numerolinea.isAcceptableOrUnknown(
              data['numerolinea']!, _numerolineaMeta));
    } else if (isInserting) {
      context.missing(_numerolineaMeta);
    }
    if (data.containsKey('numeroenlinea')) {
      context.handle(
          _numeroenlineaMeta,
          numeroenlinea.isAcceptableOrUnknown(
              data['numeroenlinea']!, _numeroenlineaMeta));
    } else if (isInserting) {
      context.missing(_numeroenlineaMeta);
    }
    if (data.containsKey('estadopalma')) {
      context.handle(
          _estadopalmaMeta,
          estadopalma.isAcceptableOrUnknown(
              data['estadopalma']!, _estadopalmaMeta));
    } else if (isInserting) {
      context.missing(_estadopalmaMeta);
    }
    if (data.containsKey('identificador')) {
      context.handle(
          _identificadorMeta,
          identificador.isAcceptableOrUnknown(
              data['identificador']!, _identificadorMeta));
    } else if (isInserting) {
      context.missing(_identificadorMeta);
    }
    if (data.containsKey('orientacion')) {
      context.handle(
          _orientacionMeta,
          orientacion.isAcceptableOrUnknown(
              data['orientacion']!, _orientacionMeta));
    } else if (isInserting) {
      context.missing(_orientacionMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {identificador};
  @override
  Palma map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Palma(
      nombreLote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_lote'])!,
      numerolinea: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}numerolinea'])!,
      numeroenlinea: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}numeroenlinea'])!,
      estadopalma: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}estadopalma'])!,
      identificador: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identificador'])!,
      orientacion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}orientacion'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $PalmasTable createAlias(String alias) {
    return $PalmasTable(attachedDatabase, alias);
  }
}

class Palma extends DataClass implements Insertable<Palma> {
  final String nombreLote;
  final int numerolinea;
  final int numeroenlinea;
  final String estadopalma;
  final String identificador;
  final String orientacion;
  final bool sincronizado;
  const Palma(
      {required this.nombreLote,
      required this.numerolinea,
      required this.numeroenlinea,
      required this.estadopalma,
      required this.identificador,
      required this.orientacion,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['numerolinea'] = Variable<int>(numerolinea);
    map['numeroenlinea'] = Variable<int>(numeroenlinea);
    map['estadopalma'] = Variable<String>(estadopalma);
    map['identificador'] = Variable<String>(identificador);
    map['orientacion'] = Variable<String>(orientacion);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  PalmasCompanion toCompanion(bool nullToAbsent) {
    return PalmasCompanion(
      nombreLote: Value(nombreLote),
      numerolinea: Value(numerolinea),
      numeroenlinea: Value(numeroenlinea),
      estadopalma: Value(estadopalma),
      identificador: Value(identificador),
      orientacion: Value(orientacion),
      sincronizado: Value(sincronizado),
    );
  }

  factory Palma.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Palma(
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      numerolinea: serializer.fromJson<int>(json['numerolinea']),
      numeroenlinea: serializer.fromJson<int>(json['numeroenlinea']),
      estadopalma: serializer.fromJson<String>(json['estadopalma']),
      identificador: serializer.fromJson<String>(json['identificador']),
      orientacion: serializer.fromJson<String>(json['orientacion']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nombreLote': serializer.toJson<String>(nombreLote),
      'numerolinea': serializer.toJson<int>(numerolinea),
      'numeroenlinea': serializer.toJson<int>(numeroenlinea),
      'estadopalma': serializer.toJson<String>(estadopalma),
      'identificador': serializer.toJson<String>(identificador),
      'orientacion': serializer.toJson<String>(orientacion),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  Palma copyWith(
          {String? nombreLote,
          int? numerolinea,
          int? numeroenlinea,
          String? estadopalma,
          String? identificador,
          String? orientacion,
          bool? sincronizado}) =>
      Palma(
        nombreLote: nombreLote ?? this.nombreLote,
        numerolinea: numerolinea ?? this.numerolinea,
        numeroenlinea: numeroenlinea ?? this.numeroenlinea,
        estadopalma: estadopalma ?? this.estadopalma,
        identificador: identificador ?? this.identificador,
        orientacion: orientacion ?? this.orientacion,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('Palma(')
          ..write('nombreLote: $nombreLote, ')
          ..write('numerolinea: $numerolinea, ')
          ..write('numeroenlinea: $numeroenlinea, ')
          ..write('estadopalma: $estadopalma, ')
          ..write('identificador: $identificador, ')
          ..write('orientacion: $orientacion, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nombreLote, numerolinea, numeroenlinea,
      estadopalma, identificador, orientacion, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Palma &&
          other.nombreLote == this.nombreLote &&
          other.numerolinea == this.numerolinea &&
          other.numeroenlinea == this.numeroenlinea &&
          other.estadopalma == this.estadopalma &&
          other.identificador == this.identificador &&
          other.orientacion == this.orientacion &&
          other.sincronizado == this.sincronizado);
}

class PalmasCompanion extends UpdateCompanion<Palma> {
  final Value<String> nombreLote;
  final Value<int> numerolinea;
  final Value<int> numeroenlinea;
  final Value<String> estadopalma;
  final Value<String> identificador;
  final Value<String> orientacion;
  final Value<bool> sincronizado;
  const PalmasCompanion({
    this.nombreLote = const Value.absent(),
    this.numerolinea = const Value.absent(),
    this.numeroenlinea = const Value.absent(),
    this.estadopalma = const Value.absent(),
    this.identificador = const Value.absent(),
    this.orientacion = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  PalmasCompanion.insert({
    required String nombreLote,
    required int numerolinea,
    required int numeroenlinea,
    required String estadopalma,
    required String identificador,
    required String orientacion,
    this.sincronizado = const Value.absent(),
  })  : nombreLote = Value(nombreLote),
        numerolinea = Value(numerolinea),
        numeroenlinea = Value(numeroenlinea),
        estadopalma = Value(estadopalma),
        identificador = Value(identificador),
        orientacion = Value(orientacion);
  static Insertable<Palma> custom({
    Expression<String>? nombreLote,
    Expression<int>? numerolinea,
    Expression<int>? numeroenlinea,
    Expression<String>? estadopalma,
    Expression<String>? identificador,
    Expression<String>? orientacion,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (numerolinea != null) 'numerolinea': numerolinea,
      if (numeroenlinea != null) 'numeroenlinea': numeroenlinea,
      if (estadopalma != null) 'estadopalma': estadopalma,
      if (identificador != null) 'identificador': identificador,
      if (orientacion != null) 'orientacion': orientacion,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  PalmasCompanion copyWith(
      {Value<String>? nombreLote,
      Value<int>? numerolinea,
      Value<int>? numeroenlinea,
      Value<String>? estadopalma,
      Value<String>? identificador,
      Value<String>? orientacion,
      Value<bool>? sincronizado}) {
    return PalmasCompanion(
      nombreLote: nombreLote ?? this.nombreLote,
      numerolinea: numerolinea ?? this.numerolinea,
      numeroenlinea: numeroenlinea ?? this.numeroenlinea,
      estadopalma: estadopalma ?? this.estadopalma,
      identificador: identificador ?? this.identificador,
      orientacion: orientacion ?? this.orientacion,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nombreLote.present) {
      map['nombre_lote'] = Variable<String>(nombreLote.value);
    }
    if (numerolinea.present) {
      map['numerolinea'] = Variable<int>(numerolinea.value);
    }
    if (numeroenlinea.present) {
      map['numeroenlinea'] = Variable<int>(numeroenlinea.value);
    }
    if (estadopalma.present) {
      map['estadopalma'] = Variable<String>(estadopalma.value);
    }
    if (identificador.present) {
      map['identificador'] = Variable<String>(identificador.value);
    }
    if (orientacion.present) {
      map['orientacion'] = Variable<String>(orientacion.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PalmasCompanion(')
          ..write('nombreLote: $nombreLote, ')
          ..write('numerolinea: $numerolinea, ')
          ..write('numeroenlinea: $numeroenlinea, ')
          ..write('estadopalma: $estadopalma, ')
          ..write('identificador: $identificador, ')
          ..write('orientacion: $orientacion, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $PlagasTable extends Plagas with TableInfo<$PlagasTable, Plaga> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlagasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nombreComunPlagaMeta =
      const VerificationMeta('nombreComunPlaga');
  @override
  late final GeneratedColumn<String> nombreComunPlaga = GeneratedColumn<String>(
      'nombre_comun_plaga', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaUltimaActualizacionMeta =
      const VerificationMeta('fechaUltimaActualizacion');
  @override
  late final GeneratedColumn<DateTime> fechaUltimaActualizacion =
      GeneratedColumn<DateTime>('fecha_ultima_actualizacion', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [nombreComunPlaga, fechaUltimaActualizacion];
  @override
  String get aliasedName => _alias ?? 'plagas';
  @override
  String get actualTableName => 'plagas';
  @override
  VerificationContext validateIntegrity(Insertable<Plaga> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nombre_comun_plaga')) {
      context.handle(
          _nombreComunPlagaMeta,
          nombreComunPlaga.isAcceptableOrUnknown(
              data['nombre_comun_plaga']!, _nombreComunPlagaMeta));
    } else if (isInserting) {
      context.missing(_nombreComunPlagaMeta);
    }
    if (data.containsKey('fecha_ultima_actualizacion')) {
      context.handle(
          _fechaUltimaActualizacionMeta,
          fechaUltimaActualizacion.isAcceptableOrUnknown(
              data['fecha_ultima_actualizacion']!,
              _fechaUltimaActualizacionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {nombreComunPlaga};
  @override
  Plaga map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plaga(
      nombreComunPlaga: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nombre_comun_plaga'])!,
      fechaUltimaActualizacion: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}fecha_ultima_actualizacion']),
    );
  }

  @override
  $PlagasTable createAlias(String alias) {
    return $PlagasTable(attachedDatabase, alias);
  }
}

class Plaga extends DataClass implements Insertable<Plaga> {
  final String nombreComunPlaga;
  final DateTime? fechaUltimaActualizacion;
  const Plaga({required this.nombreComunPlaga, this.fechaUltimaActualizacion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nombre_comun_plaga'] = Variable<String>(nombreComunPlaga);
    if (!nullToAbsent || fechaUltimaActualizacion != null) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion);
    }
    return map;
  }

  PlagasCompanion toCompanion(bool nullToAbsent) {
    return PlagasCompanion(
      nombreComunPlaga: Value(nombreComunPlaga),
      fechaUltimaActualizacion: fechaUltimaActualizacion == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaUltimaActualizacion),
    );
  }

  factory Plaga.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plaga(
      nombreComunPlaga: serializer.fromJson<String>(json['nombreComunPlaga']),
      fechaUltimaActualizacion:
          serializer.fromJson<DateTime?>(json['fechaUltimaActualizacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nombreComunPlaga': serializer.toJson<String>(nombreComunPlaga),
      'fechaUltimaActualizacion':
          serializer.toJson<DateTime?>(fechaUltimaActualizacion),
    };
  }

  Plaga copyWith(
          {String? nombreComunPlaga,
          Value<DateTime?> fechaUltimaActualizacion = const Value.absent()}) =>
      Plaga(
        nombreComunPlaga: nombreComunPlaga ?? this.nombreComunPlaga,
        fechaUltimaActualizacion: fechaUltimaActualizacion.present
            ? fechaUltimaActualizacion.value
            : this.fechaUltimaActualizacion,
      );
  @override
  String toString() {
    return (StringBuffer('Plaga(')
          ..write('nombreComunPlaga: $nombreComunPlaga, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nombreComunPlaga, fechaUltimaActualizacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plaga &&
          other.nombreComunPlaga == this.nombreComunPlaga &&
          other.fechaUltimaActualizacion == this.fechaUltimaActualizacion);
}

class PlagasCompanion extends UpdateCompanion<Plaga> {
  final Value<String> nombreComunPlaga;
  final Value<DateTime?> fechaUltimaActualizacion;
  const PlagasCompanion({
    this.nombreComunPlaga = const Value.absent(),
    this.fechaUltimaActualizacion = const Value.absent(),
  });
  PlagasCompanion.insert({
    required String nombreComunPlaga,
    this.fechaUltimaActualizacion = const Value.absent(),
  }) : nombreComunPlaga = Value(nombreComunPlaga);
  static Insertable<Plaga> custom({
    Expression<String>? nombreComunPlaga,
    Expression<DateTime>? fechaUltimaActualizacion,
  }) {
    return RawValuesInsertable({
      if (nombreComunPlaga != null) 'nombre_comun_plaga': nombreComunPlaga,
      if (fechaUltimaActualizacion != null)
        'fecha_ultima_actualizacion': fechaUltimaActualizacion,
    });
  }

  PlagasCompanion copyWith(
      {Value<String>? nombreComunPlaga,
      Value<DateTime?>? fechaUltimaActualizacion}) {
    return PlagasCompanion(
      nombreComunPlaga: nombreComunPlaga ?? this.nombreComunPlaga,
      fechaUltimaActualizacion:
          fechaUltimaActualizacion ?? this.fechaUltimaActualizacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nombreComunPlaga.present) {
      map['nombre_comun_plaga'] = Variable<String>(nombreComunPlaga.value);
    }
    if (fechaUltimaActualizacion.present) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlagasCompanion(')
          ..write('nombreComunPlaga: $nombreComunPlaga, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }
}

class $PlateosTable extends Plateos with TableInfo<$PlateosTable, Plateo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlateosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idPlateoMeta =
      const VerificationMeta('idPlateo');
  @override
  late final GeneratedColumn<int> idPlateo = GeneratedColumn<int>(
      'id_plateo', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreLoteMeta =
      const VerificationMeta('nombreLote');
  @override
  late final GeneratedColumn<String> nombreLote = GeneratedColumn<String>(
      'nombre_lote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  @override
  late final GeneratedColumn<DateTime> fechaIngreso = GeneratedColumn<DateTime>(
      'fecha_ingreso', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fechaSalidaMeta =
      const VerificationMeta('fechaSalida');
  @override
  late final GeneratedColumn<DateTime> fechaSalida = GeneratedColumn<DateTime>(
      'fecha_salida', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cantidadPlateadaMeta =
      const VerificationMeta('cantidadPlateada');
  @override
  late final GeneratedColumn<int> cantidadPlateada = GeneratedColumn<int>(
      'cantidad_plateada', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _completadoMeta =
      const VerificationMeta('completado');
  @override
  late final GeneratedColumn<bool> completado =
      GeneratedColumn<bool>('completado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("completado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idPlateo,
        nombreLote,
        fechaIngreso,
        fechaSalida,
        cantidadPlateada,
        completado,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'plateos';
  @override
  String get actualTableName => 'plateos';
  @override
  VerificationContext validateIntegrity(Insertable<Plateo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_plateo')) {
      context.handle(_idPlateoMeta,
          idPlateo.isAcceptableOrUnknown(data['id_plateo']!, _idPlateoMeta));
    }
    if (data.containsKey('nombre_lote')) {
      context.handle(
          _nombreLoteMeta,
          nombreLote.isAcceptableOrUnknown(
              data['nombre_lote']!, _nombreLoteMeta));
    } else if (isInserting) {
      context.missing(_nombreLoteMeta);
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
          _fechaIngresoMeta,
          fechaIngreso.isAcceptableOrUnknown(
              data['fecha_ingreso']!, _fechaIngresoMeta));
    } else if (isInserting) {
      context.missing(_fechaIngresoMeta);
    }
    if (data.containsKey('fecha_salida')) {
      context.handle(
          _fechaSalidaMeta,
          fechaSalida.isAcceptableOrUnknown(
              data['fecha_salida']!, _fechaSalidaMeta));
    }
    if (data.containsKey('cantidad_plateada')) {
      context.handle(
          _cantidadPlateadaMeta,
          cantidadPlateada.isAcceptableOrUnknown(
              data['cantidad_plateada']!, _cantidadPlateadaMeta));
    } else if (isInserting) {
      context.missing(_cantidadPlateadaMeta);
    }
    if (data.containsKey('completado')) {
      context.handle(
          _completadoMeta,
          completado.isAcceptableOrUnknown(
              data['completado']!, _completadoMeta));
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plateo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plateo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idPlateo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_plateo']),
      nombreLote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_lote'])!,
      fechaIngreso: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_ingreso'])!,
      fechaSalida: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_salida']),
      cantidadPlateada: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad_plateada'])!,
      completado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completado'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $PlateosTable createAlias(String alias) {
    return $PlateosTable(attachedDatabase, alias);
  }
}

class Plateo extends DataClass implements Insertable<Plateo> {
  final int id;
  final int? idPlateo;
  final String nombreLote;
  final DateTime fechaIngreso;
  final DateTime? fechaSalida;
  final int cantidadPlateada;
  final bool completado;
  final bool sincronizado;
  const Plateo(
      {required this.id,
      this.idPlateo,
      required this.nombreLote,
      required this.fechaIngreso,
      this.fechaSalida,
      required this.cantidadPlateada,
      required this.completado,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idPlateo != null) {
      map['id_plateo'] = Variable<int>(idPlateo);
    }
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    if (!nullToAbsent || fechaSalida != null) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida);
    }
    map['cantidad_plateada'] = Variable<int>(cantidadPlateada);
    map['completado'] = Variable<bool>(completado);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  PlateosCompanion toCompanion(bool nullToAbsent) {
    return PlateosCompanion(
      id: Value(id),
      idPlateo: idPlateo == null && nullToAbsent
          ? const Value.absent()
          : Value(idPlateo),
      nombreLote: Value(nombreLote),
      fechaIngreso: Value(fechaIngreso),
      fechaSalida: fechaSalida == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaSalida),
      cantidadPlateada: Value(cantidadPlateada),
      completado: Value(completado),
      sincronizado: Value(sincronizado),
    );
  }

  factory Plateo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plateo(
      id: serializer.fromJson<int>(json['id']),
      idPlateo: serializer.fromJson<int?>(json['idPlateo']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      fechaSalida: serializer.fromJson<DateTime?>(json['fechaSalida']),
      cantidadPlateada: serializer.fromJson<int>(json['cantidadPlateada']),
      completado: serializer.fromJson<bool>(json['completado']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idPlateo': serializer.toJson<int?>(idPlateo),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'fechaSalida': serializer.toJson<DateTime?>(fechaSalida),
      'cantidadPlateada': serializer.toJson<int>(cantidadPlateada),
      'completado': serializer.toJson<bool>(completado),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  Plateo copyWith(
          {int? id,
          Value<int?> idPlateo = const Value.absent(),
          String? nombreLote,
          DateTime? fechaIngreso,
          Value<DateTime?> fechaSalida = const Value.absent(),
          int? cantidadPlateada,
          bool? completado,
          bool? sincronizado}) =>
      Plateo(
        id: id ?? this.id,
        idPlateo: idPlateo.present ? idPlateo.value : this.idPlateo,
        nombreLote: nombreLote ?? this.nombreLote,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        fechaSalida: fechaSalida.present ? fechaSalida.value : this.fechaSalida,
        cantidadPlateada: cantidadPlateada ?? this.cantidadPlateada,
        completado: completado ?? this.completado,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('Plateo(')
          ..write('id: $id, ')
          ..write('idPlateo: $idPlateo, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadPlateada: $cantidadPlateada, ')
          ..write('completado: $completado, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idPlateo, nombreLote, fechaIngreso,
      fechaSalida, cantidadPlateada, completado, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plateo &&
          other.id == this.id &&
          other.idPlateo == this.idPlateo &&
          other.nombreLote == this.nombreLote &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaSalida == this.fechaSalida &&
          other.cantidadPlateada == this.cantidadPlateada &&
          other.completado == this.completado &&
          other.sincronizado == this.sincronizado);
}

class PlateosCompanion extends UpdateCompanion<Plateo> {
  final Value<int> id;
  final Value<int?> idPlateo;
  final Value<String> nombreLote;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaSalida;
  final Value<int> cantidadPlateada;
  final Value<bool> completado;
  final Value<bool> sincronizado;
  const PlateosCompanion({
    this.id = const Value.absent(),
    this.idPlateo = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.cantidadPlateada = const Value.absent(),
    this.completado = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  PlateosCompanion.insert({
    this.id = const Value.absent(),
    this.idPlateo = const Value.absent(),
    required String nombreLote,
    required DateTime fechaIngreso,
    this.fechaSalida = const Value.absent(),
    required int cantidadPlateada,
    this.completado = const Value.absent(),
    this.sincronizado = const Value.absent(),
  })  : nombreLote = Value(nombreLote),
        fechaIngreso = Value(fechaIngreso),
        cantidadPlateada = Value(cantidadPlateada);
  static Insertable<Plateo> custom({
    Expression<int>? id,
    Expression<int>? idPlateo,
    Expression<String>? nombreLote,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime>? fechaSalida,
    Expression<int>? cantidadPlateada,
    Expression<bool>? completado,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idPlateo != null) 'id_plateo': idPlateo,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (cantidadPlateada != null) 'cantidad_plateada': cantidadPlateada,
      if (completado != null) 'completado': completado,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  PlateosCompanion copyWith(
      {Value<int>? id,
      Value<int?>? idPlateo,
      Value<String>? nombreLote,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? fechaSalida,
      Value<int>? cantidadPlateada,
      Value<bool>? completado,
      Value<bool>? sincronizado}) {
    return PlateosCompanion(
      id: id ?? this.id,
      idPlateo: idPlateo ?? this.idPlateo,
      nombreLote: nombreLote ?? this.nombreLote,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      cantidadPlateada: cantidadPlateada ?? this.cantidadPlateada,
      completado: completado ?? this.completado,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idPlateo.present) {
      map['id_plateo'] = Variable<int>(idPlateo.value);
    }
    if (nombreLote.present) {
      map['nombre_lote'] = Variable<String>(nombreLote.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (fechaSalida.present) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida.value);
    }
    if (cantidadPlateada.present) {
      map['cantidad_plateada'] = Variable<int>(cantidadPlateada.value);
    }
    if (completado.present) {
      map['completado'] = Variable<bool>(completado.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlateosCompanion(')
          ..write('id: $id, ')
          ..write('idPlateo: $idPlateo, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadPlateada: $cantidadPlateada, ')
          ..write('completado: $completado, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $PlateoDiarioTable extends PlateoDiario
    with TableInfo<$PlateoDiarioTable, PlateoDiarioData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlateoDiarioTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idPlateoMeta =
      const VerificationMeta('idPlateo');
  @override
  late final GeneratedColumn<int> idPlateo = GeneratedColumn<int>(
      'id_plateo', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES plateos(id)');
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
      'fecha', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cantidadPlateadaMeta =
      const VerificationMeta('cantidadPlateada');
  @override
  late final GeneratedColumn<int> cantidadPlateada = GeneratedColumn<int>(
      'cantidad_plateada', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tipoPlateoMeta =
      const VerificationMeta('tipoPlateo');
  @override
  late final GeneratedColumn<String> tipoPlateo = GeneratedColumn<String>(
      'tipo_plateo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idPlateo,
        fecha,
        cantidadPlateada,
        tipoPlateo,
        responsable,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'plateo_diario';
  @override
  String get actualTableName => 'plateo_diario';
  @override
  VerificationContext validateIntegrity(Insertable<PlateoDiarioData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_plateo')) {
      context.handle(_idPlateoMeta,
          idPlateo.isAcceptableOrUnknown(data['id_plateo']!, _idPlateoMeta));
    } else if (isInserting) {
      context.missing(_idPlateoMeta);
    }
    if (data.containsKey('fecha')) {
      context.handle(
          _fechaMeta, fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta));
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    if (data.containsKey('cantidad_plateada')) {
      context.handle(
          _cantidadPlateadaMeta,
          cantidadPlateada.isAcceptableOrUnknown(
              data['cantidad_plateada']!, _cantidadPlateadaMeta));
    } else if (isInserting) {
      context.missing(_cantidadPlateadaMeta);
    }
    if (data.containsKey('tipo_plateo')) {
      context.handle(
          _tipoPlateoMeta,
          tipoPlateo.isAcceptableOrUnknown(
              data['tipo_plateo']!, _tipoPlateoMeta));
    } else if (isInserting) {
      context.missing(_tipoPlateoMeta);
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlateoDiarioData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlateoDiarioData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idPlateo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_plateo'])!,
      fecha: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha'])!,
      cantidadPlateada: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad_plateada'])!,
      tipoPlateo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo_plateo'])!,
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $PlateoDiarioTable createAlias(String alias) {
    return $PlateoDiarioTable(attachedDatabase, alias);
  }
}

class PlateoDiarioData extends DataClass
    implements Insertable<PlateoDiarioData> {
  final int id;
  final int idPlateo;
  final DateTime fecha;
  final int cantidadPlateada;
  final String tipoPlateo;
  final String responsable;
  final bool sincronizado;
  const PlateoDiarioData(
      {required this.id,
      required this.idPlateo,
      required this.fecha,
      required this.cantidadPlateada,
      required this.tipoPlateo,
      required this.responsable,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_plateo'] = Variable<int>(idPlateo);
    map['fecha'] = Variable<DateTime>(fecha);
    map['cantidad_plateada'] = Variable<int>(cantidadPlateada);
    map['tipo_plateo'] = Variable<String>(tipoPlateo);
    map['responsable'] = Variable<String>(responsable);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  PlateoDiarioCompanion toCompanion(bool nullToAbsent) {
    return PlateoDiarioCompanion(
      id: Value(id),
      idPlateo: Value(idPlateo),
      fecha: Value(fecha),
      cantidadPlateada: Value(cantidadPlateada),
      tipoPlateo: Value(tipoPlateo),
      responsable: Value(responsable),
      sincronizado: Value(sincronizado),
    );
  }

  factory PlateoDiarioData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlateoDiarioData(
      id: serializer.fromJson<int>(json['id']),
      idPlateo: serializer.fromJson<int>(json['idPlateo']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      cantidadPlateada: serializer.fromJson<int>(json['cantidadPlateada']),
      tipoPlateo: serializer.fromJson<String>(json['tipoPlateo']),
      responsable: serializer.fromJson<String>(json['responsable']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idPlateo': serializer.toJson<int>(idPlateo),
      'fecha': serializer.toJson<DateTime>(fecha),
      'cantidadPlateada': serializer.toJson<int>(cantidadPlateada),
      'tipoPlateo': serializer.toJson<String>(tipoPlateo),
      'responsable': serializer.toJson<String>(responsable),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  PlateoDiarioData copyWith(
          {int? id,
          int? idPlateo,
          DateTime? fecha,
          int? cantidadPlateada,
          String? tipoPlateo,
          String? responsable,
          bool? sincronizado}) =>
      PlateoDiarioData(
        id: id ?? this.id,
        idPlateo: idPlateo ?? this.idPlateo,
        fecha: fecha ?? this.fecha,
        cantidadPlateada: cantidadPlateada ?? this.cantidadPlateada,
        tipoPlateo: tipoPlateo ?? this.tipoPlateo,
        responsable: responsable ?? this.responsable,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('PlateoDiarioData(')
          ..write('id: $id, ')
          ..write('idPlateo: $idPlateo, ')
          ..write('fecha: $fecha, ')
          ..write('cantidadPlateada: $cantidadPlateada, ')
          ..write('tipoPlateo: $tipoPlateo, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idPlateo, fecha, cantidadPlateada,
      tipoPlateo, responsable, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlateoDiarioData &&
          other.id == this.id &&
          other.idPlateo == this.idPlateo &&
          other.fecha == this.fecha &&
          other.cantidadPlateada == this.cantidadPlateada &&
          other.tipoPlateo == this.tipoPlateo &&
          other.responsable == this.responsable &&
          other.sincronizado == this.sincronizado);
}

class PlateoDiarioCompanion extends UpdateCompanion<PlateoDiarioData> {
  final Value<int> id;
  final Value<int> idPlateo;
  final Value<DateTime> fecha;
  final Value<int> cantidadPlateada;
  final Value<String> tipoPlateo;
  final Value<String> responsable;
  final Value<bool> sincronizado;
  const PlateoDiarioCompanion({
    this.id = const Value.absent(),
    this.idPlateo = const Value.absent(),
    this.fecha = const Value.absent(),
    this.cantidadPlateada = const Value.absent(),
    this.tipoPlateo = const Value.absent(),
    this.responsable = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  PlateoDiarioCompanion.insert({
    this.id = const Value.absent(),
    required int idPlateo,
    required DateTime fecha,
    required int cantidadPlateada,
    required String tipoPlateo,
    required String responsable,
    this.sincronizado = const Value.absent(),
  })  : idPlateo = Value(idPlateo),
        fecha = Value(fecha),
        cantidadPlateada = Value(cantidadPlateada),
        tipoPlateo = Value(tipoPlateo),
        responsable = Value(responsable);
  static Insertable<PlateoDiarioData> custom({
    Expression<int>? id,
    Expression<int>? idPlateo,
    Expression<DateTime>? fecha,
    Expression<int>? cantidadPlateada,
    Expression<String>? tipoPlateo,
    Expression<String>? responsable,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idPlateo != null) 'id_plateo': idPlateo,
      if (fecha != null) 'fecha': fecha,
      if (cantidadPlateada != null) 'cantidad_plateada': cantidadPlateada,
      if (tipoPlateo != null) 'tipo_plateo': tipoPlateo,
      if (responsable != null) 'responsable': responsable,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  PlateoDiarioCompanion copyWith(
      {Value<int>? id,
      Value<int>? idPlateo,
      Value<DateTime>? fecha,
      Value<int>? cantidadPlateada,
      Value<String>? tipoPlateo,
      Value<String>? responsable,
      Value<bool>? sincronizado}) {
    return PlateoDiarioCompanion(
      id: id ?? this.id,
      idPlateo: idPlateo ?? this.idPlateo,
      fecha: fecha ?? this.fecha,
      cantidadPlateada: cantidadPlateada ?? this.cantidadPlateada,
      tipoPlateo: tipoPlateo ?? this.tipoPlateo,
      responsable: responsable ?? this.responsable,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idPlateo.present) {
      map['id_plateo'] = Variable<int>(idPlateo.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (cantidadPlateada.present) {
      map['cantidad_plateada'] = Variable<int>(cantidadPlateada.value);
    }
    if (tipoPlateo.present) {
      map['tipo_plateo'] = Variable<String>(tipoPlateo.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlateoDiarioCompanion(')
          ..write('id: $id, ')
          ..write('idPlateo: $idPlateo, ')
          ..write('fecha: $fecha, ')
          ..write('cantidadPlateada: $cantidadPlateada, ')
          ..write('tipoPlateo: $tipoPlateo, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $PodasTable extends Podas with TableInfo<$PodasTable, Poda> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PodasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idPodaMeta = const VerificationMeta('idPoda');
  @override
  late final GeneratedColumn<int> idPoda = GeneratedColumn<int>(
      'id_poda', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreLoteMeta =
      const VerificationMeta('nombreLote');
  @override
  late final GeneratedColumn<String> nombreLote = GeneratedColumn<String>(
      'nombre_lote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  @override
  late final GeneratedColumn<DateTime> fechaIngreso = GeneratedColumn<DateTime>(
      'fecha_ingreso', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fechaSalidaMeta =
      const VerificationMeta('fechaSalida');
  @override
  late final GeneratedColumn<DateTime> fechaSalida = GeneratedColumn<DateTime>(
      'fecha_salida', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cantidadPodadaMeta =
      const VerificationMeta('cantidadPodada');
  @override
  late final GeneratedColumn<int> cantidadPodada = GeneratedColumn<int>(
      'cantidad_podada', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _completadaMeta =
      const VerificationMeta('completada');
  @override
  late final GeneratedColumn<bool> completada =
      GeneratedColumn<bool>('completada', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("completada" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idPoda,
        nombreLote,
        fechaIngreso,
        fechaSalida,
        cantidadPodada,
        completada,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'podas';
  @override
  String get actualTableName => 'podas';
  @override
  VerificationContext validateIntegrity(Insertable<Poda> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_poda')) {
      context.handle(_idPodaMeta,
          idPoda.isAcceptableOrUnknown(data['id_poda']!, _idPodaMeta));
    }
    if (data.containsKey('nombre_lote')) {
      context.handle(
          _nombreLoteMeta,
          nombreLote.isAcceptableOrUnknown(
              data['nombre_lote']!, _nombreLoteMeta));
    } else if (isInserting) {
      context.missing(_nombreLoteMeta);
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
          _fechaIngresoMeta,
          fechaIngreso.isAcceptableOrUnknown(
              data['fecha_ingreso']!, _fechaIngresoMeta));
    } else if (isInserting) {
      context.missing(_fechaIngresoMeta);
    }
    if (data.containsKey('fecha_salida')) {
      context.handle(
          _fechaSalidaMeta,
          fechaSalida.isAcceptableOrUnknown(
              data['fecha_salida']!, _fechaSalidaMeta));
    }
    if (data.containsKey('cantidad_podada')) {
      context.handle(
          _cantidadPodadaMeta,
          cantidadPodada.isAcceptableOrUnknown(
              data['cantidad_podada']!, _cantidadPodadaMeta));
    } else if (isInserting) {
      context.missing(_cantidadPodadaMeta);
    }
    if (data.containsKey('completada')) {
      context.handle(
          _completadaMeta,
          completada.isAcceptableOrUnknown(
              data['completada']!, _completadaMeta));
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Poda map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Poda(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idPoda: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_poda']),
      nombreLote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_lote'])!,
      fechaIngreso: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_ingreso'])!,
      fechaSalida: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_salida']),
      cantidadPodada: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad_podada'])!,
      completada: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completada'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $PodasTable createAlias(String alias) {
    return $PodasTable(attachedDatabase, alias);
  }
}

class Poda extends DataClass implements Insertable<Poda> {
  final int id;
  final int? idPoda;
  final String nombreLote;
  final DateTime fechaIngreso;
  final DateTime? fechaSalida;
  final int cantidadPodada;
  final bool completada;
  final bool sincronizado;
  const Poda(
      {required this.id,
      this.idPoda,
      required this.nombreLote,
      required this.fechaIngreso,
      this.fechaSalida,
      required this.cantidadPodada,
      required this.completada,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idPoda != null) {
      map['id_poda'] = Variable<int>(idPoda);
    }
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    if (!nullToAbsent || fechaSalida != null) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida);
    }
    map['cantidad_podada'] = Variable<int>(cantidadPodada);
    map['completada'] = Variable<bool>(completada);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  PodasCompanion toCompanion(bool nullToAbsent) {
    return PodasCompanion(
      id: Value(id),
      idPoda:
          idPoda == null && nullToAbsent ? const Value.absent() : Value(idPoda),
      nombreLote: Value(nombreLote),
      fechaIngreso: Value(fechaIngreso),
      fechaSalida: fechaSalida == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaSalida),
      cantidadPodada: Value(cantidadPodada),
      completada: Value(completada),
      sincronizado: Value(sincronizado),
    );
  }

  factory Poda.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Poda(
      id: serializer.fromJson<int>(json['id']),
      idPoda: serializer.fromJson<int?>(json['idPoda']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      fechaSalida: serializer.fromJson<DateTime?>(json['fechaSalida']),
      cantidadPodada: serializer.fromJson<int>(json['cantidadPodada']),
      completada: serializer.fromJson<bool>(json['completada']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idPoda': serializer.toJson<int?>(idPoda),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'fechaSalida': serializer.toJson<DateTime?>(fechaSalida),
      'cantidadPodada': serializer.toJson<int>(cantidadPodada),
      'completada': serializer.toJson<bool>(completada),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  Poda copyWith(
          {int? id,
          Value<int?> idPoda = const Value.absent(),
          String? nombreLote,
          DateTime? fechaIngreso,
          Value<DateTime?> fechaSalida = const Value.absent(),
          int? cantidadPodada,
          bool? completada,
          bool? sincronizado}) =>
      Poda(
        id: id ?? this.id,
        idPoda: idPoda.present ? idPoda.value : this.idPoda,
        nombreLote: nombreLote ?? this.nombreLote,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        fechaSalida: fechaSalida.present ? fechaSalida.value : this.fechaSalida,
        cantidadPodada: cantidadPodada ?? this.cantidadPodada,
        completada: completada ?? this.completada,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('Poda(')
          ..write('id: $id, ')
          ..write('idPoda: $idPoda, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadPodada: $cantidadPodada, ')
          ..write('completada: $completada, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idPoda, nombreLote, fechaIngreso,
      fechaSalida, cantidadPodada, completada, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Poda &&
          other.id == this.id &&
          other.idPoda == this.idPoda &&
          other.nombreLote == this.nombreLote &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaSalida == this.fechaSalida &&
          other.cantidadPodada == this.cantidadPodada &&
          other.completada == this.completada &&
          other.sincronizado == this.sincronizado);
}

class PodasCompanion extends UpdateCompanion<Poda> {
  final Value<int> id;
  final Value<int?> idPoda;
  final Value<String> nombreLote;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaSalida;
  final Value<int> cantidadPodada;
  final Value<bool> completada;
  final Value<bool> sincronizado;
  const PodasCompanion({
    this.id = const Value.absent(),
    this.idPoda = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.cantidadPodada = const Value.absent(),
    this.completada = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  PodasCompanion.insert({
    this.id = const Value.absent(),
    this.idPoda = const Value.absent(),
    required String nombreLote,
    required DateTime fechaIngreso,
    this.fechaSalida = const Value.absent(),
    required int cantidadPodada,
    this.completada = const Value.absent(),
    this.sincronizado = const Value.absent(),
  })  : nombreLote = Value(nombreLote),
        fechaIngreso = Value(fechaIngreso),
        cantidadPodada = Value(cantidadPodada);
  static Insertable<Poda> custom({
    Expression<int>? id,
    Expression<int>? idPoda,
    Expression<String>? nombreLote,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime>? fechaSalida,
    Expression<int>? cantidadPodada,
    Expression<bool>? completada,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idPoda != null) 'id_poda': idPoda,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (cantidadPodada != null) 'cantidad_podada': cantidadPodada,
      if (completada != null) 'completada': completada,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  PodasCompanion copyWith(
      {Value<int>? id,
      Value<int?>? idPoda,
      Value<String>? nombreLote,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? fechaSalida,
      Value<int>? cantidadPodada,
      Value<bool>? completada,
      Value<bool>? sincronizado}) {
    return PodasCompanion(
      id: id ?? this.id,
      idPoda: idPoda ?? this.idPoda,
      nombreLote: nombreLote ?? this.nombreLote,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      cantidadPodada: cantidadPodada ?? this.cantidadPodada,
      completada: completada ?? this.completada,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idPoda.present) {
      map['id_poda'] = Variable<int>(idPoda.value);
    }
    if (nombreLote.present) {
      map['nombre_lote'] = Variable<String>(nombreLote.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (fechaSalida.present) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida.value);
    }
    if (cantidadPodada.present) {
      map['cantidad_podada'] = Variable<int>(cantidadPodada.value);
    }
    if (completada.present) {
      map['completada'] = Variable<bool>(completada.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodasCompanion(')
          ..write('id: $id, ')
          ..write('idPoda: $idPoda, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadPodada: $cantidadPodada, ')
          ..write('completada: $completada, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $PodaDiariaTable extends PodaDiaria
    with TableInfo<$PodaDiariaTable, PodaDiariaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PodaDiariaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idPodaMeta = const VerificationMeta('idPoda');
  @override
  late final GeneratedColumn<int> idPoda = GeneratedColumn<int>(
      'id_poda', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES podas(id)');
  static const VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  @override
  late final GeneratedColumn<DateTime> fechaIngreso = GeneratedColumn<DateTime>(
      'fecha_ingreso', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cantidadPodadaMeta =
      const VerificationMeta('cantidadPodada');
  @override
  late final GeneratedColumn<int> cantidadPodada = GeneratedColumn<int>(
      'cantidad_podada', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, idPoda, fechaIngreso, cantidadPodada, responsable, sincronizado];
  @override
  String get aliasedName => _alias ?? 'poda_diaria';
  @override
  String get actualTableName => 'poda_diaria';
  @override
  VerificationContext validateIntegrity(Insertable<PodaDiariaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_poda')) {
      context.handle(_idPodaMeta,
          idPoda.isAcceptableOrUnknown(data['id_poda']!, _idPodaMeta));
    } else if (isInserting) {
      context.missing(_idPodaMeta);
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
          _fechaIngresoMeta,
          fechaIngreso.isAcceptableOrUnknown(
              data['fecha_ingreso']!, _fechaIngresoMeta));
    } else if (isInserting) {
      context.missing(_fechaIngresoMeta);
    }
    if (data.containsKey('cantidad_podada')) {
      context.handle(
          _cantidadPodadaMeta,
          cantidadPodada.isAcceptableOrUnknown(
              data['cantidad_podada']!, _cantidadPodadaMeta));
    } else if (isInserting) {
      context.missing(_cantidadPodadaMeta);
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PodaDiariaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PodaDiariaData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idPoda: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_poda'])!,
      fechaIngreso: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_ingreso'])!,
      cantidadPodada: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad_podada'])!,
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $PodaDiariaTable createAlias(String alias) {
    return $PodaDiariaTable(attachedDatabase, alias);
  }
}

class PodaDiariaData extends DataClass implements Insertable<PodaDiariaData> {
  final int id;
  final int idPoda;
  final DateTime fechaIngreso;
  final int cantidadPodada;
  final String responsable;
  final bool sincronizado;
  const PodaDiariaData(
      {required this.id,
      required this.idPoda,
      required this.fechaIngreso,
      required this.cantidadPodada,
      required this.responsable,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_poda'] = Variable<int>(idPoda);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    map['cantidad_podada'] = Variable<int>(cantidadPodada);
    map['responsable'] = Variable<String>(responsable);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  PodaDiariaCompanion toCompanion(bool nullToAbsent) {
    return PodaDiariaCompanion(
      id: Value(id),
      idPoda: Value(idPoda),
      fechaIngreso: Value(fechaIngreso),
      cantidadPodada: Value(cantidadPodada),
      responsable: Value(responsable),
      sincronizado: Value(sincronizado),
    );
  }

  factory PodaDiariaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PodaDiariaData(
      id: serializer.fromJson<int>(json['id']),
      idPoda: serializer.fromJson<int>(json['idPoda']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      cantidadPodada: serializer.fromJson<int>(json['cantidadPodada']),
      responsable: serializer.fromJson<String>(json['responsable']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idPoda': serializer.toJson<int>(idPoda),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'cantidadPodada': serializer.toJson<int>(cantidadPodada),
      'responsable': serializer.toJson<String>(responsable),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  PodaDiariaData copyWith(
          {int? id,
          int? idPoda,
          DateTime? fechaIngreso,
          int? cantidadPodada,
          String? responsable,
          bool? sincronizado}) =>
      PodaDiariaData(
        id: id ?? this.id,
        idPoda: idPoda ?? this.idPoda,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        cantidadPodada: cantidadPodada ?? this.cantidadPodada,
        responsable: responsable ?? this.responsable,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('PodaDiariaData(')
          ..write('id: $id, ')
          ..write('idPoda: $idPoda, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('cantidadPodada: $cantidadPodada, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, idPoda, fechaIngreso, cantidadPodada, responsable, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PodaDiariaData &&
          other.id == this.id &&
          other.idPoda == this.idPoda &&
          other.fechaIngreso == this.fechaIngreso &&
          other.cantidadPodada == this.cantidadPodada &&
          other.responsable == this.responsable &&
          other.sincronizado == this.sincronizado);
}

class PodaDiariaCompanion extends UpdateCompanion<PodaDiariaData> {
  final Value<int> id;
  final Value<int> idPoda;
  final Value<DateTime> fechaIngreso;
  final Value<int> cantidadPodada;
  final Value<String> responsable;
  final Value<bool> sincronizado;
  const PodaDiariaCompanion({
    this.id = const Value.absent(),
    this.idPoda = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.cantidadPodada = const Value.absent(),
    this.responsable = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  PodaDiariaCompanion.insert({
    this.id = const Value.absent(),
    required int idPoda,
    required DateTime fechaIngreso,
    required int cantidadPodada,
    required String responsable,
    this.sincronizado = const Value.absent(),
  })  : idPoda = Value(idPoda),
        fechaIngreso = Value(fechaIngreso),
        cantidadPodada = Value(cantidadPodada),
        responsable = Value(responsable);
  static Insertable<PodaDiariaData> custom({
    Expression<int>? id,
    Expression<int>? idPoda,
    Expression<DateTime>? fechaIngreso,
    Expression<int>? cantidadPodada,
    Expression<String>? responsable,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idPoda != null) 'id_poda': idPoda,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (cantidadPodada != null) 'cantidad_podada': cantidadPodada,
      if (responsable != null) 'responsable': responsable,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  PodaDiariaCompanion copyWith(
      {Value<int>? id,
      Value<int>? idPoda,
      Value<DateTime>? fechaIngreso,
      Value<int>? cantidadPodada,
      Value<String>? responsable,
      Value<bool>? sincronizado}) {
    return PodaDiariaCompanion(
      id: id ?? this.id,
      idPoda: idPoda ?? this.idPoda,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      cantidadPodada: cantidadPodada ?? this.cantidadPodada,
      responsable: responsable ?? this.responsable,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idPoda.present) {
      map['id_poda'] = Variable<int>(idPoda.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (cantidadPodada.present) {
      map['cantidad_podada'] = Variable<int>(cantidadPodada.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodaDiariaCompanion(')
          ..write('id: $id, ')
          ..write('idPoda: $idPoda, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('cantidadPodada: $cantidadPodada, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $ProductoAgroquimicoTable extends ProductoAgroquimico
    with TableInfo<$ProductoAgroquimicoTable, ProductoAgroquimicoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductoAgroquimicoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idProductoAgroquimicoMeta =
      const VerificationMeta('idProductoAgroquimico');
  @override
  late final GeneratedColumn<int> idProductoAgroquimico = GeneratedColumn<int>(
      'id_producto_agroquimico', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreProductoAgroquimicoMeta =
      const VerificationMeta('nombreProductoAgroquimico');
  @override
  late final GeneratedColumn<String> nombreProductoAgroquimico =
      GeneratedColumn<String>('nombre_producto_agroquimico', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tipoProductoAgroquimicoMeta =
      const VerificationMeta('tipoProductoAgroquimico');
  @override
  late final GeneratedColumn<String> tipoProductoAgroquimico =
      GeneratedColumn<String>('tipo_producto_agroquimico', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _claseProductoMeta =
      const VerificationMeta('claseProducto');
  @override
  late final GeneratedColumn<String> claseProducto = GeneratedColumn<String>(
      'clase_producto', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ingredienteActivoProductoAgroquimicoMeta =
      const VerificationMeta('ingredienteActivoProductoAgroquimico');
  @override
  late final GeneratedColumn<String> ingredienteActivoProductoAgroquimico =
      GeneratedColumn<String>(
          'ingrediente_activo_producto_agroquimico', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _periodoCarenciaProductoAgroquimicoMeta =
      const VerificationMeta('periodoCarenciaProductoAgroquimico');
  @override
  late final GeneratedColumn<int> periodoCarenciaProductoAgroquimico =
      GeneratedColumn<int>(
          'periodo_carencia_producto_agroquimico', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _presentacionProductoAgroquimicoMeta =
      const VerificationMeta('presentacionProductoAgroquimico');
  @override
  late final GeneratedColumn<String> presentacionProductoAgroquimico =
      GeneratedColumn<String>(
          'presentacion_producto_agroquimico', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaUltimaActualizacionMeta =
      const VerificationMeta('fechaUltimaActualizacion');
  @override
  late final GeneratedColumn<DateTime> fechaUltimaActualizacion =
      GeneratedColumn<DateTime>('fecha_ultima_actualizacion', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        idProductoAgroquimico,
        nombreProductoAgroquimico,
        tipoProductoAgroquimico,
        claseProducto,
        ingredienteActivoProductoAgroquimico,
        periodoCarenciaProductoAgroquimico,
        presentacionProductoAgroquimico,
        fechaUltimaActualizacion
      ];
  @override
  String get aliasedName => _alias ?? 'producto_agroquimico';
  @override
  String get actualTableName => 'producto_agroquimico';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductoAgroquimicoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_producto_agroquimico')) {
      context.handle(
          _idProductoAgroquimicoMeta,
          idProductoAgroquimico.isAcceptableOrUnknown(
              data['id_producto_agroquimico']!, _idProductoAgroquimicoMeta));
    }
    if (data.containsKey('nombre_producto_agroquimico')) {
      context.handle(
          _nombreProductoAgroquimicoMeta,
          nombreProductoAgroquimico.isAcceptableOrUnknown(
              data['nombre_producto_agroquimico']!,
              _nombreProductoAgroquimicoMeta));
    } else if (isInserting) {
      context.missing(_nombreProductoAgroquimicoMeta);
    }
    if (data.containsKey('tipo_producto_agroquimico')) {
      context.handle(
          _tipoProductoAgroquimicoMeta,
          tipoProductoAgroquimico.isAcceptableOrUnknown(
              data['tipo_producto_agroquimico']!,
              _tipoProductoAgroquimicoMeta));
    } else if (isInserting) {
      context.missing(_tipoProductoAgroquimicoMeta);
    }
    if (data.containsKey('clase_producto')) {
      context.handle(
          _claseProductoMeta,
          claseProducto.isAcceptableOrUnknown(
              data['clase_producto']!, _claseProductoMeta));
    } else if (isInserting) {
      context.missing(_claseProductoMeta);
    }
    if (data.containsKey('ingrediente_activo_producto_agroquimico')) {
      context.handle(
          _ingredienteActivoProductoAgroquimicoMeta,
          ingredienteActivoProductoAgroquimico.isAcceptableOrUnknown(
              data['ingrediente_activo_producto_agroquimico']!,
              _ingredienteActivoProductoAgroquimicoMeta));
    } else if (isInserting) {
      context.missing(_ingredienteActivoProductoAgroquimicoMeta);
    }
    if (data.containsKey('periodo_carencia_producto_agroquimico')) {
      context.handle(
          _periodoCarenciaProductoAgroquimicoMeta,
          periodoCarenciaProductoAgroquimico.isAcceptableOrUnknown(
              data['periodo_carencia_producto_agroquimico']!,
              _periodoCarenciaProductoAgroquimicoMeta));
    } else if (isInserting) {
      context.missing(_periodoCarenciaProductoAgroquimicoMeta);
    }
    if (data.containsKey('presentacion_producto_agroquimico')) {
      context.handle(
          _presentacionProductoAgroquimicoMeta,
          presentacionProductoAgroquimico.isAcceptableOrUnknown(
              data['presentacion_producto_agroquimico']!,
              _presentacionProductoAgroquimicoMeta));
    } else if (isInserting) {
      context.missing(_presentacionProductoAgroquimicoMeta);
    }
    if (data.containsKey('fecha_ultima_actualizacion')) {
      context.handle(
          _fechaUltimaActualizacionMeta,
          fechaUltimaActualizacion.isAcceptableOrUnknown(
              data['fecha_ultima_actualizacion']!,
              _fechaUltimaActualizacionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idProductoAgroquimico};
  @override
  ProductoAgroquimicoData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductoAgroquimicoData(
      idProductoAgroquimico: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_producto_agroquimico'])!,
      nombreProductoAgroquimico: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}nombre_producto_agroquimico'])!,
      tipoProductoAgroquimico: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tipo_producto_agroquimico'])!,
      claseProducto: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clase_producto'])!,
      ingredienteActivoProductoAgroquimico: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ingrediente_activo_producto_agroquimico'])!,
      periodoCarenciaProductoAgroquimico: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}periodo_carencia_producto_agroquimico'])!,
      presentacionProductoAgroquimico: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}presentacion_producto_agroquimico'])!,
      fechaUltimaActualizacion: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}fecha_ultima_actualizacion']),
    );
  }

  @override
  $ProductoAgroquimicoTable createAlias(String alias) {
    return $ProductoAgroquimicoTable(attachedDatabase, alias);
  }
}

class ProductoAgroquimicoData extends DataClass
    implements Insertable<ProductoAgroquimicoData> {
  final int idProductoAgroquimico;
  final String nombreProductoAgroquimico;
  final String tipoProductoAgroquimico;
  final String claseProducto;
  final String ingredienteActivoProductoAgroquimico;
  final int periodoCarenciaProductoAgroquimico;
  final String presentacionProductoAgroquimico;
  final DateTime? fechaUltimaActualizacion;
  const ProductoAgroquimicoData(
      {required this.idProductoAgroquimico,
      required this.nombreProductoAgroquimico,
      required this.tipoProductoAgroquimico,
      required this.claseProducto,
      required this.ingredienteActivoProductoAgroquimico,
      required this.periodoCarenciaProductoAgroquimico,
      required this.presentacionProductoAgroquimico,
      this.fechaUltimaActualizacion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_producto_agroquimico'] = Variable<int>(idProductoAgroquimico);
    map['nombre_producto_agroquimico'] =
        Variable<String>(nombreProductoAgroquimico);
    map['tipo_producto_agroquimico'] =
        Variable<String>(tipoProductoAgroquimico);
    map['clase_producto'] = Variable<String>(claseProducto);
    map['ingrediente_activo_producto_agroquimico'] =
        Variable<String>(ingredienteActivoProductoAgroquimico);
    map['periodo_carencia_producto_agroquimico'] =
        Variable<int>(periodoCarenciaProductoAgroquimico);
    map['presentacion_producto_agroquimico'] =
        Variable<String>(presentacionProductoAgroquimico);
    if (!nullToAbsent || fechaUltimaActualizacion != null) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion);
    }
    return map;
  }

  ProductoAgroquimicoCompanion toCompanion(bool nullToAbsent) {
    return ProductoAgroquimicoCompanion(
      idProductoAgroquimico: Value(idProductoAgroquimico),
      nombreProductoAgroquimico: Value(nombreProductoAgroquimico),
      tipoProductoAgroquimico: Value(tipoProductoAgroquimico),
      claseProducto: Value(claseProducto),
      ingredienteActivoProductoAgroquimico:
          Value(ingredienteActivoProductoAgroquimico),
      periodoCarenciaProductoAgroquimico:
          Value(periodoCarenciaProductoAgroquimico),
      presentacionProductoAgroquimico: Value(presentacionProductoAgroquimico),
      fechaUltimaActualizacion: fechaUltimaActualizacion == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaUltimaActualizacion),
    );
  }

  factory ProductoAgroquimicoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductoAgroquimicoData(
      idProductoAgroquimico:
          serializer.fromJson<int>(json['idProductoAgroquimico']),
      nombreProductoAgroquimico:
          serializer.fromJson<String>(json['nombreProductoAgroquimico']),
      tipoProductoAgroquimico:
          serializer.fromJson<String>(json['tipoProductoAgroquimico']),
      claseProducto: serializer.fromJson<String>(json['claseProducto']),
      ingredienteActivoProductoAgroquimico: serializer
          .fromJson<String>(json['ingredienteActivoProductoAgroquimico']),
      periodoCarenciaProductoAgroquimico:
          serializer.fromJson<int>(json['periodoCarenciaProductoAgroquimico']),
      presentacionProductoAgroquimico:
          serializer.fromJson<String>(json['presentacionProductoAgroquimico']),
      fechaUltimaActualizacion:
          serializer.fromJson<DateTime?>(json['fechaUltimaActualizacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idProductoAgroquimico': serializer.toJson<int>(idProductoAgroquimico),
      'nombreProductoAgroquimico':
          serializer.toJson<String>(nombreProductoAgroquimico),
      'tipoProductoAgroquimico':
          serializer.toJson<String>(tipoProductoAgroquimico),
      'claseProducto': serializer.toJson<String>(claseProducto),
      'ingredienteActivoProductoAgroquimico':
          serializer.toJson<String>(ingredienteActivoProductoAgroquimico),
      'periodoCarenciaProductoAgroquimico':
          serializer.toJson<int>(periodoCarenciaProductoAgroquimico),
      'presentacionProductoAgroquimico':
          serializer.toJson<String>(presentacionProductoAgroquimico),
      'fechaUltimaActualizacion':
          serializer.toJson<DateTime?>(fechaUltimaActualizacion),
    };
  }

  ProductoAgroquimicoData copyWith(
          {int? idProductoAgroquimico,
          String? nombreProductoAgroquimico,
          String? tipoProductoAgroquimico,
          String? claseProducto,
          String? ingredienteActivoProductoAgroquimico,
          int? periodoCarenciaProductoAgroquimico,
          String? presentacionProductoAgroquimico,
          Value<DateTime?> fechaUltimaActualizacion = const Value.absent()}) =>
      ProductoAgroquimicoData(
        idProductoAgroquimico:
            idProductoAgroquimico ?? this.idProductoAgroquimico,
        nombreProductoAgroquimico:
            nombreProductoAgroquimico ?? this.nombreProductoAgroquimico,
        tipoProductoAgroquimico:
            tipoProductoAgroquimico ?? this.tipoProductoAgroquimico,
        claseProducto: claseProducto ?? this.claseProducto,
        ingredienteActivoProductoAgroquimico:
            ingredienteActivoProductoAgroquimico ??
                this.ingredienteActivoProductoAgroquimico,
        periodoCarenciaProductoAgroquimico:
            periodoCarenciaProductoAgroquimico ??
                this.periodoCarenciaProductoAgroquimico,
        presentacionProductoAgroquimico: presentacionProductoAgroquimico ??
            this.presentacionProductoAgroquimico,
        fechaUltimaActualizacion: fechaUltimaActualizacion.present
            ? fechaUltimaActualizacion.value
            : this.fechaUltimaActualizacion,
      );
  @override
  String toString() {
    return (StringBuffer('ProductoAgroquimicoData(')
          ..write('idProductoAgroquimico: $idProductoAgroquimico, ')
          ..write('nombreProductoAgroquimico: $nombreProductoAgroquimico, ')
          ..write('tipoProductoAgroquimico: $tipoProductoAgroquimico, ')
          ..write('claseProducto: $claseProducto, ')
          ..write(
              'ingredienteActivoProductoAgroquimico: $ingredienteActivoProductoAgroquimico, ')
          ..write(
              'periodoCarenciaProductoAgroquimico: $periodoCarenciaProductoAgroquimico, ')
          ..write(
              'presentacionProductoAgroquimico: $presentacionProductoAgroquimico, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idProductoAgroquimico,
      nombreProductoAgroquimico,
      tipoProductoAgroquimico,
      claseProducto,
      ingredienteActivoProductoAgroquimico,
      periodoCarenciaProductoAgroquimico,
      presentacionProductoAgroquimico,
      fechaUltimaActualizacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductoAgroquimicoData &&
          other.idProductoAgroquimico == this.idProductoAgroquimico &&
          other.nombreProductoAgroquimico == this.nombreProductoAgroquimico &&
          other.tipoProductoAgroquimico == this.tipoProductoAgroquimico &&
          other.claseProducto == this.claseProducto &&
          other.ingredienteActivoProductoAgroquimico ==
              this.ingredienteActivoProductoAgroquimico &&
          other.periodoCarenciaProductoAgroquimico ==
              this.periodoCarenciaProductoAgroquimico &&
          other.presentacionProductoAgroquimico ==
              this.presentacionProductoAgroquimico &&
          other.fechaUltimaActualizacion == this.fechaUltimaActualizacion);
}

class ProductoAgroquimicoCompanion
    extends UpdateCompanion<ProductoAgroquimicoData> {
  final Value<int> idProductoAgroquimico;
  final Value<String> nombreProductoAgroquimico;
  final Value<String> tipoProductoAgroquimico;
  final Value<String> claseProducto;
  final Value<String> ingredienteActivoProductoAgroquimico;
  final Value<int> periodoCarenciaProductoAgroquimico;
  final Value<String> presentacionProductoAgroquimico;
  final Value<DateTime?> fechaUltimaActualizacion;
  const ProductoAgroquimicoCompanion({
    this.idProductoAgroquimico = const Value.absent(),
    this.nombreProductoAgroquimico = const Value.absent(),
    this.tipoProductoAgroquimico = const Value.absent(),
    this.claseProducto = const Value.absent(),
    this.ingredienteActivoProductoAgroquimico = const Value.absent(),
    this.periodoCarenciaProductoAgroquimico = const Value.absent(),
    this.presentacionProductoAgroquimico = const Value.absent(),
    this.fechaUltimaActualizacion = const Value.absent(),
  });
  ProductoAgroquimicoCompanion.insert({
    this.idProductoAgroquimico = const Value.absent(),
    required String nombreProductoAgroquimico,
    required String tipoProductoAgroquimico,
    required String claseProducto,
    required String ingredienteActivoProductoAgroquimico,
    required int periodoCarenciaProductoAgroquimico,
    required String presentacionProductoAgroquimico,
    this.fechaUltimaActualizacion = const Value.absent(),
  })  : nombreProductoAgroquimico = Value(nombreProductoAgroquimico),
        tipoProductoAgroquimico = Value(tipoProductoAgroquimico),
        claseProducto = Value(claseProducto),
        ingredienteActivoProductoAgroquimico =
            Value(ingredienteActivoProductoAgroquimico),
        periodoCarenciaProductoAgroquimico =
            Value(periodoCarenciaProductoAgroquimico),
        presentacionProductoAgroquimico =
            Value(presentacionProductoAgroquimico);
  static Insertable<ProductoAgroquimicoData> custom({
    Expression<int>? idProductoAgroquimico,
    Expression<String>? nombreProductoAgroquimico,
    Expression<String>? tipoProductoAgroquimico,
    Expression<String>? claseProducto,
    Expression<String>? ingredienteActivoProductoAgroquimico,
    Expression<int>? periodoCarenciaProductoAgroquimico,
    Expression<String>? presentacionProductoAgroquimico,
    Expression<DateTime>? fechaUltimaActualizacion,
  }) {
    return RawValuesInsertable({
      if (idProductoAgroquimico != null)
        'id_producto_agroquimico': idProductoAgroquimico,
      if (nombreProductoAgroquimico != null)
        'nombre_producto_agroquimico': nombreProductoAgroquimico,
      if (tipoProductoAgroquimico != null)
        'tipo_producto_agroquimico': tipoProductoAgroquimico,
      if (claseProducto != null) 'clase_producto': claseProducto,
      if (ingredienteActivoProductoAgroquimico != null)
        'ingrediente_activo_producto_agroquimico':
            ingredienteActivoProductoAgroquimico,
      if (periodoCarenciaProductoAgroquimico != null)
        'periodo_carencia_producto_agroquimico':
            periodoCarenciaProductoAgroquimico,
      if (presentacionProductoAgroquimico != null)
        'presentacion_producto_agroquimico': presentacionProductoAgroquimico,
      if (fechaUltimaActualizacion != null)
        'fecha_ultima_actualizacion': fechaUltimaActualizacion,
    });
  }

  ProductoAgroquimicoCompanion copyWith(
      {Value<int>? idProductoAgroquimico,
      Value<String>? nombreProductoAgroquimico,
      Value<String>? tipoProductoAgroquimico,
      Value<String>? claseProducto,
      Value<String>? ingredienteActivoProductoAgroquimico,
      Value<int>? periodoCarenciaProductoAgroquimico,
      Value<String>? presentacionProductoAgroquimico,
      Value<DateTime?>? fechaUltimaActualizacion}) {
    return ProductoAgroquimicoCompanion(
      idProductoAgroquimico:
          idProductoAgroquimico ?? this.idProductoAgroquimico,
      nombreProductoAgroquimico:
          nombreProductoAgroquimico ?? this.nombreProductoAgroquimico,
      tipoProductoAgroquimico:
          tipoProductoAgroquimico ?? this.tipoProductoAgroquimico,
      claseProducto: claseProducto ?? this.claseProducto,
      ingredienteActivoProductoAgroquimico:
          ingredienteActivoProductoAgroquimico ??
              this.ingredienteActivoProductoAgroquimico,
      periodoCarenciaProductoAgroquimico: periodoCarenciaProductoAgroquimico ??
          this.periodoCarenciaProductoAgroquimico,
      presentacionProductoAgroquimico: presentacionProductoAgroquimico ??
          this.presentacionProductoAgroquimico,
      fechaUltimaActualizacion:
          fechaUltimaActualizacion ?? this.fechaUltimaActualizacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idProductoAgroquimico.present) {
      map['id_producto_agroquimico'] =
          Variable<int>(idProductoAgroquimico.value);
    }
    if (nombreProductoAgroquimico.present) {
      map['nombre_producto_agroquimico'] =
          Variable<String>(nombreProductoAgroquimico.value);
    }
    if (tipoProductoAgroquimico.present) {
      map['tipo_producto_agroquimico'] =
          Variable<String>(tipoProductoAgroquimico.value);
    }
    if (claseProducto.present) {
      map['clase_producto'] = Variable<String>(claseProducto.value);
    }
    if (ingredienteActivoProductoAgroquimico.present) {
      map['ingrediente_activo_producto_agroquimico'] =
          Variable<String>(ingredienteActivoProductoAgroquimico.value);
    }
    if (periodoCarenciaProductoAgroquimico.present) {
      map['periodo_carencia_producto_agroquimico'] =
          Variable<int>(periodoCarenciaProductoAgroquimico.value);
    }
    if (presentacionProductoAgroquimico.present) {
      map['presentacion_producto_agroquimico'] =
          Variable<String>(presentacionProductoAgroquimico.value);
    }
    if (fechaUltimaActualizacion.present) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductoAgroquimicoCompanion(')
          ..write('idProductoAgroquimico: $idProductoAgroquimico, ')
          ..write('nombreProductoAgroquimico: $nombreProductoAgroquimico, ')
          ..write('tipoProductoAgroquimico: $tipoProductoAgroquimico, ')
          ..write('claseProducto: $claseProducto, ')
          ..write(
              'ingredienteActivoProductoAgroquimico: $ingredienteActivoProductoAgroquimico, ')
          ..write(
              'periodoCarenciaProductoAgroquimico: $periodoCarenciaProductoAgroquimico, ')
          ..write(
              'presentacionProductoAgroquimico: $presentacionProductoAgroquimico, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }
}

class $RegistroEnfermedadTable extends RegistroEnfermedad
    with TableInfo<$RegistroEnfermedadTable, RegistroEnfermedadData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegistroEnfermedadTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idRegistroEnfermedadMeta =
      const VerificationMeta('idRegistroEnfermedad');
  @override
  late final GeneratedColumn<int> idRegistroEnfermedad = GeneratedColumn<int>(
      'id_registro_enfermedad', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _fechaRegistroMeta =
      const VerificationMeta('fechaRegistro');
  @override
  late final GeneratedColumn<DateTime> fechaRegistro =
      GeneratedColumn<DateTime>('fecha_registro', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _horaRegistroMeta =
      const VerificationMeta('horaRegistro');
  @override
  late final GeneratedColumn<DateTime> horaRegistro = GeneratedColumn<DateTime>(
      'hora_registro', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _idPalmaMeta =
      const VerificationMeta('idPalma');
  @override
  late final GeneratedColumn<String> idPalma = GeneratedColumn<String>(
      'id_palma', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nombreEnfermedadMeta =
      const VerificationMeta('nombreEnfermedad');
  @override
  late final GeneratedColumn<String> nombreEnfermedad = GeneratedColumn<String>(
      'nombre_enfermedad', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idEtapaEnfermedadMeta =
      const VerificationMeta('idEtapaEnfermedad');
  @override
  late final GeneratedColumn<int> idEtapaEnfermedad = GeneratedColumn<int>(
      'id_etapa_enfermedad', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _observacionesMeta =
      const VerificationMeta('observaciones');
  @override
  late final GeneratedColumn<String> observaciones = GeneratedColumn<String>(
      'observaciones', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idRegistroEnfermedad,
        fechaRegistro,
        horaRegistro,
        idPalma,
        nombreEnfermedad,
        idEtapaEnfermedad,
        observaciones,
        responsable,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'registro_enfermedad';
  @override
  String get actualTableName => 'registro_enfermedad';
  @override
  VerificationContext validateIntegrity(
      Insertable<RegistroEnfermedadData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_registro_enfermedad')) {
      context.handle(
          _idRegistroEnfermedadMeta,
          idRegistroEnfermedad.isAcceptableOrUnknown(
              data['id_registro_enfermedad']!, _idRegistroEnfermedadMeta));
    }
    if (data.containsKey('fecha_registro')) {
      context.handle(
          _fechaRegistroMeta,
          fechaRegistro.isAcceptableOrUnknown(
              data['fecha_registro']!, _fechaRegistroMeta));
    } else if (isInserting) {
      context.missing(_fechaRegistroMeta);
    }
    if (data.containsKey('hora_registro')) {
      context.handle(
          _horaRegistroMeta,
          horaRegistro.isAcceptableOrUnknown(
              data['hora_registro']!, _horaRegistroMeta));
    }
    if (data.containsKey('id_palma')) {
      context.handle(_idPalmaMeta,
          idPalma.isAcceptableOrUnknown(data['id_palma']!, _idPalmaMeta));
    } else if (isInserting) {
      context.missing(_idPalmaMeta);
    }
    if (data.containsKey('nombre_enfermedad')) {
      context.handle(
          _nombreEnfermedadMeta,
          nombreEnfermedad.isAcceptableOrUnknown(
              data['nombre_enfermedad']!, _nombreEnfermedadMeta));
    } else if (isInserting) {
      context.missing(_nombreEnfermedadMeta);
    }
    if (data.containsKey('id_etapa_enfermedad')) {
      context.handle(
          _idEtapaEnfermedadMeta,
          idEtapaEnfermedad.isAcceptableOrUnknown(
              data['id_etapa_enfermedad']!, _idEtapaEnfermedadMeta));
    }
    if (data.containsKey('observaciones')) {
      context.handle(
          _observacionesMeta,
          observaciones.isAcceptableOrUnknown(
              data['observaciones']!, _observacionesMeta));
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegistroEnfermedadData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegistroEnfermedadData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idRegistroEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_registro_enfermedad']),
      fechaRegistro: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_registro'])!,
      horaRegistro: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}hora_registro']),
      idPalma: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_palma'])!,
      nombreEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nombre_enfermedad'])!,
      idEtapaEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_etapa_enfermedad']),
      observaciones: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}observaciones']),
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $RegistroEnfermedadTable createAlias(String alias) {
    return $RegistroEnfermedadTable(attachedDatabase, alias);
  }
}

class RegistroEnfermedadData extends DataClass
    implements Insertable<RegistroEnfermedadData> {
  final int id;
  final int? idRegistroEnfermedad;
  final DateTime fechaRegistro;
  final DateTime? horaRegistro;
  final String idPalma;
  final String nombreEnfermedad;
  final int? idEtapaEnfermedad;
  final String? observaciones;
  final String responsable;
  final bool sincronizado;
  const RegistroEnfermedadData(
      {required this.id,
      this.idRegistroEnfermedad,
      required this.fechaRegistro,
      this.horaRegistro,
      required this.idPalma,
      required this.nombreEnfermedad,
      this.idEtapaEnfermedad,
      this.observaciones,
      required this.responsable,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idRegistroEnfermedad != null) {
      map['id_registro_enfermedad'] = Variable<int>(idRegistroEnfermedad);
    }
    map['fecha_registro'] = Variable<DateTime>(fechaRegistro);
    if (!nullToAbsent || horaRegistro != null) {
      map['hora_registro'] = Variable<DateTime>(horaRegistro);
    }
    map['id_palma'] = Variable<String>(idPalma);
    map['nombre_enfermedad'] = Variable<String>(nombreEnfermedad);
    if (!nullToAbsent || idEtapaEnfermedad != null) {
      map['id_etapa_enfermedad'] = Variable<int>(idEtapaEnfermedad);
    }
    if (!nullToAbsent || observaciones != null) {
      map['observaciones'] = Variable<String>(observaciones);
    }
    map['responsable'] = Variable<String>(responsable);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  RegistroEnfermedadCompanion toCompanion(bool nullToAbsent) {
    return RegistroEnfermedadCompanion(
      id: Value(id),
      idRegistroEnfermedad: idRegistroEnfermedad == null && nullToAbsent
          ? const Value.absent()
          : Value(idRegistroEnfermedad),
      fechaRegistro: Value(fechaRegistro),
      horaRegistro: horaRegistro == null && nullToAbsent
          ? const Value.absent()
          : Value(horaRegistro),
      idPalma: Value(idPalma),
      nombreEnfermedad: Value(nombreEnfermedad),
      idEtapaEnfermedad: idEtapaEnfermedad == null && nullToAbsent
          ? const Value.absent()
          : Value(idEtapaEnfermedad),
      observaciones: observaciones == null && nullToAbsent
          ? const Value.absent()
          : Value(observaciones),
      responsable: Value(responsable),
      sincronizado: Value(sincronizado),
    );
  }

  factory RegistroEnfermedadData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegistroEnfermedadData(
      id: serializer.fromJson<int>(json['id']),
      idRegistroEnfermedad:
          serializer.fromJson<int?>(json['idRegistroEnfermedad']),
      fechaRegistro: serializer.fromJson<DateTime>(json['fechaRegistro']),
      horaRegistro: serializer.fromJson<DateTime?>(json['horaRegistro']),
      idPalma: serializer.fromJson<String>(json['idPalma']),
      nombreEnfermedad: serializer.fromJson<String>(json['nombreEnfermedad']),
      idEtapaEnfermedad: serializer.fromJson<int?>(json['idEtapaEnfermedad']),
      observaciones: serializer.fromJson<String?>(json['observaciones']),
      responsable: serializer.fromJson<String>(json['responsable']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idRegistroEnfermedad': serializer.toJson<int?>(idRegistroEnfermedad),
      'fechaRegistro': serializer.toJson<DateTime>(fechaRegistro),
      'horaRegistro': serializer.toJson<DateTime?>(horaRegistro),
      'idPalma': serializer.toJson<String>(idPalma),
      'nombreEnfermedad': serializer.toJson<String>(nombreEnfermedad),
      'idEtapaEnfermedad': serializer.toJson<int?>(idEtapaEnfermedad),
      'observaciones': serializer.toJson<String?>(observaciones),
      'responsable': serializer.toJson<String>(responsable),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  RegistroEnfermedadData copyWith(
          {int? id,
          Value<int?> idRegistroEnfermedad = const Value.absent(),
          DateTime? fechaRegistro,
          Value<DateTime?> horaRegistro = const Value.absent(),
          String? idPalma,
          String? nombreEnfermedad,
          Value<int?> idEtapaEnfermedad = const Value.absent(),
          Value<String?> observaciones = const Value.absent(),
          String? responsable,
          bool? sincronizado}) =>
      RegistroEnfermedadData(
        id: id ?? this.id,
        idRegistroEnfermedad: idRegistroEnfermedad.present
            ? idRegistroEnfermedad.value
            : this.idRegistroEnfermedad,
        fechaRegistro: fechaRegistro ?? this.fechaRegistro,
        horaRegistro:
            horaRegistro.present ? horaRegistro.value : this.horaRegistro,
        idPalma: idPalma ?? this.idPalma,
        nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
        idEtapaEnfermedad: idEtapaEnfermedad.present
            ? idEtapaEnfermedad.value
            : this.idEtapaEnfermedad,
        observaciones:
            observaciones.present ? observaciones.value : this.observaciones,
        responsable: responsable ?? this.responsable,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('RegistroEnfermedadData(')
          ..write('id: $id, ')
          ..write('idRegistroEnfermedad: $idRegistroEnfermedad, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('horaRegistro: $horaRegistro, ')
          ..write('idPalma: $idPalma, ')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('idEtapaEnfermedad: $idEtapaEnfermedad, ')
          ..write('observaciones: $observaciones, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      idRegistroEnfermedad,
      fechaRegistro,
      horaRegistro,
      idPalma,
      nombreEnfermedad,
      idEtapaEnfermedad,
      observaciones,
      responsable,
      sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegistroEnfermedadData &&
          other.id == this.id &&
          other.idRegistroEnfermedad == this.idRegistroEnfermedad &&
          other.fechaRegistro == this.fechaRegistro &&
          other.horaRegistro == this.horaRegistro &&
          other.idPalma == this.idPalma &&
          other.nombreEnfermedad == this.nombreEnfermedad &&
          other.idEtapaEnfermedad == this.idEtapaEnfermedad &&
          other.observaciones == this.observaciones &&
          other.responsable == this.responsable &&
          other.sincronizado == this.sincronizado);
}

class RegistroEnfermedadCompanion
    extends UpdateCompanion<RegistroEnfermedadData> {
  final Value<int> id;
  final Value<int?> idRegistroEnfermedad;
  final Value<DateTime> fechaRegistro;
  final Value<DateTime?> horaRegistro;
  final Value<String> idPalma;
  final Value<String> nombreEnfermedad;
  final Value<int?> idEtapaEnfermedad;
  final Value<String?> observaciones;
  final Value<String> responsable;
  final Value<bool> sincronizado;
  const RegistroEnfermedadCompanion({
    this.id = const Value.absent(),
    this.idRegistroEnfermedad = const Value.absent(),
    this.fechaRegistro = const Value.absent(),
    this.horaRegistro = const Value.absent(),
    this.idPalma = const Value.absent(),
    this.nombreEnfermedad = const Value.absent(),
    this.idEtapaEnfermedad = const Value.absent(),
    this.observaciones = const Value.absent(),
    this.responsable = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  RegistroEnfermedadCompanion.insert({
    this.id = const Value.absent(),
    this.idRegistroEnfermedad = const Value.absent(),
    required DateTime fechaRegistro,
    this.horaRegistro = const Value.absent(),
    required String idPalma,
    required String nombreEnfermedad,
    this.idEtapaEnfermedad = const Value.absent(),
    this.observaciones = const Value.absent(),
    required String responsable,
    this.sincronizado = const Value.absent(),
  })  : fechaRegistro = Value(fechaRegistro),
        idPalma = Value(idPalma),
        nombreEnfermedad = Value(nombreEnfermedad),
        responsable = Value(responsable);
  static Insertable<RegistroEnfermedadData> custom({
    Expression<int>? id,
    Expression<int>? idRegistroEnfermedad,
    Expression<DateTime>? fechaRegistro,
    Expression<DateTime>? horaRegistro,
    Expression<String>? idPalma,
    Expression<String>? nombreEnfermedad,
    Expression<int>? idEtapaEnfermedad,
    Expression<String>? observaciones,
    Expression<String>? responsable,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idRegistroEnfermedad != null)
        'id_registro_enfermedad': idRegistroEnfermedad,
      if (fechaRegistro != null) 'fecha_registro': fechaRegistro,
      if (horaRegistro != null) 'hora_registro': horaRegistro,
      if (idPalma != null) 'id_palma': idPalma,
      if (nombreEnfermedad != null) 'nombre_enfermedad': nombreEnfermedad,
      if (idEtapaEnfermedad != null) 'id_etapa_enfermedad': idEtapaEnfermedad,
      if (observaciones != null) 'observaciones': observaciones,
      if (responsable != null) 'responsable': responsable,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  RegistroEnfermedadCompanion copyWith(
      {Value<int>? id,
      Value<int?>? idRegistroEnfermedad,
      Value<DateTime>? fechaRegistro,
      Value<DateTime?>? horaRegistro,
      Value<String>? idPalma,
      Value<String>? nombreEnfermedad,
      Value<int?>? idEtapaEnfermedad,
      Value<String?>? observaciones,
      Value<String>? responsable,
      Value<bool>? sincronizado}) {
    return RegistroEnfermedadCompanion(
      id: id ?? this.id,
      idRegistroEnfermedad: idRegistroEnfermedad ?? this.idRegistroEnfermedad,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
      horaRegistro: horaRegistro ?? this.horaRegistro,
      idPalma: idPalma ?? this.idPalma,
      nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
      idEtapaEnfermedad: idEtapaEnfermedad ?? this.idEtapaEnfermedad,
      observaciones: observaciones ?? this.observaciones,
      responsable: responsable ?? this.responsable,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idRegistroEnfermedad.present) {
      map['id_registro_enfermedad'] = Variable<int>(idRegistroEnfermedad.value);
    }
    if (fechaRegistro.present) {
      map['fecha_registro'] = Variable<DateTime>(fechaRegistro.value);
    }
    if (horaRegistro.present) {
      map['hora_registro'] = Variable<DateTime>(horaRegistro.value);
    }
    if (idPalma.present) {
      map['id_palma'] = Variable<String>(idPalma.value);
    }
    if (nombreEnfermedad.present) {
      map['nombre_enfermedad'] = Variable<String>(nombreEnfermedad.value);
    }
    if (idEtapaEnfermedad.present) {
      map['id_etapa_enfermedad'] = Variable<int>(idEtapaEnfermedad.value);
    }
    if (observaciones.present) {
      map['observaciones'] = Variable<String>(observaciones.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegistroEnfermedadCompanion(')
          ..write('id: $id, ')
          ..write('idRegistroEnfermedad: $idRegistroEnfermedad, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('horaRegistro: $horaRegistro, ')
          ..write('idPalma: $idPalma, ')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('idEtapaEnfermedad: $idEtapaEnfermedad, ')
          ..write('observaciones: $observaciones, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $ImagenRegistroEnfermedadTable extends ImagenRegistroEnfermedad
    with
        TableInfo<$ImagenRegistroEnfermedadTable,
            ImagenRegistroEnfermedadData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImagenRegistroEnfermedadTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idImagenRegistroEnfermedadMeta =
      const VerificationMeta('idImagenRegistroEnfermedad');
  @override
  late final GeneratedColumn<int> idImagenRegistroEnfermedad =
      GeneratedColumn<int>(
          'id_imagen_registro_enfermedad', aliasedName, false,
          hasAutoIncrement: true,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultConstraints:
              GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idEnfermedadMeta =
      const VerificationMeta('idEnfermedad');
  @override
  late final GeneratedColumn<int> idEnfermedad = GeneratedColumn<int>(
      'id_enfermedad', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imagenMeta = const VerificationMeta('imagen');
  @override
  late final GeneratedColumn<Uint8List> imagen = GeneratedColumn<Uint8List>(
      'imagen', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [idImagenRegistroEnfermedad, idEnfermedad, imagen, sincronizado];
  @override
  String get aliasedName => _alias ?? 'imagen_registro_enfermedad';
  @override
  String get actualTableName => 'imagen_registro_enfermedad';
  @override
  VerificationContext validateIntegrity(
      Insertable<ImagenRegistroEnfermedadData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_imagen_registro_enfermedad')) {
      context.handle(
          _idImagenRegistroEnfermedadMeta,
          idImagenRegistroEnfermedad.isAcceptableOrUnknown(
              data['id_imagen_registro_enfermedad']!,
              _idImagenRegistroEnfermedadMeta));
    }
    if (data.containsKey('id_enfermedad')) {
      context.handle(
          _idEnfermedadMeta,
          idEnfermedad.isAcceptableOrUnknown(
              data['id_enfermedad']!, _idEnfermedadMeta));
    } else if (isInserting) {
      context.missing(_idEnfermedadMeta);
    }
    if (data.containsKey('imagen')) {
      context.handle(_imagenMeta,
          imagen.isAcceptableOrUnknown(data['imagen']!, _imagenMeta));
    } else if (isInserting) {
      context.missing(_imagenMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idImagenRegistroEnfermedad};
  @override
  ImagenRegistroEnfermedadData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImagenRegistroEnfermedadData(
      idImagenRegistroEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}id_imagen_registro_enfermedad'])!,
      idEnfermedad: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_enfermedad'])!,
      imagen: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}imagen'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $ImagenRegistroEnfermedadTable createAlias(String alias) {
    return $ImagenRegistroEnfermedadTable(attachedDatabase, alias);
  }
}

class ImagenRegistroEnfermedadData extends DataClass
    implements Insertable<ImagenRegistroEnfermedadData> {
  final int idImagenRegistroEnfermedad;
  final int idEnfermedad;
  final Uint8List imagen;
  final bool sincronizado;
  const ImagenRegistroEnfermedadData(
      {required this.idImagenRegistroEnfermedad,
      required this.idEnfermedad,
      required this.imagen,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_imagen_registro_enfermedad'] =
        Variable<int>(idImagenRegistroEnfermedad);
    map['id_enfermedad'] = Variable<int>(idEnfermedad);
    map['imagen'] = Variable<Uint8List>(imagen);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  ImagenRegistroEnfermedadCompanion toCompanion(bool nullToAbsent) {
    return ImagenRegistroEnfermedadCompanion(
      idImagenRegistroEnfermedad: Value(idImagenRegistroEnfermedad),
      idEnfermedad: Value(idEnfermedad),
      imagen: Value(imagen),
      sincronizado: Value(sincronizado),
    );
  }

  factory ImagenRegistroEnfermedadData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImagenRegistroEnfermedadData(
      idImagenRegistroEnfermedad:
          serializer.fromJson<int>(json['idImagenRegistroEnfermedad']),
      idEnfermedad: serializer.fromJson<int>(json['idEnfermedad']),
      imagen: serializer.fromJson<Uint8List>(json['imagen']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idImagenRegistroEnfermedad':
          serializer.toJson<int>(idImagenRegistroEnfermedad),
      'idEnfermedad': serializer.toJson<int>(idEnfermedad),
      'imagen': serializer.toJson<Uint8List>(imagen),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  ImagenRegistroEnfermedadData copyWith(
          {int? idImagenRegistroEnfermedad,
          int? idEnfermedad,
          Uint8List? imagen,
          bool? sincronizado}) =>
      ImagenRegistroEnfermedadData(
        idImagenRegistroEnfermedad:
            idImagenRegistroEnfermedad ?? this.idImagenRegistroEnfermedad,
        idEnfermedad: idEnfermedad ?? this.idEnfermedad,
        imagen: imagen ?? this.imagen,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('ImagenRegistroEnfermedadData(')
          ..write('idImagenRegistroEnfermedad: $idImagenRegistroEnfermedad, ')
          ..write('idEnfermedad: $idEnfermedad, ')
          ..write('imagen: $imagen, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idImagenRegistroEnfermedad, idEnfermedad,
      $driftBlobEquality.hash(imagen), sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImagenRegistroEnfermedadData &&
          other.idImagenRegistroEnfermedad == this.idImagenRegistroEnfermedad &&
          other.idEnfermedad == this.idEnfermedad &&
          $driftBlobEquality.equals(other.imagen, this.imagen) &&
          other.sincronizado == this.sincronizado);
}

class ImagenRegistroEnfermedadCompanion
    extends UpdateCompanion<ImagenRegistroEnfermedadData> {
  final Value<int> idImagenRegistroEnfermedad;
  final Value<int> idEnfermedad;
  final Value<Uint8List> imagen;
  final Value<bool> sincronizado;
  const ImagenRegistroEnfermedadCompanion({
    this.idImagenRegistroEnfermedad = const Value.absent(),
    this.idEnfermedad = const Value.absent(),
    this.imagen = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  ImagenRegistroEnfermedadCompanion.insert({
    this.idImagenRegistroEnfermedad = const Value.absent(),
    required int idEnfermedad,
    required Uint8List imagen,
    this.sincronizado = const Value.absent(),
  })  : idEnfermedad = Value(idEnfermedad),
        imagen = Value(imagen);
  static Insertable<ImagenRegistroEnfermedadData> custom({
    Expression<int>? idImagenRegistroEnfermedad,
    Expression<int>? idEnfermedad,
    Expression<Uint8List>? imagen,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (idImagenRegistroEnfermedad != null)
        'id_imagen_registro_enfermedad': idImagenRegistroEnfermedad,
      if (idEnfermedad != null) 'id_enfermedad': idEnfermedad,
      if (imagen != null) 'imagen': imagen,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  ImagenRegistroEnfermedadCompanion copyWith(
      {Value<int>? idImagenRegistroEnfermedad,
      Value<int>? idEnfermedad,
      Value<Uint8List>? imagen,
      Value<bool>? sincronizado}) {
    return ImagenRegistroEnfermedadCompanion(
      idImagenRegistroEnfermedad:
          idImagenRegistroEnfermedad ?? this.idImagenRegistroEnfermedad,
      idEnfermedad: idEnfermedad ?? this.idEnfermedad,
      imagen: imagen ?? this.imagen,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idImagenRegistroEnfermedad.present) {
      map['id_imagen_registro_enfermedad'] =
          Variable<int>(idImagenRegistroEnfermedad.value);
    }
    if (idEnfermedad.present) {
      map['id_enfermedad'] = Variable<int>(idEnfermedad.value);
    }
    if (imagen.present) {
      map['imagen'] = Variable<Uint8List>(imagen.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagenRegistroEnfermedadCompanion(')
          ..write('idImagenRegistroEnfermedad: $idImagenRegistroEnfermedad, ')
          ..write('idEnfermedad: $idEnfermedad, ')
          ..write('imagen: $imagen, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $RegistroTratamientoTable extends RegistroTratamiento
    with TableInfo<$RegistroTratamientoTable, RegistroTratamientoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegistroTratamientoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idRegistroEnfermedadMeta =
      const VerificationMeta('idRegistroEnfermedad');
  @override
  late final GeneratedColumn<int> idRegistroEnfermedad = GeneratedColumn<int>(
      'id_registro_enfermedad', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES registro_enfermedad(id)');
  static const VerificationMeta _idProductoAgroquimicoMeta =
      const VerificationMeta('idProductoAgroquimico');
  @override
  late final GeneratedColumn<int> idProductoAgroquimico = GeneratedColumn<int>(
      'id_producto_agroquimico', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES producto_agroquimico(id)');
  static const VerificationMeta _tipoControlMeta =
      const VerificationMeta('tipoControl');
  @override
  late final GeneratedColumn<String> tipoControl = GeneratedColumn<String>(
      'tipo_control', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dosisMeta = const VerificationMeta('dosis');
  @override
  late final GeneratedColumn<double> dosis = GeneratedColumn<double>(
      'dosis', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descripcionProcedimientoMeta =
      const VerificationMeta('descripcionProcedimiento');
  @override
  late final GeneratedColumn<String> descripcionProcedimiento =
      GeneratedColumn<String>('descripcion_procedimiento', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fechaRegistroMeta =
      const VerificationMeta('fechaRegistro');
  @override
  late final GeneratedColumn<DateTime> fechaRegistro =
      GeneratedColumn<DateTime>('fecha_registro', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _unidadesMeta =
      const VerificationMeta('unidades');
  @override
  late final GeneratedColumn<String> unidades = GeneratedColumn<String>(
      'unidades', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idRegistroEnfermedad,
        idProductoAgroquimico,
        tipoControl,
        dosis,
        descripcionProcedimiento,
        fechaRegistro,
        unidades,
        responsable,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'registro_tratamiento';
  @override
  String get actualTableName => 'registro_tratamiento';
  @override
  VerificationContext validateIntegrity(
      Insertable<RegistroTratamientoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_registro_enfermedad')) {
      context.handle(
          _idRegistroEnfermedadMeta,
          idRegistroEnfermedad.isAcceptableOrUnknown(
              data['id_registro_enfermedad']!, _idRegistroEnfermedadMeta));
    } else if (isInserting) {
      context.missing(_idRegistroEnfermedadMeta);
    }
    if (data.containsKey('id_producto_agroquimico')) {
      context.handle(
          _idProductoAgroquimicoMeta,
          idProductoAgroquimico.isAcceptableOrUnknown(
              data['id_producto_agroquimico']!, _idProductoAgroquimicoMeta));
    } else if (isInserting) {
      context.missing(_idProductoAgroquimicoMeta);
    }
    if (data.containsKey('tipo_control')) {
      context.handle(
          _tipoControlMeta,
          tipoControl.isAcceptableOrUnknown(
              data['tipo_control']!, _tipoControlMeta));
    } else if (isInserting) {
      context.missing(_tipoControlMeta);
    }
    if (data.containsKey('dosis')) {
      context.handle(
          _dosisMeta, dosis.isAcceptableOrUnknown(data['dosis']!, _dosisMeta));
    } else if (isInserting) {
      context.missing(_dosisMeta);
    }
    if (data.containsKey('descripcion_procedimiento')) {
      context.handle(
          _descripcionProcedimientoMeta,
          descripcionProcedimiento.isAcceptableOrUnknown(
              data['descripcion_procedimiento']!,
              _descripcionProcedimientoMeta));
    }
    if (data.containsKey('fecha_registro')) {
      context.handle(
          _fechaRegistroMeta,
          fechaRegistro.isAcceptableOrUnknown(
              data['fecha_registro']!, _fechaRegistroMeta));
    } else if (isInserting) {
      context.missing(_fechaRegistroMeta);
    }
    if (data.containsKey('unidades')) {
      context.handle(_unidadesMeta,
          unidades.isAcceptableOrUnknown(data['unidades']!, _unidadesMeta));
    } else if (isInserting) {
      context.missing(_unidadesMeta);
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegistroTratamientoData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegistroTratamientoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idRegistroEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_registro_enfermedad'])!,
      idProductoAgroquimico: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_producto_agroquimico'])!,
      tipoControl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo_control'])!,
      dosis: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dosis'])!,
      descripcionProcedimiento: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}descripcion_procedimiento']),
      fechaRegistro: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_registro'])!,
      unidades: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unidades'])!,
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $RegistroTratamientoTable createAlias(String alias) {
    return $RegistroTratamientoTable(attachedDatabase, alias);
  }
}

class RegistroTratamientoData extends DataClass
    implements Insertable<RegistroTratamientoData> {
  final int id;
  final int idRegistroEnfermedad;
  final int idProductoAgroquimico;
  final String tipoControl;
  final double dosis;
  final String? descripcionProcedimiento;
  final DateTime fechaRegistro;
  final String unidades;
  final String responsable;
  final bool sincronizado;
  const RegistroTratamientoData(
      {required this.id,
      required this.idRegistroEnfermedad,
      required this.idProductoAgroquimico,
      required this.tipoControl,
      required this.dosis,
      this.descripcionProcedimiento,
      required this.fechaRegistro,
      required this.unidades,
      required this.responsable,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_registro_enfermedad'] = Variable<int>(idRegistroEnfermedad);
    map['id_producto_agroquimico'] = Variable<int>(idProductoAgroquimico);
    map['tipo_control'] = Variable<String>(tipoControl);
    map['dosis'] = Variable<double>(dosis);
    if (!nullToAbsent || descripcionProcedimiento != null) {
      map['descripcion_procedimiento'] =
          Variable<String>(descripcionProcedimiento);
    }
    map['fecha_registro'] = Variable<DateTime>(fechaRegistro);
    map['unidades'] = Variable<String>(unidades);
    map['responsable'] = Variable<String>(responsable);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  RegistroTratamientoCompanion toCompanion(bool nullToAbsent) {
    return RegistroTratamientoCompanion(
      id: Value(id),
      idRegistroEnfermedad: Value(idRegistroEnfermedad),
      idProductoAgroquimico: Value(idProductoAgroquimico),
      tipoControl: Value(tipoControl),
      dosis: Value(dosis),
      descripcionProcedimiento: descripcionProcedimiento == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcionProcedimiento),
      fechaRegistro: Value(fechaRegistro),
      unidades: Value(unidades),
      responsable: Value(responsable),
      sincronizado: Value(sincronizado),
    );
  }

  factory RegistroTratamientoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegistroTratamientoData(
      id: serializer.fromJson<int>(json['id']),
      idRegistroEnfermedad:
          serializer.fromJson<int>(json['idRegistroEnfermedad']),
      idProductoAgroquimico:
          serializer.fromJson<int>(json['idProductoAgroquimico']),
      tipoControl: serializer.fromJson<String>(json['tipoControl']),
      dosis: serializer.fromJson<double>(json['dosis']),
      descripcionProcedimiento:
          serializer.fromJson<String?>(json['descripcionProcedimiento']),
      fechaRegistro: serializer.fromJson<DateTime>(json['fechaRegistro']),
      unidades: serializer.fromJson<String>(json['unidades']),
      responsable: serializer.fromJson<String>(json['responsable']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idRegistroEnfermedad': serializer.toJson<int>(idRegistroEnfermedad),
      'idProductoAgroquimico': serializer.toJson<int>(idProductoAgroquimico),
      'tipoControl': serializer.toJson<String>(tipoControl),
      'dosis': serializer.toJson<double>(dosis),
      'descripcionProcedimiento':
          serializer.toJson<String?>(descripcionProcedimiento),
      'fechaRegistro': serializer.toJson<DateTime>(fechaRegistro),
      'unidades': serializer.toJson<String>(unidades),
      'responsable': serializer.toJson<String>(responsable),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  RegistroTratamientoData copyWith(
          {int? id,
          int? idRegistroEnfermedad,
          int? idProductoAgroquimico,
          String? tipoControl,
          double? dosis,
          Value<String?> descripcionProcedimiento = const Value.absent(),
          DateTime? fechaRegistro,
          String? unidades,
          String? responsable,
          bool? sincronizado}) =>
      RegistroTratamientoData(
        id: id ?? this.id,
        idRegistroEnfermedad: idRegistroEnfermedad ?? this.idRegistroEnfermedad,
        idProductoAgroquimico:
            idProductoAgroquimico ?? this.idProductoAgroquimico,
        tipoControl: tipoControl ?? this.tipoControl,
        dosis: dosis ?? this.dosis,
        descripcionProcedimiento: descripcionProcedimiento.present
            ? descripcionProcedimiento.value
            : this.descripcionProcedimiento,
        fechaRegistro: fechaRegistro ?? this.fechaRegistro,
        unidades: unidades ?? this.unidades,
        responsable: responsable ?? this.responsable,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('RegistroTratamientoData(')
          ..write('id: $id, ')
          ..write('idRegistroEnfermedad: $idRegistroEnfermedad, ')
          ..write('idProductoAgroquimico: $idProductoAgroquimico, ')
          ..write('tipoControl: $tipoControl, ')
          ..write('dosis: $dosis, ')
          ..write('descripcionProcedimiento: $descripcionProcedimiento, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('unidades: $unidades, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      idRegistroEnfermedad,
      idProductoAgroquimico,
      tipoControl,
      dosis,
      descripcionProcedimiento,
      fechaRegistro,
      unidades,
      responsable,
      sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegistroTratamientoData &&
          other.id == this.id &&
          other.idRegistroEnfermedad == this.idRegistroEnfermedad &&
          other.idProductoAgroquimico == this.idProductoAgroquimico &&
          other.tipoControl == this.tipoControl &&
          other.dosis == this.dosis &&
          other.descripcionProcedimiento == this.descripcionProcedimiento &&
          other.fechaRegistro == this.fechaRegistro &&
          other.unidades == this.unidades &&
          other.responsable == this.responsable &&
          other.sincronizado == this.sincronizado);
}

class RegistroTratamientoCompanion
    extends UpdateCompanion<RegistroTratamientoData> {
  final Value<int> id;
  final Value<int> idRegistroEnfermedad;
  final Value<int> idProductoAgroquimico;
  final Value<String> tipoControl;
  final Value<double> dosis;
  final Value<String?> descripcionProcedimiento;
  final Value<DateTime> fechaRegistro;
  final Value<String> unidades;
  final Value<String> responsable;
  final Value<bool> sincronizado;
  const RegistroTratamientoCompanion({
    this.id = const Value.absent(),
    this.idRegistroEnfermedad = const Value.absent(),
    this.idProductoAgroquimico = const Value.absent(),
    this.tipoControl = const Value.absent(),
    this.dosis = const Value.absent(),
    this.descripcionProcedimiento = const Value.absent(),
    this.fechaRegistro = const Value.absent(),
    this.unidades = const Value.absent(),
    this.responsable = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  RegistroTratamientoCompanion.insert({
    this.id = const Value.absent(),
    required int idRegistroEnfermedad,
    required int idProductoAgroquimico,
    required String tipoControl,
    required double dosis,
    this.descripcionProcedimiento = const Value.absent(),
    required DateTime fechaRegistro,
    required String unidades,
    required String responsable,
    this.sincronizado = const Value.absent(),
  })  : idRegistroEnfermedad = Value(idRegistroEnfermedad),
        idProductoAgroquimico = Value(idProductoAgroquimico),
        tipoControl = Value(tipoControl),
        dosis = Value(dosis),
        fechaRegistro = Value(fechaRegistro),
        unidades = Value(unidades),
        responsable = Value(responsable);
  static Insertable<RegistroTratamientoData> custom({
    Expression<int>? id,
    Expression<int>? idRegistroEnfermedad,
    Expression<int>? idProductoAgroquimico,
    Expression<String>? tipoControl,
    Expression<double>? dosis,
    Expression<String>? descripcionProcedimiento,
    Expression<DateTime>? fechaRegistro,
    Expression<String>? unidades,
    Expression<String>? responsable,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idRegistroEnfermedad != null)
        'id_registro_enfermedad': idRegistroEnfermedad,
      if (idProductoAgroquimico != null)
        'id_producto_agroquimico': idProductoAgroquimico,
      if (tipoControl != null) 'tipo_control': tipoControl,
      if (dosis != null) 'dosis': dosis,
      if (descripcionProcedimiento != null)
        'descripcion_procedimiento': descripcionProcedimiento,
      if (fechaRegistro != null) 'fecha_registro': fechaRegistro,
      if (unidades != null) 'unidades': unidades,
      if (responsable != null) 'responsable': responsable,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  RegistroTratamientoCompanion copyWith(
      {Value<int>? id,
      Value<int>? idRegistroEnfermedad,
      Value<int>? idProductoAgroquimico,
      Value<String>? tipoControl,
      Value<double>? dosis,
      Value<String?>? descripcionProcedimiento,
      Value<DateTime>? fechaRegistro,
      Value<String>? unidades,
      Value<String>? responsable,
      Value<bool>? sincronizado}) {
    return RegistroTratamientoCompanion(
      id: id ?? this.id,
      idRegistroEnfermedad: idRegistroEnfermedad ?? this.idRegistroEnfermedad,
      idProductoAgroquimico:
          idProductoAgroquimico ?? this.idProductoAgroquimico,
      tipoControl: tipoControl ?? this.tipoControl,
      dosis: dosis ?? this.dosis,
      descripcionProcedimiento:
          descripcionProcedimiento ?? this.descripcionProcedimiento,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
      unidades: unidades ?? this.unidades,
      responsable: responsable ?? this.responsable,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idRegistroEnfermedad.present) {
      map['id_registro_enfermedad'] = Variable<int>(idRegistroEnfermedad.value);
    }
    if (idProductoAgroquimico.present) {
      map['id_producto_agroquimico'] =
          Variable<int>(idProductoAgroquimico.value);
    }
    if (tipoControl.present) {
      map['tipo_control'] = Variable<String>(tipoControl.value);
    }
    if (dosis.present) {
      map['dosis'] = Variable<double>(dosis.value);
    }
    if (descripcionProcedimiento.present) {
      map['descripcion_procedimiento'] =
          Variable<String>(descripcionProcedimiento.value);
    }
    if (fechaRegistro.present) {
      map['fecha_registro'] = Variable<DateTime>(fechaRegistro.value);
    }
    if (unidades.present) {
      map['unidades'] = Variable<String>(unidades.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegistroTratamientoCompanion(')
          ..write('id: $id, ')
          ..write('idRegistroEnfermedad: $idRegistroEnfermedad, ')
          ..write('idProductoAgroquimico: $idProductoAgroquimico, ')
          ..write('tipoControl: $tipoControl, ')
          ..write('dosis: $dosis, ')
          ..write('descripcionProcedimiento: $descripcionProcedimiento, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('unidades: $unidades, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $ViajesTable extends Viajes with TableInfo<$ViajesTable, Viaje> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ViajesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idViajeMeta =
      const VerificationMeta('idViaje');
  @override
  late final GeneratedColumn<int> idViaje = GeneratedColumn<int>(
      'id_viaje', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _horaCargueMeta =
      const VerificationMeta('horaCargue');
  @override
  late final GeneratedColumn<DateTime> horaCargue = GeneratedColumn<DateTime>(
      'hora_cargue', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _horaSalidaMeta =
      const VerificationMeta('horaSalida');
  @override
  late final GeneratedColumn<DateTime> horaSalida = GeneratedColumn<DateTime>(
      'hora_salida', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cantidadRacimosMeta =
      const VerificationMeta('cantidadRacimos');
  @override
  late final GeneratedColumn<int> cantidadRacimos = GeneratedColumn<int>(
      'cantidad_racimos', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kilosMeta = const VerificationMeta('kilos');
  @override
  late final GeneratedColumn<int> kilos = GeneratedColumn<int>(
      'kilos', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _kilosExtractoraMeta =
      const VerificationMeta('kilosExtractora');
  @override
  late final GeneratedColumn<double> kilosExtractora = GeneratedColumn<double>(
      'kilos_extractora', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _completadoMeta =
      const VerificationMeta('completado');
  @override
  late final GeneratedColumn<bool> completado =
      GeneratedColumn<bool>('completado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("completado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idViaje,
        horaCargue,
        horaSalida,
        cantidadRacimos,
        kilos,
        kilosExtractora,
        completado,
        responsable,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'viajes';
  @override
  String get actualTableName => 'viajes';
  @override
  VerificationContext validateIntegrity(Insertable<Viaje> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_viaje')) {
      context.handle(_idViajeMeta,
          idViaje.isAcceptableOrUnknown(data['id_viaje']!, _idViajeMeta));
    }
    if (data.containsKey('hora_cargue')) {
      context.handle(
          _horaCargueMeta,
          horaCargue.isAcceptableOrUnknown(
              data['hora_cargue']!, _horaCargueMeta));
    } else if (isInserting) {
      context.missing(_horaCargueMeta);
    }
    if (data.containsKey('hora_salida')) {
      context.handle(
          _horaSalidaMeta,
          horaSalida.isAcceptableOrUnknown(
              data['hora_salida']!, _horaSalidaMeta));
    }
    if (data.containsKey('cantidad_racimos')) {
      context.handle(
          _cantidadRacimosMeta,
          cantidadRacimos.isAcceptableOrUnknown(
              data['cantidad_racimos']!, _cantidadRacimosMeta));
    } else if (isInserting) {
      context.missing(_cantidadRacimosMeta);
    }
    if (data.containsKey('kilos')) {
      context.handle(
          _kilosMeta, kilos.isAcceptableOrUnknown(data['kilos']!, _kilosMeta));
    }
    if (data.containsKey('kilos_extractora')) {
      context.handle(
          _kilosExtractoraMeta,
          kilosExtractora.isAcceptableOrUnknown(
              data['kilos_extractora']!, _kilosExtractoraMeta));
    }
    if (data.containsKey('completado')) {
      context.handle(
          _completadoMeta,
          completado.isAcceptableOrUnknown(
              data['completado']!, _completadoMeta));
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Viaje map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Viaje(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idViaje: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_viaje']),
      horaCargue: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}hora_cargue'])!,
      horaSalida: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}hora_salida']),
      cantidadRacimos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad_racimos'])!,
      kilos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kilos']),
      kilosExtractora: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}kilos_extractora']),
      completado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completado'])!,
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $ViajesTable createAlias(String alias) {
    return $ViajesTable(attachedDatabase, alias);
  }
}

class Viaje extends DataClass implements Insertable<Viaje> {
  final int id;
  final int? idViaje;
  final DateTime horaCargue;
  final DateTime? horaSalida;
  final int cantidadRacimos;
  final int? kilos;
  final double? kilosExtractora;
  final bool completado;
  final String responsable;
  final bool sincronizado;
  const Viaje(
      {required this.id,
      this.idViaje,
      required this.horaCargue,
      this.horaSalida,
      required this.cantidadRacimos,
      this.kilos,
      this.kilosExtractora,
      required this.completado,
      required this.responsable,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idViaje != null) {
      map['id_viaje'] = Variable<int>(idViaje);
    }
    map['hora_cargue'] = Variable<DateTime>(horaCargue);
    if (!nullToAbsent || horaSalida != null) {
      map['hora_salida'] = Variable<DateTime>(horaSalida);
    }
    map['cantidad_racimos'] = Variable<int>(cantidadRacimos);
    if (!nullToAbsent || kilos != null) {
      map['kilos'] = Variable<int>(kilos);
    }
    if (!nullToAbsent || kilosExtractora != null) {
      map['kilos_extractora'] = Variable<double>(kilosExtractora);
    }
    map['completado'] = Variable<bool>(completado);
    map['responsable'] = Variable<String>(responsable);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  ViajesCompanion toCompanion(bool nullToAbsent) {
    return ViajesCompanion(
      id: Value(id),
      idViaje: idViaje == null && nullToAbsent
          ? const Value.absent()
          : Value(idViaje),
      horaCargue: Value(horaCargue),
      horaSalida: horaSalida == null && nullToAbsent
          ? const Value.absent()
          : Value(horaSalida),
      cantidadRacimos: Value(cantidadRacimos),
      kilos:
          kilos == null && nullToAbsent ? const Value.absent() : Value(kilos),
      kilosExtractora: kilosExtractora == null && nullToAbsent
          ? const Value.absent()
          : Value(kilosExtractora),
      completado: Value(completado),
      responsable: Value(responsable),
      sincronizado: Value(sincronizado),
    );
  }

  factory Viaje.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Viaje(
      id: serializer.fromJson<int>(json['id']),
      idViaje: serializer.fromJson<int?>(json['idViaje']),
      horaCargue: serializer.fromJson<DateTime>(json['horaCargue']),
      horaSalida: serializer.fromJson<DateTime?>(json['horaSalida']),
      cantidadRacimos: serializer.fromJson<int>(json['cantidadRacimos']),
      kilos: serializer.fromJson<int?>(json['kilos']),
      kilosExtractora: serializer.fromJson<double?>(json['kilosExtractora']),
      completado: serializer.fromJson<bool>(json['completado']),
      responsable: serializer.fromJson<String>(json['responsable']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idViaje': serializer.toJson<int?>(idViaje),
      'horaCargue': serializer.toJson<DateTime>(horaCargue),
      'horaSalida': serializer.toJson<DateTime?>(horaSalida),
      'cantidadRacimos': serializer.toJson<int>(cantidadRacimos),
      'kilos': serializer.toJson<int?>(kilos),
      'kilosExtractora': serializer.toJson<double?>(kilosExtractora),
      'completado': serializer.toJson<bool>(completado),
      'responsable': serializer.toJson<String>(responsable),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  Viaje copyWith(
          {int? id,
          Value<int?> idViaje = const Value.absent(),
          DateTime? horaCargue,
          Value<DateTime?> horaSalida = const Value.absent(),
          int? cantidadRacimos,
          Value<int?> kilos = const Value.absent(),
          Value<double?> kilosExtractora = const Value.absent(),
          bool? completado,
          String? responsable,
          bool? sincronizado}) =>
      Viaje(
        id: id ?? this.id,
        idViaje: idViaje.present ? idViaje.value : this.idViaje,
        horaCargue: horaCargue ?? this.horaCargue,
        horaSalida: horaSalida.present ? horaSalida.value : this.horaSalida,
        cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
        kilos: kilos.present ? kilos.value : this.kilos,
        kilosExtractora: kilosExtractora.present
            ? kilosExtractora.value
            : this.kilosExtractora,
        completado: completado ?? this.completado,
        responsable: responsable ?? this.responsable,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('Viaje(')
          ..write('id: $id, ')
          ..write('idViaje: $idViaje, ')
          ..write('horaCargue: $horaCargue, ')
          ..write('horaSalida: $horaSalida, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('kilos: $kilos, ')
          ..write('kilosExtractora: $kilosExtractora, ')
          ..write('completado: $completado, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      idViaje,
      horaCargue,
      horaSalida,
      cantidadRacimos,
      kilos,
      kilosExtractora,
      completado,
      responsable,
      sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Viaje &&
          other.id == this.id &&
          other.idViaje == this.idViaje &&
          other.horaCargue == this.horaCargue &&
          other.horaSalida == this.horaSalida &&
          other.cantidadRacimos == this.cantidadRacimos &&
          other.kilos == this.kilos &&
          other.kilosExtractora == this.kilosExtractora &&
          other.completado == this.completado &&
          other.responsable == this.responsable &&
          other.sincronizado == this.sincronizado);
}

class ViajesCompanion extends UpdateCompanion<Viaje> {
  final Value<int> id;
  final Value<int?> idViaje;
  final Value<DateTime> horaCargue;
  final Value<DateTime?> horaSalida;
  final Value<int> cantidadRacimos;
  final Value<int?> kilos;
  final Value<double?> kilosExtractora;
  final Value<bool> completado;
  final Value<String> responsable;
  final Value<bool> sincronizado;
  const ViajesCompanion({
    this.id = const Value.absent(),
    this.idViaje = const Value.absent(),
    this.horaCargue = const Value.absent(),
    this.horaSalida = const Value.absent(),
    this.cantidadRacimos = const Value.absent(),
    this.kilos = const Value.absent(),
    this.kilosExtractora = const Value.absent(),
    this.completado = const Value.absent(),
    this.responsable = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  ViajesCompanion.insert({
    this.id = const Value.absent(),
    this.idViaje = const Value.absent(),
    required DateTime horaCargue,
    this.horaSalida = const Value.absent(),
    required int cantidadRacimos,
    this.kilos = const Value.absent(),
    this.kilosExtractora = const Value.absent(),
    this.completado = const Value.absent(),
    required String responsable,
    this.sincronizado = const Value.absent(),
  })  : horaCargue = Value(horaCargue),
        cantidadRacimos = Value(cantidadRacimos),
        responsable = Value(responsable);
  static Insertable<Viaje> custom({
    Expression<int>? id,
    Expression<int>? idViaje,
    Expression<DateTime>? horaCargue,
    Expression<DateTime>? horaSalida,
    Expression<int>? cantidadRacimos,
    Expression<int>? kilos,
    Expression<double>? kilosExtractora,
    Expression<bool>? completado,
    Expression<String>? responsable,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idViaje != null) 'id_viaje': idViaje,
      if (horaCargue != null) 'hora_cargue': horaCargue,
      if (horaSalida != null) 'hora_salida': horaSalida,
      if (cantidadRacimos != null) 'cantidad_racimos': cantidadRacimos,
      if (kilos != null) 'kilos': kilos,
      if (kilosExtractora != null) 'kilos_extractora': kilosExtractora,
      if (completado != null) 'completado': completado,
      if (responsable != null) 'responsable': responsable,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  ViajesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? idViaje,
      Value<DateTime>? horaCargue,
      Value<DateTime?>? horaSalida,
      Value<int>? cantidadRacimos,
      Value<int?>? kilos,
      Value<double?>? kilosExtractora,
      Value<bool>? completado,
      Value<String>? responsable,
      Value<bool>? sincronizado}) {
    return ViajesCompanion(
      id: id ?? this.id,
      idViaje: idViaje ?? this.idViaje,
      horaCargue: horaCargue ?? this.horaCargue,
      horaSalida: horaSalida ?? this.horaSalida,
      cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
      kilos: kilos ?? this.kilos,
      kilosExtractora: kilosExtractora ?? this.kilosExtractora,
      completado: completado ?? this.completado,
      responsable: responsable ?? this.responsable,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idViaje.present) {
      map['id_viaje'] = Variable<int>(idViaje.value);
    }
    if (horaCargue.present) {
      map['hora_cargue'] = Variable<DateTime>(horaCargue.value);
    }
    if (horaSalida.present) {
      map['hora_salida'] = Variable<DateTime>(horaSalida.value);
    }
    if (cantidadRacimos.present) {
      map['cantidad_racimos'] = Variable<int>(cantidadRacimos.value);
    }
    if (kilos.present) {
      map['kilos'] = Variable<int>(kilos.value);
    }
    if (kilosExtractora.present) {
      map['kilos_extractora'] = Variable<double>(kilosExtractora.value);
    }
    if (completado.present) {
      map['completado'] = Variable<bool>(completado.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ViajesCompanion(')
          ..write('id: $id, ')
          ..write('idViaje: $idViaje, ')
          ..write('horaCargue: $horaCargue, ')
          ..write('horaSalida: $horaSalida, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('kilos: $kilos, ')
          ..write('kilosExtractora: $kilosExtractora, ')
          ..write('completado: $completado, ')
          ..write('responsable: $responsable, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $CensoEtapasPlagaTable extends CensoEtapasPlaga
    with TableInfo<$CensoEtapasPlagaTable, CensoEtapasPlagaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CensoEtapasPlagaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idCensoEtapasplagaMeta =
      const VerificationMeta('idCensoEtapasplaga');
  @override
  late final GeneratedColumn<int> idCensoEtapasplaga = GeneratedColumn<int>(
      'id_censo_etapasplaga', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idCensoMeta =
      const VerificationMeta('idCenso');
  @override
  late final GeneratedColumn<int> idCenso = GeneratedColumn<int>(
      'id_censo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idEtapasplagaMeta =
      const VerificationMeta('idEtapasplaga');
  @override
  late final GeneratedColumn<int> idEtapasplaga = GeneratedColumn<int>(
      'id_etapasplaga', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numeroIndividuosMeta =
      const VerificationMeta('numeroIndividuos');
  @override
  late final GeneratedColumn<int> numeroIndividuos = GeneratedColumn<int>(
      'numero_individuos', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        idCensoEtapasplaga,
        idCenso,
        idEtapasplaga,
        numeroIndividuos,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'censo_etapas_plaga';
  @override
  String get actualTableName => 'censo_etapas_plaga';
  @override
  VerificationContext validateIntegrity(
      Insertable<CensoEtapasPlagaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_censo_etapasplaga')) {
      context.handle(
          _idCensoEtapasplagaMeta,
          idCensoEtapasplaga.isAcceptableOrUnknown(
              data['id_censo_etapasplaga']!, _idCensoEtapasplagaMeta));
    }
    if (data.containsKey('id_censo')) {
      context.handle(_idCensoMeta,
          idCenso.isAcceptableOrUnknown(data['id_censo']!, _idCensoMeta));
    } else if (isInserting) {
      context.missing(_idCensoMeta);
    }
    if (data.containsKey('id_etapasplaga')) {
      context.handle(
          _idEtapasplagaMeta,
          idEtapasplaga.isAcceptableOrUnknown(
              data['id_etapasplaga']!, _idEtapasplagaMeta));
    } else if (isInserting) {
      context.missing(_idEtapasplagaMeta);
    }
    if (data.containsKey('numero_individuos')) {
      context.handle(
          _numeroIndividuosMeta,
          numeroIndividuos.isAcceptableOrUnknown(
              data['numero_individuos']!, _numeroIndividuosMeta));
    } else if (isInserting) {
      context.missing(_numeroIndividuosMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idCensoEtapasplaga};
  @override
  CensoEtapasPlagaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CensoEtapasPlagaData(
      idCensoEtapasplaga: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_censo_etapasplaga'])!,
      idCenso: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_censo'])!,
      idEtapasplaga: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_etapasplaga'])!,
      numeroIndividuos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}numero_individuos'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $CensoEtapasPlagaTable createAlias(String alias) {
    return $CensoEtapasPlagaTable(attachedDatabase, alias);
  }
}

class CensoEtapasPlagaData extends DataClass
    implements Insertable<CensoEtapasPlagaData> {
  final int idCensoEtapasplaga;
  final int idCenso;
  final int idEtapasplaga;
  final int numeroIndividuos;
  final bool sincronizado;
  const CensoEtapasPlagaData(
      {required this.idCensoEtapasplaga,
      required this.idCenso,
      required this.idEtapasplaga,
      required this.numeroIndividuos,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_censo_etapasplaga'] = Variable<int>(idCensoEtapasplaga);
    map['id_censo'] = Variable<int>(idCenso);
    map['id_etapasplaga'] = Variable<int>(idEtapasplaga);
    map['numero_individuos'] = Variable<int>(numeroIndividuos);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  CensoEtapasPlagaCompanion toCompanion(bool nullToAbsent) {
    return CensoEtapasPlagaCompanion(
      idCensoEtapasplaga: Value(idCensoEtapasplaga),
      idCenso: Value(idCenso),
      idEtapasplaga: Value(idEtapasplaga),
      numeroIndividuos: Value(numeroIndividuos),
      sincronizado: Value(sincronizado),
    );
  }

  factory CensoEtapasPlagaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CensoEtapasPlagaData(
      idCensoEtapasplaga: serializer.fromJson<int>(json['idCensoEtapasplaga']),
      idCenso: serializer.fromJson<int>(json['idCenso']),
      idEtapasplaga: serializer.fromJson<int>(json['idEtapasplaga']),
      numeroIndividuos: serializer.fromJson<int>(json['numeroIndividuos']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idCensoEtapasplaga': serializer.toJson<int>(idCensoEtapasplaga),
      'idCenso': serializer.toJson<int>(idCenso),
      'idEtapasplaga': serializer.toJson<int>(idEtapasplaga),
      'numeroIndividuos': serializer.toJson<int>(numeroIndividuos),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  CensoEtapasPlagaData copyWith(
          {int? idCensoEtapasplaga,
          int? idCenso,
          int? idEtapasplaga,
          int? numeroIndividuos,
          bool? sincronizado}) =>
      CensoEtapasPlagaData(
        idCensoEtapasplaga: idCensoEtapasplaga ?? this.idCensoEtapasplaga,
        idCenso: idCenso ?? this.idCenso,
        idEtapasplaga: idEtapasplaga ?? this.idEtapasplaga,
        numeroIndividuos: numeroIndividuos ?? this.numeroIndividuos,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('CensoEtapasPlagaData(')
          ..write('idCensoEtapasplaga: $idCensoEtapasplaga, ')
          ..write('idCenso: $idCenso, ')
          ..write('idEtapasplaga: $idEtapasplaga, ')
          ..write('numeroIndividuos: $numeroIndividuos, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idCensoEtapasplaga, idCenso, idEtapasplaga,
      numeroIndividuos, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CensoEtapasPlagaData &&
          other.idCensoEtapasplaga == this.idCensoEtapasplaga &&
          other.idCenso == this.idCenso &&
          other.idEtapasplaga == this.idEtapasplaga &&
          other.numeroIndividuos == this.numeroIndividuos &&
          other.sincronizado == this.sincronizado);
}

class CensoEtapasPlagaCompanion extends UpdateCompanion<CensoEtapasPlagaData> {
  final Value<int> idCensoEtapasplaga;
  final Value<int> idCenso;
  final Value<int> idEtapasplaga;
  final Value<int> numeroIndividuos;
  final Value<bool> sincronizado;
  const CensoEtapasPlagaCompanion({
    this.idCensoEtapasplaga = const Value.absent(),
    this.idCenso = const Value.absent(),
    this.idEtapasplaga = const Value.absent(),
    this.numeroIndividuos = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  CensoEtapasPlagaCompanion.insert({
    this.idCensoEtapasplaga = const Value.absent(),
    required int idCenso,
    required int idEtapasplaga,
    required int numeroIndividuos,
    this.sincronizado = const Value.absent(),
  })  : idCenso = Value(idCenso),
        idEtapasplaga = Value(idEtapasplaga),
        numeroIndividuos = Value(numeroIndividuos);
  static Insertable<CensoEtapasPlagaData> custom({
    Expression<int>? idCensoEtapasplaga,
    Expression<int>? idCenso,
    Expression<int>? idEtapasplaga,
    Expression<int>? numeroIndividuos,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (idCensoEtapasplaga != null)
        'id_censo_etapasplaga': idCensoEtapasplaga,
      if (idCenso != null) 'id_censo': idCenso,
      if (idEtapasplaga != null) 'id_etapasplaga': idEtapasplaga,
      if (numeroIndividuos != null) 'numero_individuos': numeroIndividuos,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  CensoEtapasPlagaCompanion copyWith(
      {Value<int>? idCensoEtapasplaga,
      Value<int>? idCenso,
      Value<int>? idEtapasplaga,
      Value<int>? numeroIndividuos,
      Value<bool>? sincronizado}) {
    return CensoEtapasPlagaCompanion(
      idCensoEtapasplaga: idCensoEtapasplaga ?? this.idCensoEtapasplaga,
      idCenso: idCenso ?? this.idCenso,
      idEtapasplaga: idEtapasplaga ?? this.idEtapasplaga,
      numeroIndividuos: numeroIndividuos ?? this.numeroIndividuos,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idCensoEtapasplaga.present) {
      map['id_censo_etapasplaga'] = Variable<int>(idCensoEtapasplaga.value);
    }
    if (idCenso.present) {
      map['id_censo'] = Variable<int>(idCenso.value);
    }
    if (idEtapasplaga.present) {
      map['id_etapasplaga'] = Variable<int>(idEtapasplaga.value);
    }
    if (numeroIndividuos.present) {
      map['numero_individuos'] = Variable<int>(numeroIndividuos.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CensoEtapasPlagaCompanion(')
          ..write('idCensoEtapasplaga: $idCensoEtapasplaga, ')
          ..write('idCenso: $idCenso, ')
          ..write('idEtapasplaga: $idEtapasplaga, ')
          ..write('numeroIndividuos: $numeroIndividuos, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $ImagenCensoPlagaTable extends ImagenCensoPlaga
    with TableInfo<$ImagenCensoPlagaTable, ImagenCensoPlagaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImagenCensoPlagaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idImagenCensoPlagaMeta =
      const VerificationMeta('idImagenCensoPlaga');
  @override
  late final GeneratedColumn<int> idImagenCensoPlaga = GeneratedColumn<int>(
      'id_imagen_censo_plaga', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idCensoMeta =
      const VerificationMeta('idCenso');
  @override
  late final GeneratedColumn<int> idCenso = GeneratedColumn<int>(
      'id_censo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imagenMeta = const VerificationMeta('imagen');
  @override
  late final GeneratedColumn<Uint8List> imagen = GeneratedColumn<Uint8List>(
      'imagen', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [idImagenCensoPlaga, idCenso, imagen, sincronizado];
  @override
  String get aliasedName => _alias ?? 'imagen_censo_plaga';
  @override
  String get actualTableName => 'imagen_censo_plaga';
  @override
  VerificationContext validateIntegrity(
      Insertable<ImagenCensoPlagaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_imagen_censo_plaga')) {
      context.handle(
          _idImagenCensoPlagaMeta,
          idImagenCensoPlaga.isAcceptableOrUnknown(
              data['id_imagen_censo_plaga']!, _idImagenCensoPlagaMeta));
    }
    if (data.containsKey('id_censo')) {
      context.handle(_idCensoMeta,
          idCenso.isAcceptableOrUnknown(data['id_censo']!, _idCensoMeta));
    } else if (isInserting) {
      context.missing(_idCensoMeta);
    }
    if (data.containsKey('imagen')) {
      context.handle(_imagenMeta,
          imagen.isAcceptableOrUnknown(data['imagen']!, _imagenMeta));
    } else if (isInserting) {
      context.missing(_imagenMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idImagenCensoPlaga};
  @override
  ImagenCensoPlagaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImagenCensoPlagaData(
      idImagenCensoPlaga: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_imagen_censo_plaga'])!,
      idCenso: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_censo'])!,
      imagen: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}imagen'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $ImagenCensoPlagaTable createAlias(String alias) {
    return $ImagenCensoPlagaTable(attachedDatabase, alias);
  }
}

class ImagenCensoPlagaData extends DataClass
    implements Insertable<ImagenCensoPlagaData> {
  final int idImagenCensoPlaga;
  final int idCenso;
  final Uint8List imagen;
  final bool sincronizado;
  const ImagenCensoPlagaData(
      {required this.idImagenCensoPlaga,
      required this.idCenso,
      required this.imagen,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_imagen_censo_plaga'] = Variable<int>(idImagenCensoPlaga);
    map['id_censo'] = Variable<int>(idCenso);
    map['imagen'] = Variable<Uint8List>(imagen);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  ImagenCensoPlagaCompanion toCompanion(bool nullToAbsent) {
    return ImagenCensoPlagaCompanion(
      idImagenCensoPlaga: Value(idImagenCensoPlaga),
      idCenso: Value(idCenso),
      imagen: Value(imagen),
      sincronizado: Value(sincronizado),
    );
  }

  factory ImagenCensoPlagaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImagenCensoPlagaData(
      idImagenCensoPlaga: serializer.fromJson<int>(json['idImagenCensoPlaga']),
      idCenso: serializer.fromJson<int>(json['idCenso']),
      imagen: serializer.fromJson<Uint8List>(json['imagen']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idImagenCensoPlaga': serializer.toJson<int>(idImagenCensoPlaga),
      'idCenso': serializer.toJson<int>(idCenso),
      'imagen': serializer.toJson<Uint8List>(imagen),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  ImagenCensoPlagaData copyWith(
          {int? idImagenCensoPlaga,
          int? idCenso,
          Uint8List? imagen,
          bool? sincronizado}) =>
      ImagenCensoPlagaData(
        idImagenCensoPlaga: idImagenCensoPlaga ?? this.idImagenCensoPlaga,
        idCenso: idCenso ?? this.idCenso,
        imagen: imagen ?? this.imagen,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('ImagenCensoPlagaData(')
          ..write('idImagenCensoPlaga: $idImagenCensoPlaga, ')
          ..write('idCenso: $idCenso, ')
          ..write('imagen: $imagen, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idImagenCensoPlaga, idCenso,
      $driftBlobEquality.hash(imagen), sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImagenCensoPlagaData &&
          other.idImagenCensoPlaga == this.idImagenCensoPlaga &&
          other.idCenso == this.idCenso &&
          $driftBlobEquality.equals(other.imagen, this.imagen) &&
          other.sincronizado == this.sincronizado);
}

class ImagenCensoPlagaCompanion extends UpdateCompanion<ImagenCensoPlagaData> {
  final Value<int> idImagenCensoPlaga;
  final Value<int> idCenso;
  final Value<Uint8List> imagen;
  final Value<bool> sincronizado;
  const ImagenCensoPlagaCompanion({
    this.idImagenCensoPlaga = const Value.absent(),
    this.idCenso = const Value.absent(),
    this.imagen = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  ImagenCensoPlagaCompanion.insert({
    this.idImagenCensoPlaga = const Value.absent(),
    required int idCenso,
    required Uint8List imagen,
    this.sincronizado = const Value.absent(),
  })  : idCenso = Value(idCenso),
        imagen = Value(imagen);
  static Insertable<ImagenCensoPlagaData> custom({
    Expression<int>? idImagenCensoPlaga,
    Expression<int>? idCenso,
    Expression<Uint8List>? imagen,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (idImagenCensoPlaga != null)
        'id_imagen_censo_plaga': idImagenCensoPlaga,
      if (idCenso != null) 'id_censo': idCenso,
      if (imagen != null) 'imagen': imagen,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  ImagenCensoPlagaCompanion copyWith(
      {Value<int>? idImagenCensoPlaga,
      Value<int>? idCenso,
      Value<Uint8List>? imagen,
      Value<bool>? sincronizado}) {
    return ImagenCensoPlagaCompanion(
      idImagenCensoPlaga: idImagenCensoPlaga ?? this.idImagenCensoPlaga,
      idCenso: idCenso ?? this.idCenso,
      imagen: imagen ?? this.imagen,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idImagenCensoPlaga.present) {
      map['id_imagen_censo_plaga'] = Variable<int>(idImagenCensoPlaga.value);
    }
    if (idCenso.present) {
      map['id_censo'] = Variable<int>(idCenso.value);
    }
    if (imagen.present) {
      map['imagen'] = Variable<Uint8List>(imagen.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagenCensoPlagaCompanion(')
          ..write('idImagenCensoPlaga: $idImagenCensoPlaga, ')
          ..write('idCenso: $idCenso, ')
          ..write('imagen: $imagen, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $PrecipitacionTable extends Precipitacion
    with TableInfo<$PrecipitacionTable, PrecipitacionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrecipitacionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPrecipitacionMeta =
      const VerificationMeta('idPrecipitacion');
  @override
  late final GeneratedColumn<int> idPrecipitacion = GeneratedColumn<int>(
      'id_precipitacion', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fechaRegistroPrecipitacionMeta =
      const VerificationMeta('fechaRegistroPrecipitacion');
  @override
  late final GeneratedColumn<DateTime> fechaRegistroPrecipitacion =
      GeneratedColumn<DateTime>(
          'fecha_registro_precipitacion', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cantidadPrecipitacionMeta =
      const VerificationMeta('cantidadPrecipitacion');
  @override
  late final GeneratedColumn<int> cantidadPrecipitacion = GeneratedColumn<int>(
      'cantidad_precipitacion', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idPrecipitacion, fechaRegistroPrecipitacion, cantidadPrecipitacion];
  @override
  String get aliasedName => _alias ?? 'precipitacion';
  @override
  String get actualTableName => 'precipitacion';
  @override
  VerificationContext validateIntegrity(Insertable<PrecipitacionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_precipitacion')) {
      context.handle(
          _idPrecipitacionMeta,
          idPrecipitacion.isAcceptableOrUnknown(
              data['id_precipitacion']!, _idPrecipitacionMeta));
    }
    if (data.containsKey('fecha_registro_precipitacion')) {
      context.handle(
          _fechaRegistroPrecipitacionMeta,
          fechaRegistroPrecipitacion.isAcceptableOrUnknown(
              data['fecha_registro_precipitacion']!,
              _fechaRegistroPrecipitacionMeta));
    } else if (isInserting) {
      context.missing(_fechaRegistroPrecipitacionMeta);
    }
    if (data.containsKey('cantidad_precipitacion')) {
      context.handle(
          _cantidadPrecipitacionMeta,
          cantidadPrecipitacion.isAcceptableOrUnknown(
              data['cantidad_precipitacion']!, _cantidadPrecipitacionMeta));
    } else if (isInserting) {
      context.missing(_cantidadPrecipitacionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPrecipitacion};
  @override
  PrecipitacionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrecipitacionData(
      idPrecipitacion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_precipitacion'])!,
      fechaRegistroPrecipitacion: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}fecha_registro_precipitacion'])!,
      cantidadPrecipitacion: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}cantidad_precipitacion'])!,
    );
  }

  @override
  $PrecipitacionTable createAlias(String alias) {
    return $PrecipitacionTable(attachedDatabase, alias);
  }
}

class PrecipitacionData extends DataClass
    implements Insertable<PrecipitacionData> {
  final int idPrecipitacion;
  final DateTime fechaRegistroPrecipitacion;
  final int cantidadPrecipitacion;
  const PrecipitacionData(
      {required this.idPrecipitacion,
      required this.fechaRegistroPrecipitacion,
      required this.cantidadPrecipitacion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_precipitacion'] = Variable<int>(idPrecipitacion);
    map['fecha_registro_precipitacion'] =
        Variable<DateTime>(fechaRegistroPrecipitacion);
    map['cantidad_precipitacion'] = Variable<int>(cantidadPrecipitacion);
    return map;
  }

  PrecipitacionCompanion toCompanion(bool nullToAbsent) {
    return PrecipitacionCompanion(
      idPrecipitacion: Value(idPrecipitacion),
      fechaRegistroPrecipitacion: Value(fechaRegistroPrecipitacion),
      cantidadPrecipitacion: Value(cantidadPrecipitacion),
    );
  }

  factory PrecipitacionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrecipitacionData(
      idPrecipitacion: serializer.fromJson<int>(json['idPrecipitacion']),
      fechaRegistroPrecipitacion:
          serializer.fromJson<DateTime>(json['fechaRegistroPrecipitacion']),
      cantidadPrecipitacion:
          serializer.fromJson<int>(json['cantidadPrecipitacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPrecipitacion': serializer.toJson<int>(idPrecipitacion),
      'fechaRegistroPrecipitacion':
          serializer.toJson<DateTime>(fechaRegistroPrecipitacion),
      'cantidadPrecipitacion': serializer.toJson<int>(cantidadPrecipitacion),
    };
  }

  PrecipitacionData copyWith(
          {int? idPrecipitacion,
          DateTime? fechaRegistroPrecipitacion,
          int? cantidadPrecipitacion}) =>
      PrecipitacionData(
        idPrecipitacion: idPrecipitacion ?? this.idPrecipitacion,
        fechaRegistroPrecipitacion:
            fechaRegistroPrecipitacion ?? this.fechaRegistroPrecipitacion,
        cantidadPrecipitacion:
            cantidadPrecipitacion ?? this.cantidadPrecipitacion,
      );
  @override
  String toString() {
    return (StringBuffer('PrecipitacionData(')
          ..write('idPrecipitacion: $idPrecipitacion, ')
          ..write('fechaRegistroPrecipitacion: $fechaRegistroPrecipitacion, ')
          ..write('cantidadPrecipitacion: $cantidadPrecipitacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idPrecipitacion, fechaRegistroPrecipitacion, cantidadPrecipitacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrecipitacionData &&
          other.idPrecipitacion == this.idPrecipitacion &&
          other.fechaRegistroPrecipitacion == this.fechaRegistroPrecipitacion &&
          other.cantidadPrecipitacion == this.cantidadPrecipitacion);
}

class PrecipitacionCompanion extends UpdateCompanion<PrecipitacionData> {
  final Value<int> idPrecipitacion;
  final Value<DateTime> fechaRegistroPrecipitacion;
  final Value<int> cantidadPrecipitacion;
  const PrecipitacionCompanion({
    this.idPrecipitacion = const Value.absent(),
    this.fechaRegistroPrecipitacion = const Value.absent(),
    this.cantidadPrecipitacion = const Value.absent(),
  });
  PrecipitacionCompanion.insert({
    this.idPrecipitacion = const Value.absent(),
    required DateTime fechaRegistroPrecipitacion,
    required int cantidadPrecipitacion,
  })  : fechaRegistroPrecipitacion = Value(fechaRegistroPrecipitacion),
        cantidadPrecipitacion = Value(cantidadPrecipitacion);
  static Insertable<PrecipitacionData> custom({
    Expression<int>? idPrecipitacion,
    Expression<DateTime>? fechaRegistroPrecipitacion,
    Expression<int>? cantidadPrecipitacion,
  }) {
    return RawValuesInsertable({
      if (idPrecipitacion != null) 'id_precipitacion': idPrecipitacion,
      if (fechaRegistroPrecipitacion != null)
        'fecha_registro_precipitacion': fechaRegistroPrecipitacion,
      if (cantidadPrecipitacion != null)
        'cantidad_precipitacion': cantidadPrecipitacion,
    });
  }

  PrecipitacionCompanion copyWith(
      {Value<int>? idPrecipitacion,
      Value<DateTime>? fechaRegistroPrecipitacion,
      Value<int>? cantidadPrecipitacion}) {
    return PrecipitacionCompanion(
      idPrecipitacion: idPrecipitacion ?? this.idPrecipitacion,
      fechaRegistroPrecipitacion:
          fechaRegistroPrecipitacion ?? this.fechaRegistroPrecipitacion,
      cantidadPrecipitacion:
          cantidadPrecipitacion ?? this.cantidadPrecipitacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPrecipitacion.present) {
      map['id_precipitacion'] = Variable<int>(idPrecipitacion.value);
    }
    if (fechaRegistroPrecipitacion.present) {
      map['fecha_registro_precipitacion'] =
          Variable<DateTime>(fechaRegistroPrecipitacion.value);
    }
    if (cantidadPrecipitacion.present) {
      map['cantidad_precipitacion'] =
          Variable<int>(cantidadPrecipitacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrecipitacionCompanion(')
          ..write('idPrecipitacion: $idPrecipitacion, ')
          ..write('fechaRegistroPrecipitacion: $fechaRegistroPrecipitacion, ')
          ..write('cantidadPrecipitacion: $cantidadPrecipitacion')
          ..write(')'))
        .toString();
  }
}

class $FertilizacionesTable extends Fertilizaciones
    with TableInfo<$FertilizacionesTable, Fertilizacione> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FertilizacionesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idFertilizacionMeta =
      const VerificationMeta('idFertilizacion');
  @override
  late final GeneratedColumn<int> idFertilizacion = GeneratedColumn<int>(
      'id_fertilizacion', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreLoteMeta =
      const VerificationMeta('nombreLote');
  @override
  late final GeneratedColumn<String> nombreLote = GeneratedColumn<String>(
      'nombre_lote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  @override
  late final GeneratedColumn<DateTime> fechaIngreso = GeneratedColumn<DateTime>(
      'fecha_ingreso', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fechaSalidaMeta =
      const VerificationMeta('fechaSalida');
  @override
  late final GeneratedColumn<DateTime> fechaSalida = GeneratedColumn<DateTime>(
      'fecha_salida', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cantidadFertilizadaMeta =
      const VerificationMeta('cantidadFertilizada');
  @override
  late final GeneratedColumn<int> cantidadFertilizada = GeneratedColumn<int>(
      'cantidad_fertilizada', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _completadoMeta =
      const VerificationMeta('completado');
  @override
  late final GeneratedColumn<bool> completado =
      GeneratedColumn<bool>('completado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("completado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idFertilizacion,
        nombreLote,
        fechaIngreso,
        fechaSalida,
        cantidadFertilizada,
        completado,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'fertilizaciones';
  @override
  String get actualTableName => 'fertilizaciones';
  @override
  VerificationContext validateIntegrity(Insertable<Fertilizacione> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_fertilizacion')) {
      context.handle(
          _idFertilizacionMeta,
          idFertilizacion.isAcceptableOrUnknown(
              data['id_fertilizacion']!, _idFertilizacionMeta));
    }
    if (data.containsKey('nombre_lote')) {
      context.handle(
          _nombreLoteMeta,
          nombreLote.isAcceptableOrUnknown(
              data['nombre_lote']!, _nombreLoteMeta));
    } else if (isInserting) {
      context.missing(_nombreLoteMeta);
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
          _fechaIngresoMeta,
          fechaIngreso.isAcceptableOrUnknown(
              data['fecha_ingreso']!, _fechaIngresoMeta));
    } else if (isInserting) {
      context.missing(_fechaIngresoMeta);
    }
    if (data.containsKey('fecha_salida')) {
      context.handle(
          _fechaSalidaMeta,
          fechaSalida.isAcceptableOrUnknown(
              data['fecha_salida']!, _fechaSalidaMeta));
    }
    if (data.containsKey('cantidad_fertilizada')) {
      context.handle(
          _cantidadFertilizadaMeta,
          cantidadFertilizada.isAcceptableOrUnknown(
              data['cantidad_fertilizada']!, _cantidadFertilizadaMeta));
    } else if (isInserting) {
      context.missing(_cantidadFertilizadaMeta);
    }
    if (data.containsKey('completado')) {
      context.handle(
          _completadoMeta,
          completado.isAcceptableOrUnknown(
              data['completado']!, _completadoMeta));
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Fertilizacione map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Fertilizacione(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idFertilizacion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_fertilizacion']),
      nombreLote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_lote'])!,
      fechaIngreso: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_ingreso'])!,
      fechaSalida: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_salida']),
      cantidadFertilizada: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}cantidad_fertilizada'])!,
      completado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completado'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $FertilizacionesTable createAlias(String alias) {
    return $FertilizacionesTable(attachedDatabase, alias);
  }
}

class Fertilizacione extends DataClass implements Insertable<Fertilizacione> {
  final int id;
  final int? idFertilizacion;
  final String nombreLote;
  final DateTime fechaIngreso;
  final DateTime? fechaSalida;
  final int cantidadFertilizada;
  final bool completado;
  final bool sincronizado;
  const Fertilizacione(
      {required this.id,
      this.idFertilizacion,
      required this.nombreLote,
      required this.fechaIngreso,
      this.fechaSalida,
      required this.cantidadFertilizada,
      required this.completado,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idFertilizacion != null) {
      map['id_fertilizacion'] = Variable<int>(idFertilizacion);
    }
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    if (!nullToAbsent || fechaSalida != null) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida);
    }
    map['cantidad_fertilizada'] = Variable<int>(cantidadFertilizada);
    map['completado'] = Variable<bool>(completado);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  FertilizacionesCompanion toCompanion(bool nullToAbsent) {
    return FertilizacionesCompanion(
      id: Value(id),
      idFertilizacion: idFertilizacion == null && nullToAbsent
          ? const Value.absent()
          : Value(idFertilizacion),
      nombreLote: Value(nombreLote),
      fechaIngreso: Value(fechaIngreso),
      fechaSalida: fechaSalida == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaSalida),
      cantidadFertilizada: Value(cantidadFertilizada),
      completado: Value(completado),
      sincronizado: Value(sincronizado),
    );
  }

  factory Fertilizacione.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Fertilizacione(
      id: serializer.fromJson<int>(json['id']),
      idFertilizacion: serializer.fromJson<int?>(json['idFertilizacion']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      fechaSalida: serializer.fromJson<DateTime?>(json['fechaSalida']),
      cantidadFertilizada:
          serializer.fromJson<int>(json['cantidadFertilizada']),
      completado: serializer.fromJson<bool>(json['completado']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idFertilizacion': serializer.toJson<int?>(idFertilizacion),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'fechaSalida': serializer.toJson<DateTime?>(fechaSalida),
      'cantidadFertilizada': serializer.toJson<int>(cantidadFertilizada),
      'completado': serializer.toJson<bool>(completado),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  Fertilizacione copyWith(
          {int? id,
          Value<int?> idFertilizacion = const Value.absent(),
          String? nombreLote,
          DateTime? fechaIngreso,
          Value<DateTime?> fechaSalida = const Value.absent(),
          int? cantidadFertilizada,
          bool? completado,
          bool? sincronizado}) =>
      Fertilizacione(
        id: id ?? this.id,
        idFertilizacion: idFertilizacion.present
            ? idFertilizacion.value
            : this.idFertilizacion,
        nombreLote: nombreLote ?? this.nombreLote,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        fechaSalida: fechaSalida.present ? fechaSalida.value : this.fechaSalida,
        cantidadFertilizada: cantidadFertilizada ?? this.cantidadFertilizada,
        completado: completado ?? this.completado,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('Fertilizacione(')
          ..write('id: $id, ')
          ..write('idFertilizacion: $idFertilizacion, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadFertilizada: $cantidadFertilizada, ')
          ..write('completado: $completado, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idFertilizacion, nombreLote, fechaIngreso,
      fechaSalida, cantidadFertilizada, completado, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fertilizacione &&
          other.id == this.id &&
          other.idFertilizacion == this.idFertilizacion &&
          other.nombreLote == this.nombreLote &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaSalida == this.fechaSalida &&
          other.cantidadFertilizada == this.cantidadFertilizada &&
          other.completado == this.completado &&
          other.sincronizado == this.sincronizado);
}

class FertilizacionesCompanion extends UpdateCompanion<Fertilizacione> {
  final Value<int> id;
  final Value<int?> idFertilizacion;
  final Value<String> nombreLote;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaSalida;
  final Value<int> cantidadFertilizada;
  final Value<bool> completado;
  final Value<bool> sincronizado;
  const FertilizacionesCompanion({
    this.id = const Value.absent(),
    this.idFertilizacion = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.cantidadFertilizada = const Value.absent(),
    this.completado = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  FertilizacionesCompanion.insert({
    this.id = const Value.absent(),
    this.idFertilizacion = const Value.absent(),
    required String nombreLote,
    required DateTime fechaIngreso,
    this.fechaSalida = const Value.absent(),
    required int cantidadFertilizada,
    this.completado = const Value.absent(),
    this.sincronizado = const Value.absent(),
  })  : nombreLote = Value(nombreLote),
        fechaIngreso = Value(fechaIngreso),
        cantidadFertilizada = Value(cantidadFertilizada);
  static Insertable<Fertilizacione> custom({
    Expression<int>? id,
    Expression<int>? idFertilizacion,
    Expression<String>? nombreLote,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime>? fechaSalida,
    Expression<int>? cantidadFertilizada,
    Expression<bool>? completado,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idFertilizacion != null) 'id_fertilizacion': idFertilizacion,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (cantidadFertilizada != null)
        'cantidad_fertilizada': cantidadFertilizada,
      if (completado != null) 'completado': completado,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  FertilizacionesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? idFertilizacion,
      Value<String>? nombreLote,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? fechaSalida,
      Value<int>? cantidadFertilizada,
      Value<bool>? completado,
      Value<bool>? sincronizado}) {
    return FertilizacionesCompanion(
      id: id ?? this.id,
      idFertilizacion: idFertilizacion ?? this.idFertilizacion,
      nombreLote: nombreLote ?? this.nombreLote,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      cantidadFertilizada: cantidadFertilizada ?? this.cantidadFertilizada,
      completado: completado ?? this.completado,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idFertilizacion.present) {
      map['id_fertilizacion'] = Variable<int>(idFertilizacion.value);
    }
    if (nombreLote.present) {
      map['nombre_lote'] = Variable<String>(nombreLote.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (fechaSalida.present) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida.value);
    }
    if (cantidadFertilizada.present) {
      map['cantidad_fertilizada'] = Variable<int>(cantidadFertilizada.value);
    }
    if (completado.present) {
      map['completado'] = Variable<bool>(completado.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FertilizacionesCompanion(')
          ..write('id: $id, ')
          ..write('idFertilizacion: $idFertilizacion, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadFertilizada: $cantidadFertilizada, ')
          ..write('completado: $completado, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $FertilizacionDiariaTable extends FertilizacionDiaria
    with TableInfo<$FertilizacionDiariaTable, FertilizacionDiariaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FertilizacionDiariaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idFertilizacionMeta =
      const VerificationMeta('idFertilizacion');
  @override
  late final GeneratedColumn<int> idFertilizacion = GeneratedColumn<int>(
      'id_fertilizacion', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES fertilizaciones(id)');
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
      'fecha', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cantidadFertilizadaMeta =
      const VerificationMeta('cantidadFertilizada');
  @override
  late final GeneratedColumn<int> cantidadFertilizada = GeneratedColumn<int>(
      'cantidad_fertilizada', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dosisMeta = const VerificationMeta('dosis');
  @override
  late final GeneratedColumn<double> dosis = GeneratedColumn<double>(
      'dosis', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unidadesMeta =
      const VerificationMeta('unidades');
  @override
  late final GeneratedColumn<String> unidades = GeneratedColumn<String>(
      'unidades', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _responsableMeta =
      const VerificationMeta('responsable');
  @override
  late final GeneratedColumn<String> responsable = GeneratedColumn<String>(
      'responsable', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nombreFertilizanteMeta =
      const VerificationMeta('nombreFertilizante');
  @override
  late final GeneratedColumn<String> nombreFertilizante =
      GeneratedColumn<String>('nombre_fertilizante', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoMeta =
      const VerificationMeta('sincronizado');
  @override
  late final GeneratedColumn<bool> sincronizado =
      GeneratedColumn<bool>('sincronizado', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sincronizado" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idFertilizacion,
        fecha,
        cantidadFertilizada,
        dosis,
        unidades,
        responsable,
        nombreFertilizante,
        sincronizado
      ];
  @override
  String get aliasedName => _alias ?? 'fertilizacion_diaria';
  @override
  String get actualTableName => 'fertilizacion_diaria';
  @override
  VerificationContext validateIntegrity(
      Insertable<FertilizacionDiariaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_fertilizacion')) {
      context.handle(
          _idFertilizacionMeta,
          idFertilizacion.isAcceptableOrUnknown(
              data['id_fertilizacion']!, _idFertilizacionMeta));
    } else if (isInserting) {
      context.missing(_idFertilizacionMeta);
    }
    if (data.containsKey('fecha')) {
      context.handle(
          _fechaMeta, fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta));
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    if (data.containsKey('cantidad_fertilizada')) {
      context.handle(
          _cantidadFertilizadaMeta,
          cantidadFertilizada.isAcceptableOrUnknown(
              data['cantidad_fertilizada']!, _cantidadFertilizadaMeta));
    } else if (isInserting) {
      context.missing(_cantidadFertilizadaMeta);
    }
    if (data.containsKey('dosis')) {
      context.handle(
          _dosisMeta, dosis.isAcceptableOrUnknown(data['dosis']!, _dosisMeta));
    } else if (isInserting) {
      context.missing(_dosisMeta);
    }
    if (data.containsKey('unidades')) {
      context.handle(_unidadesMeta,
          unidades.isAcceptableOrUnknown(data['unidades']!, _unidadesMeta));
    } else if (isInserting) {
      context.missing(_unidadesMeta);
    }
    if (data.containsKey('responsable')) {
      context.handle(
          _responsableMeta,
          responsable.isAcceptableOrUnknown(
              data['responsable']!, _responsableMeta));
    } else if (isInserting) {
      context.missing(_responsableMeta);
    }
    if (data.containsKey('nombre_fertilizante')) {
      context.handle(
          _nombreFertilizanteMeta,
          nombreFertilizante.isAcceptableOrUnknown(
              data['nombre_fertilizante']!, _nombreFertilizanteMeta));
    } else if (isInserting) {
      context.missing(_nombreFertilizanteMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FertilizacionDiariaData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FertilizacionDiariaData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idFertilizacion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_fertilizacion'])!,
      fecha: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha'])!,
      cantidadFertilizada: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}cantidad_fertilizada'])!,
      dosis: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dosis'])!,
      unidades: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unidades'])!,
      responsable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsable'])!,
      nombreFertilizante: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nombre_fertilizante'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $FertilizacionDiariaTable createAlias(String alias) {
    return $FertilizacionDiariaTable(attachedDatabase, alias);
  }
}

class FertilizacionDiariaData extends DataClass
    implements Insertable<FertilizacionDiariaData> {
  final int id;
  final int idFertilizacion;
  final DateTime fecha;
  final int cantidadFertilizada;
  final double dosis;
  final String unidades;
  final String responsable;
  final String nombreFertilizante;
  final bool sincronizado;
  const FertilizacionDiariaData(
      {required this.id,
      required this.idFertilizacion,
      required this.fecha,
      required this.cantidadFertilizada,
      required this.dosis,
      required this.unidades,
      required this.responsable,
      required this.nombreFertilizante,
      required this.sincronizado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_fertilizacion'] = Variable<int>(idFertilizacion);
    map['fecha'] = Variable<DateTime>(fecha);
    map['cantidad_fertilizada'] = Variable<int>(cantidadFertilizada);
    map['dosis'] = Variable<double>(dosis);
    map['unidades'] = Variable<String>(unidades);
    map['responsable'] = Variable<String>(responsable);
    map['nombre_fertilizante'] = Variable<String>(nombreFertilizante);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  FertilizacionDiariaCompanion toCompanion(bool nullToAbsent) {
    return FertilizacionDiariaCompanion(
      id: Value(id),
      idFertilizacion: Value(idFertilizacion),
      fecha: Value(fecha),
      cantidadFertilizada: Value(cantidadFertilizada),
      dosis: Value(dosis),
      unidades: Value(unidades),
      responsable: Value(responsable),
      nombreFertilizante: Value(nombreFertilizante),
      sincronizado: Value(sincronizado),
    );
  }

  factory FertilizacionDiariaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FertilizacionDiariaData(
      id: serializer.fromJson<int>(json['id']),
      idFertilizacion: serializer.fromJson<int>(json['idFertilizacion']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      cantidadFertilizada:
          serializer.fromJson<int>(json['cantidadFertilizada']),
      dosis: serializer.fromJson<double>(json['dosis']),
      unidades: serializer.fromJson<String>(json['unidades']),
      responsable: serializer.fromJson<String>(json['responsable']),
      nombreFertilizante:
          serializer.fromJson<String>(json['nombreFertilizante']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idFertilizacion': serializer.toJson<int>(idFertilizacion),
      'fecha': serializer.toJson<DateTime>(fecha),
      'cantidadFertilizada': serializer.toJson<int>(cantidadFertilizada),
      'dosis': serializer.toJson<double>(dosis),
      'unidades': serializer.toJson<String>(unidades),
      'responsable': serializer.toJson<String>(responsable),
      'nombreFertilizante': serializer.toJson<String>(nombreFertilizante),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  FertilizacionDiariaData copyWith(
          {int? id,
          int? idFertilizacion,
          DateTime? fecha,
          int? cantidadFertilizada,
          double? dosis,
          String? unidades,
          String? responsable,
          String? nombreFertilizante,
          bool? sincronizado}) =>
      FertilizacionDiariaData(
        id: id ?? this.id,
        idFertilizacion: idFertilizacion ?? this.idFertilizacion,
        fecha: fecha ?? this.fecha,
        cantidadFertilizada: cantidadFertilizada ?? this.cantidadFertilizada,
        dosis: dosis ?? this.dosis,
        unidades: unidades ?? this.unidades,
        responsable: responsable ?? this.responsable,
        nombreFertilizante: nombreFertilizante ?? this.nombreFertilizante,
        sincronizado: sincronizado ?? this.sincronizado,
      );
  @override
  String toString() {
    return (StringBuffer('FertilizacionDiariaData(')
          ..write('id: $id, ')
          ..write('idFertilizacion: $idFertilizacion, ')
          ..write('fecha: $fecha, ')
          ..write('cantidadFertilizada: $cantidadFertilizada, ')
          ..write('dosis: $dosis, ')
          ..write('unidades: $unidades, ')
          ..write('responsable: $responsable, ')
          ..write('nombreFertilizante: $nombreFertilizante, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      idFertilizacion,
      fecha,
      cantidadFertilizada,
      dosis,
      unidades,
      responsable,
      nombreFertilizante,
      sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FertilizacionDiariaData &&
          other.id == this.id &&
          other.idFertilizacion == this.idFertilizacion &&
          other.fecha == this.fecha &&
          other.cantidadFertilizada == this.cantidadFertilizada &&
          other.dosis == this.dosis &&
          other.unidades == this.unidades &&
          other.responsable == this.responsable &&
          other.nombreFertilizante == this.nombreFertilizante &&
          other.sincronizado == this.sincronizado);
}

class FertilizacionDiariaCompanion
    extends UpdateCompanion<FertilizacionDiariaData> {
  final Value<int> id;
  final Value<int> idFertilizacion;
  final Value<DateTime> fecha;
  final Value<int> cantidadFertilizada;
  final Value<double> dosis;
  final Value<String> unidades;
  final Value<String> responsable;
  final Value<String> nombreFertilizante;
  final Value<bool> sincronizado;
  const FertilizacionDiariaCompanion({
    this.id = const Value.absent(),
    this.idFertilizacion = const Value.absent(),
    this.fecha = const Value.absent(),
    this.cantidadFertilizada = const Value.absent(),
    this.dosis = const Value.absent(),
    this.unidades = const Value.absent(),
    this.responsable = const Value.absent(),
    this.nombreFertilizante = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  FertilizacionDiariaCompanion.insert({
    this.id = const Value.absent(),
    required int idFertilizacion,
    required DateTime fecha,
    required int cantidadFertilizada,
    required double dosis,
    required String unidades,
    required String responsable,
    required String nombreFertilizante,
    this.sincronizado = const Value.absent(),
  })  : idFertilizacion = Value(idFertilizacion),
        fecha = Value(fecha),
        cantidadFertilizada = Value(cantidadFertilizada),
        dosis = Value(dosis),
        unidades = Value(unidades),
        responsable = Value(responsable),
        nombreFertilizante = Value(nombreFertilizante);
  static Insertable<FertilizacionDiariaData> custom({
    Expression<int>? id,
    Expression<int>? idFertilizacion,
    Expression<DateTime>? fecha,
    Expression<int>? cantidadFertilizada,
    Expression<double>? dosis,
    Expression<String>? unidades,
    Expression<String>? responsable,
    Expression<String>? nombreFertilizante,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idFertilizacion != null) 'id_fertilizacion': idFertilizacion,
      if (fecha != null) 'fecha': fecha,
      if (cantidadFertilizada != null)
        'cantidad_fertilizada': cantidadFertilizada,
      if (dosis != null) 'dosis': dosis,
      if (unidades != null) 'unidades': unidades,
      if (responsable != null) 'responsable': responsable,
      if (nombreFertilizante != null) 'nombre_fertilizante': nombreFertilizante,
      if (sincronizado != null) 'sincronizado': sincronizado,
    });
  }

  FertilizacionDiariaCompanion copyWith(
      {Value<int>? id,
      Value<int>? idFertilizacion,
      Value<DateTime>? fecha,
      Value<int>? cantidadFertilizada,
      Value<double>? dosis,
      Value<String>? unidades,
      Value<String>? responsable,
      Value<String>? nombreFertilizante,
      Value<bool>? sincronizado}) {
    return FertilizacionDiariaCompanion(
      id: id ?? this.id,
      idFertilizacion: idFertilizacion ?? this.idFertilizacion,
      fecha: fecha ?? this.fecha,
      cantidadFertilizada: cantidadFertilizada ?? this.cantidadFertilizada,
      dosis: dosis ?? this.dosis,
      unidades: unidades ?? this.unidades,
      responsable: responsable ?? this.responsable,
      nombreFertilizante: nombreFertilizante ?? this.nombreFertilizante,
      sincronizado: sincronizado ?? this.sincronizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idFertilizacion.present) {
      map['id_fertilizacion'] = Variable<int>(idFertilizacion.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (cantidadFertilizada.present) {
      map['cantidad_fertilizada'] = Variable<int>(cantidadFertilizada.value);
    }
    if (dosis.present) {
      map['dosis'] = Variable<double>(dosis.value);
    }
    if (unidades.present) {
      map['unidades'] = Variable<String>(unidades.value);
    }
    if (responsable.present) {
      map['responsable'] = Variable<String>(responsable.value);
    }
    if (nombreFertilizante.present) {
      map['nombre_fertilizante'] = Variable<String>(nombreFertilizante.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FertilizacionDiariaCompanion(')
          ..write('id: $id, ')
          ..write('idFertilizacion: $idFertilizacion, ')
          ..write('fecha: $fecha, ')
          ..write('cantidadFertilizada: $cantidadFertilizada, ')
          ..write('dosis: $dosis, ')
          ..write('unidades: $unidades, ')
          ..write('responsable: $responsable, ')
          ..write('nombreFertilizante: $nombreFertilizante, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }
}

class $FertilizanteTable extends Fertilizante
    with TableInfo<$FertilizanteTable, FertilizanteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FertilizanteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nombreFertilizanteMeta =
      const VerificationMeta('nombreFertilizante');
  @override
  late final GeneratedColumn<String> nombreFertilizante =
      GeneratedColumn<String>('nombre_fertilizante', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
      'tipo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _composicionMeta =
      const VerificationMeta('composicion');
  @override
  late final GeneratedColumn<String> composicion = GeneratedColumn<String>(
      'composicion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _porcentajeMeta =
      const VerificationMeta('porcentaje');
  @override
  late final GeneratedColumn<double> porcentaje = GeneratedColumn<double>(
      'porcentaje', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _presentacionPnombreFertilizanteMeta =
      const VerificationMeta('presentacionPnombreFertilizante');
  @override
  late final GeneratedColumn<String> presentacionPnombreFertilizante =
      GeneratedColumn<String>(
          'presentacion_pnombre_fertilizante', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaUltimaActualizacionMeta =
      const VerificationMeta('fechaUltimaActualizacion');
  @override
  late final GeneratedColumn<DateTime> fechaUltimaActualizacion =
      GeneratedColumn<DateTime>('fecha_ultima_actualizacion', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        nombreFertilizante,
        tipo,
        composicion,
        porcentaje,
        presentacionPnombreFertilizante,
        fechaUltimaActualizacion
      ];
  @override
  String get aliasedName => _alias ?? 'fertilizante';
  @override
  String get actualTableName => 'fertilizante';
  @override
  VerificationContext validateIntegrity(Insertable<FertilizanteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nombre_fertilizante')) {
      context.handle(
          _nombreFertilizanteMeta,
          nombreFertilizante.isAcceptableOrUnknown(
              data['nombre_fertilizante']!, _nombreFertilizanteMeta));
    } else if (isInserting) {
      context.missing(_nombreFertilizanteMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
          _tipoMeta, tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta));
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('composicion')) {
      context.handle(
          _composicionMeta,
          composicion.isAcceptableOrUnknown(
              data['composicion']!, _composicionMeta));
    } else if (isInserting) {
      context.missing(_composicionMeta);
    }
    if (data.containsKey('porcentaje')) {
      context.handle(
          _porcentajeMeta,
          porcentaje.isAcceptableOrUnknown(
              data['porcentaje']!, _porcentajeMeta));
    } else if (isInserting) {
      context.missing(_porcentajeMeta);
    }
    if (data.containsKey('presentacion_pnombre_fertilizante')) {
      context.handle(
          _presentacionPnombreFertilizanteMeta,
          presentacionPnombreFertilizante.isAcceptableOrUnknown(
              data['presentacion_pnombre_fertilizante']!,
              _presentacionPnombreFertilizanteMeta));
    } else if (isInserting) {
      context.missing(_presentacionPnombreFertilizanteMeta);
    }
    if (data.containsKey('fecha_ultima_actualizacion')) {
      context.handle(
          _fechaUltimaActualizacionMeta,
          fechaUltimaActualizacion.isAcceptableOrUnknown(
              data['fecha_ultima_actualizacion']!,
              _fechaUltimaActualizacionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {nombreFertilizante};
  @override
  FertilizanteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FertilizanteData(
      nombreFertilizante: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nombre_fertilizante'])!,
      tipo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo'])!,
      composicion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}composicion'])!,
      porcentaje: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}porcentaje'])!,
      presentacionPnombreFertilizante: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}presentacion_pnombre_fertilizante'])!,
      fechaUltimaActualizacion: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}fecha_ultima_actualizacion']),
    );
  }

  @override
  $FertilizanteTable createAlias(String alias) {
    return $FertilizanteTable(attachedDatabase, alias);
  }
}

class FertilizanteData extends DataClass
    implements Insertable<FertilizanteData> {
  final String nombreFertilizante;
  final String tipo;
  final String composicion;
  final double porcentaje;
  final String presentacionPnombreFertilizante;
  final DateTime? fechaUltimaActualizacion;
  const FertilizanteData(
      {required this.nombreFertilizante,
      required this.tipo,
      required this.composicion,
      required this.porcentaje,
      required this.presentacionPnombreFertilizante,
      this.fechaUltimaActualizacion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nombre_fertilizante'] = Variable<String>(nombreFertilizante);
    map['tipo'] = Variable<String>(tipo);
    map['composicion'] = Variable<String>(composicion);
    map['porcentaje'] = Variable<double>(porcentaje);
    map['presentacion_pnombre_fertilizante'] =
        Variable<String>(presentacionPnombreFertilizante);
    if (!nullToAbsent || fechaUltimaActualizacion != null) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion);
    }
    return map;
  }

  FertilizanteCompanion toCompanion(bool nullToAbsent) {
    return FertilizanteCompanion(
      nombreFertilizante: Value(nombreFertilizante),
      tipo: Value(tipo),
      composicion: Value(composicion),
      porcentaje: Value(porcentaje),
      presentacionPnombreFertilizante: Value(presentacionPnombreFertilizante),
      fechaUltimaActualizacion: fechaUltimaActualizacion == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaUltimaActualizacion),
    );
  }

  factory FertilizanteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FertilizanteData(
      nombreFertilizante:
          serializer.fromJson<String>(json['nombreFertilizante']),
      tipo: serializer.fromJson<String>(json['tipo']),
      composicion: serializer.fromJson<String>(json['composicion']),
      porcentaje: serializer.fromJson<double>(json['porcentaje']),
      presentacionPnombreFertilizante:
          serializer.fromJson<String>(json['presentacionPnombreFertilizante']),
      fechaUltimaActualizacion:
          serializer.fromJson<DateTime?>(json['fechaUltimaActualizacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nombreFertilizante': serializer.toJson<String>(nombreFertilizante),
      'tipo': serializer.toJson<String>(tipo),
      'composicion': serializer.toJson<String>(composicion),
      'porcentaje': serializer.toJson<double>(porcentaje),
      'presentacionPnombreFertilizante':
          serializer.toJson<String>(presentacionPnombreFertilizante),
      'fechaUltimaActualizacion':
          serializer.toJson<DateTime?>(fechaUltimaActualizacion),
    };
  }

  FertilizanteData copyWith(
          {String? nombreFertilizante,
          String? tipo,
          String? composicion,
          double? porcentaje,
          String? presentacionPnombreFertilizante,
          Value<DateTime?> fechaUltimaActualizacion = const Value.absent()}) =>
      FertilizanteData(
        nombreFertilizante: nombreFertilizante ?? this.nombreFertilizante,
        tipo: tipo ?? this.tipo,
        composicion: composicion ?? this.composicion,
        porcentaje: porcentaje ?? this.porcentaje,
        presentacionPnombreFertilizante: presentacionPnombreFertilizante ??
            this.presentacionPnombreFertilizante,
        fechaUltimaActualizacion: fechaUltimaActualizacion.present
            ? fechaUltimaActualizacion.value
            : this.fechaUltimaActualizacion,
      );
  @override
  String toString() {
    return (StringBuffer('FertilizanteData(')
          ..write('nombreFertilizante: $nombreFertilizante, ')
          ..write('tipo: $tipo, ')
          ..write('composicion: $composicion, ')
          ..write('porcentaje: $porcentaje, ')
          ..write(
              'presentacionPnombreFertilizante: $presentacionPnombreFertilizante, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nombreFertilizante, tipo, composicion,
      porcentaje, presentacionPnombreFertilizante, fechaUltimaActualizacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FertilizanteData &&
          other.nombreFertilizante == this.nombreFertilizante &&
          other.tipo == this.tipo &&
          other.composicion == this.composicion &&
          other.porcentaje == this.porcentaje &&
          other.presentacionPnombreFertilizante ==
              this.presentacionPnombreFertilizante &&
          other.fechaUltimaActualizacion == this.fechaUltimaActualizacion);
}

class FertilizanteCompanion extends UpdateCompanion<FertilizanteData> {
  final Value<String> nombreFertilizante;
  final Value<String> tipo;
  final Value<String> composicion;
  final Value<double> porcentaje;
  final Value<String> presentacionPnombreFertilizante;
  final Value<DateTime?> fechaUltimaActualizacion;
  const FertilizanteCompanion({
    this.nombreFertilizante = const Value.absent(),
    this.tipo = const Value.absent(),
    this.composicion = const Value.absent(),
    this.porcentaje = const Value.absent(),
    this.presentacionPnombreFertilizante = const Value.absent(),
    this.fechaUltimaActualizacion = const Value.absent(),
  });
  FertilizanteCompanion.insert({
    required String nombreFertilizante,
    required String tipo,
    required String composicion,
    required double porcentaje,
    required String presentacionPnombreFertilizante,
    this.fechaUltimaActualizacion = const Value.absent(),
  })  : nombreFertilizante = Value(nombreFertilizante),
        tipo = Value(tipo),
        composicion = Value(composicion),
        porcentaje = Value(porcentaje),
        presentacionPnombreFertilizante =
            Value(presentacionPnombreFertilizante);
  static Insertable<FertilizanteData> custom({
    Expression<String>? nombreFertilizante,
    Expression<String>? tipo,
    Expression<String>? composicion,
    Expression<double>? porcentaje,
    Expression<String>? presentacionPnombreFertilizante,
    Expression<DateTime>? fechaUltimaActualizacion,
  }) {
    return RawValuesInsertable({
      if (nombreFertilizante != null) 'nombre_fertilizante': nombreFertilizante,
      if (tipo != null) 'tipo': tipo,
      if (composicion != null) 'composicion': composicion,
      if (porcentaje != null) 'porcentaje': porcentaje,
      if (presentacionPnombreFertilizante != null)
        'presentacion_pnombre_fertilizante': presentacionPnombreFertilizante,
      if (fechaUltimaActualizacion != null)
        'fecha_ultima_actualizacion': fechaUltimaActualizacion,
    });
  }

  FertilizanteCompanion copyWith(
      {Value<String>? nombreFertilizante,
      Value<String>? tipo,
      Value<String>? composicion,
      Value<double>? porcentaje,
      Value<String>? presentacionPnombreFertilizante,
      Value<DateTime?>? fechaUltimaActualizacion}) {
    return FertilizanteCompanion(
      nombreFertilizante: nombreFertilizante ?? this.nombreFertilizante,
      tipo: tipo ?? this.tipo,
      composicion: composicion ?? this.composicion,
      porcentaje: porcentaje ?? this.porcentaje,
      presentacionPnombreFertilizante: presentacionPnombreFertilizante ??
          this.presentacionPnombreFertilizante,
      fechaUltimaActualizacion:
          fechaUltimaActualizacion ?? this.fechaUltimaActualizacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nombreFertilizante.present) {
      map['nombre_fertilizante'] = Variable<String>(nombreFertilizante.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (composicion.present) {
      map['composicion'] = Variable<String>(composicion.value);
    }
    if (porcentaje.present) {
      map['porcentaje'] = Variable<double>(porcentaje.value);
    }
    if (presentacionPnombreFertilizante.present) {
      map['presentacion_pnombre_fertilizante'] =
          Variable<String>(presentacionPnombreFertilizante.value);
    }
    if (fechaUltimaActualizacion.present) {
      map['fecha_ultima_actualizacion'] =
          Variable<DateTime>(fechaUltimaActualizacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FertilizanteCompanion(')
          ..write('nombreFertilizante: $nombreFertilizante, ')
          ..write('tipo: $tipo, ')
          ..write('composicion: $composicion, ')
          ..write('porcentaje: $porcentaje, ')
          ..write(
              'presentacionPnombreFertilizante: $presentacionPnombreFertilizante, ')
          ..write('fechaUltimaActualizacion: $fechaUltimaActualizacion')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $AplicacionesTable aplicaciones = $AplicacionesTable(this);
  late final $CensoTable censo = $CensoTable(this);
  late final $CosechasTable cosechas = $CosechasTable(this);
  late final $CosechaDiariaTable cosechaDiaria = $CosechaDiariaTable(this);
  late final $EnfermedadesTable enfermedades = $EnfermedadesTable(this);
  late final $EtapasTable etapas = $EtapasTable(this);
  late final $EtapasPlagaTable etapasPlaga = $EtapasPlagaTable(this);
  late final $ErradicacionTable erradicacion = $ErradicacionTable(this);
  late final $LotesTable lotes = $LotesTable(this);
  late final $PalmasTable palmas = $PalmasTable(this);
  late final $PlagasTable plagas = $PlagasTable(this);
  late final $PlateosTable plateos = $PlateosTable(this);
  late final $PlateoDiarioTable plateoDiario = $PlateoDiarioTable(this);
  late final $PodasTable podas = $PodasTable(this);
  late final $PodaDiariaTable podaDiaria = $PodaDiariaTable(this);
  late final $ProductoAgroquimicoTable productoAgroquimico =
      $ProductoAgroquimicoTable(this);
  late final $RegistroEnfermedadTable registroEnfermedad =
      $RegistroEnfermedadTable(this);
  late final $ImagenRegistroEnfermedadTable imagenRegistroEnfermedad =
      $ImagenRegistroEnfermedadTable(this);
  late final $RegistroTratamientoTable registroTratamiento =
      $RegistroTratamientoTable(this);
  late final $ViajesTable viajes = $ViajesTable(this);
  late final $CensoEtapasPlagaTable censoEtapasPlaga =
      $CensoEtapasPlagaTable(this);
  late final $ImagenCensoPlagaTable imagenCensoPlaga =
      $ImagenCensoPlagaTable(this);
  late final $PrecipitacionTable precipitacion = $PrecipitacionTable(this);
  late final $FertilizacionesTable fertilizaciones =
      $FertilizacionesTable(this);
  late final $FertilizacionDiariaTable fertilizacionDiaria =
      $FertilizacionDiariaTable(this);
  late final $FertilizanteTable fertilizante = $FertilizanteTable(this);
  late final CosechaDao cosechaDao = CosechaDao(this as AppDatabase);
  late final CosechaDiariaDao cosechaDiariaDao =
      CosechaDiariaDao(this as AppDatabase);
  late final EnfermedadesDao enfermedadesDao =
      EnfermedadesDao(this as AppDatabase);
  late final ErradicacionesDao erradicacionesDao =
      ErradicacionesDao(this as AppDatabase);
  late final FumigacionDao fumigacionDao = FumigacionDao(this as AppDatabase);
  late final LoteDao loteDao = LoteDao(this as AppDatabase);
  late final PalmaDao palmaDao = PalmaDao(this as AppDatabase);
  late final PlagasDao plagasDao = PlagasDao(this as AppDatabase);
  late final PodaDao podaDao = PodaDao(this as AppDatabase);
  late final PlateoDao plateoDao = PlateoDao(this as AppDatabase);
  late final ProductoAgroquimicoDao productoAgroquimicoDao =
      ProductoAgroquimicoDao(this as AppDatabase);
  late final RegistroEnfermedadDao registroEnfermedadDao =
      RegistroEnfermedadDao(this as AppDatabase);
  late final ViajesDao viajesDao = ViajesDao(this as AppDatabase);
  late final FertilizacionDao fertilizacionDao =
      FertilizacionDao(this as AppDatabase);
  late final FertilizanteDao fertilizanteDao =
      FertilizanteDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        aplicaciones,
        censo,
        cosechas,
        cosechaDiaria,
        enfermedades,
        etapas,
        etapasPlaga,
        erradicacion,
        lotes,
        palmas,
        plagas,
        plateos,
        plateoDiario,
        podas,
        podaDiaria,
        productoAgroquimico,
        registroEnfermedad,
        imagenRegistroEnfermedad,
        registroTratamiento,
        viajes,
        censoEtapasPlaga,
        imagenCensoPlaga,
        precipitacion,
        fertilizaciones,
        fertilizacionDiaria,
        fertilizante
      ];
}
