// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Aplicacione extends DataClass implements Insertable<Aplicacione> {
  final int id;
  final double dosis;
  final int area;
  final DateTime fechaAplicacion;
  final DateTime fechaReingreso;
  final String ccUsuario;
  final int idCenso;
  final int idProductoAgroquimico;
  Aplicacione(
      {required this.id,
      required this.dosis,
      required this.area,
      required this.fechaAplicacion,
      required this.fechaReingreso,
      required this.ccUsuario,
      required this.idCenso,
      required this.idProductoAgroquimico});
  factory Aplicacione.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Aplicacione(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      dosis: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dosis'])!,
      area: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}area'])!,
      fechaAplicacion: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_aplicacion'])!,
      fechaReingreso: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_reingreso'])!,
      ccUsuario: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cc_usuario'])!,
      idCenso: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_censo'])!,
      idProductoAgroquimico: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_producto_agroquimico'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['dosis'] = Variable<double>(dosis);
    map['area'] = Variable<int>(area);
    map['fecha_aplicacion'] = Variable<DateTime>(fechaAplicacion);
    map['fecha_reingreso'] = Variable<DateTime>(fechaReingreso);
    map['cc_usuario'] = Variable<String>(ccUsuario);
    map['id_censo'] = Variable<int>(idCenso);
    map['id_producto_agroquimico'] = Variable<int>(idProductoAgroquimico);
    return map;
  }

  AplicacionesCompanion toCompanion(bool nullToAbsent) {
    return AplicacionesCompanion(
      id: Value(id),
      dosis: Value(dosis),
      area: Value(area),
      fechaAplicacion: Value(fechaAplicacion),
      fechaReingreso: Value(fechaReingreso),
      ccUsuario: Value(ccUsuario),
      idCenso: Value(idCenso),
      idProductoAgroquimico: Value(idProductoAgroquimico),
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
      ccUsuario: serializer.fromJson<String>(json['ccUsuario']),
      idCenso: serializer.fromJson<int>(json['idCenso']),
      idProductoAgroquimico:
          serializer.fromJson<int>(json['idProductoAgroquimico']),
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
      'ccUsuario': serializer.toJson<String>(ccUsuario),
      'idCenso': serializer.toJson<int>(idCenso),
      'idProductoAgroquimico': serializer.toJson<int>(idProductoAgroquimico),
    };
  }

  Aplicacione copyWith(
          {int? id,
          double? dosis,
          int? area,
          DateTime? fechaAplicacion,
          DateTime? fechaReingreso,
          String? ccUsuario,
          int? idCenso,
          int? idProductoAgroquimico}) =>
      Aplicacione(
        id: id ?? this.id,
        dosis: dosis ?? this.dosis,
        area: area ?? this.area,
        fechaAplicacion: fechaAplicacion ?? this.fechaAplicacion,
        fechaReingreso: fechaReingreso ?? this.fechaReingreso,
        ccUsuario: ccUsuario ?? this.ccUsuario,
        idCenso: idCenso ?? this.idCenso,
        idProductoAgroquimico:
            idProductoAgroquimico ?? this.idProductoAgroquimico,
      );
  @override
  String toString() {
    return (StringBuffer('Aplicacione(')
          ..write('id: $id, ')
          ..write('dosis: $dosis, ')
          ..write('area: $area, ')
          ..write('fechaAplicacion: $fechaAplicacion, ')
          ..write('fechaReingreso: $fechaReingreso, ')
          ..write('ccUsuario: $ccUsuario, ')
          ..write('idCenso: $idCenso, ')
          ..write('idProductoAgroquimico: $idProductoAgroquimico')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dosis, area, fechaAplicacion,
      fechaReingreso, ccUsuario, idCenso, idProductoAgroquimico);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Aplicacione &&
          other.id == this.id &&
          other.dosis == this.dosis &&
          other.area == this.area &&
          other.fechaAplicacion == this.fechaAplicacion &&
          other.fechaReingreso == this.fechaReingreso &&
          other.ccUsuario == this.ccUsuario &&
          other.idCenso == this.idCenso &&
          other.idProductoAgroquimico == this.idProductoAgroquimico);
}

class AplicacionesCompanion extends UpdateCompanion<Aplicacione> {
  final Value<int> id;
  final Value<double> dosis;
  final Value<int> area;
  final Value<DateTime> fechaAplicacion;
  final Value<DateTime> fechaReingreso;
  final Value<String> ccUsuario;
  final Value<int> idCenso;
  final Value<int> idProductoAgroquimico;
  const AplicacionesCompanion({
    this.id = const Value.absent(),
    this.dosis = const Value.absent(),
    this.area = const Value.absent(),
    this.fechaAplicacion = const Value.absent(),
    this.fechaReingreso = const Value.absent(),
    this.ccUsuario = const Value.absent(),
    this.idCenso = const Value.absent(),
    this.idProductoAgroquimico = const Value.absent(),
  });
  AplicacionesCompanion.insert({
    this.id = const Value.absent(),
    required double dosis,
    required int area,
    required DateTime fechaAplicacion,
    required DateTime fechaReingreso,
    required String ccUsuario,
    required int idCenso,
    required int idProductoAgroquimico,
  })  : dosis = Value(dosis),
        area = Value(area),
        fechaAplicacion = Value(fechaAplicacion),
        fechaReingreso = Value(fechaReingreso),
        ccUsuario = Value(ccUsuario),
        idCenso = Value(idCenso),
        idProductoAgroquimico = Value(idProductoAgroquimico);
  static Insertable<Aplicacione> custom({
    Expression<int>? id,
    Expression<double>? dosis,
    Expression<int>? area,
    Expression<DateTime>? fechaAplicacion,
    Expression<DateTime>? fechaReingreso,
    Expression<String>? ccUsuario,
    Expression<int>? idCenso,
    Expression<int>? idProductoAgroquimico,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dosis != null) 'dosis': dosis,
      if (area != null) 'area': area,
      if (fechaAplicacion != null) 'fecha_aplicacion': fechaAplicacion,
      if (fechaReingreso != null) 'fecha_reingreso': fechaReingreso,
      if (ccUsuario != null) 'cc_usuario': ccUsuario,
      if (idCenso != null) 'id_censo': idCenso,
      if (idProductoAgroquimico != null)
        'id_producto_agroquimico': idProductoAgroquimico,
    });
  }

  AplicacionesCompanion copyWith(
      {Value<int>? id,
      Value<double>? dosis,
      Value<int>? area,
      Value<DateTime>? fechaAplicacion,
      Value<DateTime>? fechaReingreso,
      Value<String>? ccUsuario,
      Value<int>? idCenso,
      Value<int>? idProductoAgroquimico}) {
    return AplicacionesCompanion(
      id: id ?? this.id,
      dosis: dosis ?? this.dosis,
      area: area ?? this.area,
      fechaAplicacion: fechaAplicacion ?? this.fechaAplicacion,
      fechaReingreso: fechaReingreso ?? this.fechaReingreso,
      ccUsuario: ccUsuario ?? this.ccUsuario,
      idCenso: idCenso ?? this.idCenso,
      idProductoAgroquimico:
          idProductoAgroquimico ?? this.idProductoAgroquimico,
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
    if (ccUsuario.present) {
      map['cc_usuario'] = Variable<String>(ccUsuario.value);
    }
    if (idCenso.present) {
      map['id_censo'] = Variable<int>(idCenso.value);
    }
    if (idProductoAgroquimico.present) {
      map['id_producto_agroquimico'] =
          Variable<int>(idProductoAgroquimico.value);
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
          ..write('ccUsuario: $ccUsuario, ')
          ..write('idCenso: $idCenso, ')
          ..write('idProductoAgroquimico: $idProductoAgroquimico')
          ..write(')'))
        .toString();
  }
}

class $AplicacionesTable extends Aplicaciones
    with TableInfo<$AplicacionesTable, Aplicacione> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AplicacionesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dosisMeta = const VerificationMeta('dosis');
  late final GeneratedColumn<double?> dosis = GeneratedColumn<double?>(
      'dosis', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _areaMeta = const VerificationMeta('area');
  late final GeneratedColumn<int?> area = GeneratedColumn<int?>(
      'area', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _fechaAplicacionMeta =
      const VerificationMeta('fechaAplicacion');
  late final GeneratedColumn<DateTime?> fechaAplicacion =
      GeneratedColumn<DateTime?>('fecha_aplicacion', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _fechaReingresoMeta =
      const VerificationMeta('fechaReingreso');
  late final GeneratedColumn<DateTime?> fechaReingreso =
      GeneratedColumn<DateTime?>('fecha_reingreso', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _ccUsuarioMeta = const VerificationMeta('ccUsuario');
  late final GeneratedColumn<String?> ccUsuario = GeneratedColumn<String?>(
      'cc_usuario', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idCensoMeta = const VerificationMeta('idCenso');
  late final GeneratedColumn<int?> idCenso = GeneratedColumn<int?>(
      'id_censo', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES censo(id)');
  final VerificationMeta _idProductoAgroquimicoMeta =
      const VerificationMeta('idProductoAgroquimico');
  late final GeneratedColumn<int?> idProductoAgroquimico =
      GeneratedColumn<int?>('id_producto_agroquimico', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: true,
          $customConstraints: 'REFERENCES producto_agroquimico(id)');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        dosis,
        area,
        fechaAplicacion,
        fechaReingreso,
        ccUsuario,
        idCenso,
        idProductoAgroquimico
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
    if (data.containsKey('cc_usuario')) {
      context.handle(_ccUsuarioMeta,
          ccUsuario.isAcceptableOrUnknown(data['cc_usuario']!, _ccUsuarioMeta));
    } else if (isInserting) {
      context.missing(_ccUsuarioMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Aplicacione map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Aplicacione.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AplicacionesTable createAlias(String alias) {
    return $AplicacionesTable(_db, alias);
  }
}

class CensoData extends DataClass implements Insertable<CensoData> {
  final int idCenso;
  final DateTime fechaCenso;
  final bool presenciaLote;
  final bool presenciaSector;
  final int lineaLimite1;
  final int lineaLimite2;
  final String? observacionCenso;
  final String nombreLote;
  final String nombrePlaga;
  final String estadoPlaga;
  CensoData(
      {required this.idCenso,
      required this.fechaCenso,
      required this.presenciaLote,
      required this.presenciaSector,
      required this.lineaLimite1,
      required this.lineaLimite2,
      this.observacionCenso,
      required this.nombreLote,
      required this.nombrePlaga,
      required this.estadoPlaga});
  factory CensoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CensoData(
      idCenso: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_censo'])!,
      fechaCenso: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_censo'])!,
      presenciaLote: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}presencia_lote'])!,
      presenciaSector: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}presencia_sector'])!,
      lineaLimite1: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}linea_limite1'])!,
      lineaLimite2: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}linea_limite2'])!,
      observacionCenso: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}observacion_censo']),
      nombreLote: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_lote'])!,
      nombrePlaga: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_plaga'])!,
      estadoPlaga: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado_plaga'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_censo'] = Variable<int>(idCenso);
    map['fecha_censo'] = Variable<DateTime>(fechaCenso);
    map['presencia_lote'] = Variable<bool>(presenciaLote);
    map['presencia_sector'] = Variable<bool>(presenciaSector);
    map['linea_limite1'] = Variable<int>(lineaLimite1);
    map['linea_limite2'] = Variable<int>(lineaLimite2);
    if (!nullToAbsent || observacionCenso != null) {
      map['observacion_censo'] = Variable<String?>(observacionCenso);
    }
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['nombre_plaga'] = Variable<String>(nombrePlaga);
    map['estado_plaga'] = Variable<String>(estadoPlaga);
    return map;
  }

  CensoCompanion toCompanion(bool nullToAbsent) {
    return CensoCompanion(
      idCenso: Value(idCenso),
      fechaCenso: Value(fechaCenso),
      presenciaLote: Value(presenciaLote),
      presenciaSector: Value(presenciaSector),
      lineaLimite1: Value(lineaLimite1),
      lineaLimite2: Value(lineaLimite2),
      observacionCenso: observacionCenso == null && nullToAbsent
          ? const Value.absent()
          : Value(observacionCenso),
      nombreLote: Value(nombreLote),
      nombrePlaga: Value(nombrePlaga),
      estadoPlaga: Value(estadoPlaga),
    );
  }

  factory CensoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CensoData(
      idCenso: serializer.fromJson<int>(json['idCenso']),
      fechaCenso: serializer.fromJson<DateTime>(json['fechaCenso']),
      presenciaLote: serializer.fromJson<bool>(json['presenciaLote']),
      presenciaSector: serializer.fromJson<bool>(json['presenciaSector']),
      lineaLimite1: serializer.fromJson<int>(json['lineaLimite1']),
      lineaLimite2: serializer.fromJson<int>(json['lineaLimite2']),
      observacionCenso: serializer.fromJson<String?>(json['observacionCenso']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      nombrePlaga: serializer.fromJson<String>(json['nombrePlaga']),
      estadoPlaga: serializer.fromJson<String>(json['estadoPlaga']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idCenso': serializer.toJson<int>(idCenso),
      'fechaCenso': serializer.toJson<DateTime>(fechaCenso),
      'presenciaLote': serializer.toJson<bool>(presenciaLote),
      'presenciaSector': serializer.toJson<bool>(presenciaSector),
      'lineaLimite1': serializer.toJson<int>(lineaLimite1),
      'lineaLimite2': serializer.toJson<int>(lineaLimite2),
      'observacionCenso': serializer.toJson<String?>(observacionCenso),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'nombrePlaga': serializer.toJson<String>(nombrePlaga),
      'estadoPlaga': serializer.toJson<String>(estadoPlaga),
    };
  }

  CensoData copyWith(
          {int? idCenso,
          DateTime? fechaCenso,
          bool? presenciaLote,
          bool? presenciaSector,
          int? lineaLimite1,
          int? lineaLimite2,
          String? observacionCenso,
          String? nombreLote,
          String? nombrePlaga,
          String? estadoPlaga}) =>
      CensoData(
        idCenso: idCenso ?? this.idCenso,
        fechaCenso: fechaCenso ?? this.fechaCenso,
        presenciaLote: presenciaLote ?? this.presenciaLote,
        presenciaSector: presenciaSector ?? this.presenciaSector,
        lineaLimite1: lineaLimite1 ?? this.lineaLimite1,
        lineaLimite2: lineaLimite2 ?? this.lineaLimite2,
        observacionCenso: observacionCenso ?? this.observacionCenso,
        nombreLote: nombreLote ?? this.nombreLote,
        nombrePlaga: nombrePlaga ?? this.nombrePlaga,
        estadoPlaga: estadoPlaga ?? this.estadoPlaga,
      );
  @override
  String toString() {
    return (StringBuffer('CensoData(')
          ..write('idCenso: $idCenso, ')
          ..write('fechaCenso: $fechaCenso, ')
          ..write('presenciaLote: $presenciaLote, ')
          ..write('presenciaSector: $presenciaSector, ')
          ..write('lineaLimite1: $lineaLimite1, ')
          ..write('lineaLimite2: $lineaLimite2, ')
          ..write('observacionCenso: $observacionCenso, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('nombrePlaga: $nombrePlaga, ')
          ..write('estadoPlaga: $estadoPlaga')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idCenso,
      fechaCenso,
      presenciaLote,
      presenciaSector,
      lineaLimite1,
      lineaLimite2,
      observacionCenso,
      nombreLote,
      nombrePlaga,
      estadoPlaga);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CensoData &&
          other.idCenso == this.idCenso &&
          other.fechaCenso == this.fechaCenso &&
          other.presenciaLote == this.presenciaLote &&
          other.presenciaSector == this.presenciaSector &&
          other.lineaLimite1 == this.lineaLimite1 &&
          other.lineaLimite2 == this.lineaLimite2 &&
          other.observacionCenso == this.observacionCenso &&
          other.nombreLote == this.nombreLote &&
          other.nombrePlaga == this.nombrePlaga &&
          other.estadoPlaga == this.estadoPlaga);
}

class CensoCompanion extends UpdateCompanion<CensoData> {
  final Value<int> idCenso;
  final Value<DateTime> fechaCenso;
  final Value<bool> presenciaLote;
  final Value<bool> presenciaSector;
  final Value<int> lineaLimite1;
  final Value<int> lineaLimite2;
  final Value<String?> observacionCenso;
  final Value<String> nombreLote;
  final Value<String> nombrePlaga;
  final Value<String> estadoPlaga;
  const CensoCompanion({
    this.idCenso = const Value.absent(),
    this.fechaCenso = const Value.absent(),
    this.presenciaLote = const Value.absent(),
    this.presenciaSector = const Value.absent(),
    this.lineaLimite1 = const Value.absent(),
    this.lineaLimite2 = const Value.absent(),
    this.observacionCenso = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.nombrePlaga = const Value.absent(),
    this.estadoPlaga = const Value.absent(),
  });
  CensoCompanion.insert({
    this.idCenso = const Value.absent(),
    required DateTime fechaCenso,
    this.presenciaLote = const Value.absent(),
    this.presenciaSector = const Value.absent(),
    required int lineaLimite1,
    required int lineaLimite2,
    this.observacionCenso = const Value.absent(),
    required String nombreLote,
    required String nombrePlaga,
    this.estadoPlaga = const Value.absent(),
  })  : fechaCenso = Value(fechaCenso),
        lineaLimite1 = Value(lineaLimite1),
        lineaLimite2 = Value(lineaLimite2),
        nombreLote = Value(nombreLote),
        nombrePlaga = Value(nombrePlaga);
  static Insertable<CensoData> custom({
    Expression<int>? idCenso,
    Expression<DateTime>? fechaCenso,
    Expression<bool>? presenciaLote,
    Expression<bool>? presenciaSector,
    Expression<int>? lineaLimite1,
    Expression<int>? lineaLimite2,
    Expression<String?>? observacionCenso,
    Expression<String>? nombreLote,
    Expression<String>? nombrePlaga,
    Expression<String>? estadoPlaga,
  }) {
    return RawValuesInsertable({
      if (idCenso != null) 'id_censo': idCenso,
      if (fechaCenso != null) 'fecha_censo': fechaCenso,
      if (presenciaLote != null) 'presencia_lote': presenciaLote,
      if (presenciaSector != null) 'presencia_sector': presenciaSector,
      if (lineaLimite1 != null) 'linea_limite1': lineaLimite1,
      if (lineaLimite2 != null) 'linea_limite2': lineaLimite2,
      if (observacionCenso != null) 'observacion_censo': observacionCenso,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (nombrePlaga != null) 'nombre_plaga': nombrePlaga,
      if (estadoPlaga != null) 'estado_plaga': estadoPlaga,
    });
  }

  CensoCompanion copyWith(
      {Value<int>? idCenso,
      Value<DateTime>? fechaCenso,
      Value<bool>? presenciaLote,
      Value<bool>? presenciaSector,
      Value<int>? lineaLimite1,
      Value<int>? lineaLimite2,
      Value<String?>? observacionCenso,
      Value<String>? nombreLote,
      Value<String>? nombrePlaga,
      Value<String>? estadoPlaga}) {
    return CensoCompanion(
      idCenso: idCenso ?? this.idCenso,
      fechaCenso: fechaCenso ?? this.fechaCenso,
      presenciaLote: presenciaLote ?? this.presenciaLote,
      presenciaSector: presenciaSector ?? this.presenciaSector,
      lineaLimite1: lineaLimite1 ?? this.lineaLimite1,
      lineaLimite2: lineaLimite2 ?? this.lineaLimite2,
      observacionCenso: observacionCenso ?? this.observacionCenso,
      nombreLote: nombreLote ?? this.nombreLote,
      nombrePlaga: nombrePlaga ?? this.nombrePlaga,
      estadoPlaga: estadoPlaga ?? this.estadoPlaga,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idCenso.present) {
      map['id_censo'] = Variable<int>(idCenso.value);
    }
    if (fechaCenso.present) {
      map['fecha_censo'] = Variable<DateTime>(fechaCenso.value);
    }
    if (presenciaLote.present) {
      map['presencia_lote'] = Variable<bool>(presenciaLote.value);
    }
    if (presenciaSector.present) {
      map['presencia_sector'] = Variable<bool>(presenciaSector.value);
    }
    if (lineaLimite1.present) {
      map['linea_limite1'] = Variable<int>(lineaLimite1.value);
    }
    if (lineaLimite2.present) {
      map['linea_limite2'] = Variable<int>(lineaLimite2.value);
    }
    if (observacionCenso.present) {
      map['observacion_censo'] = Variable<String?>(observacionCenso.value);
    }
    if (nombreLote.present) {
      map['nombre_lote'] = Variable<String>(nombreLote.value);
    }
    if (nombrePlaga.present) {
      map['nombre_plaga'] = Variable<String>(nombrePlaga.value);
    }
    if (estadoPlaga.present) {
      map['estado_plaga'] = Variable<String>(estadoPlaga.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CensoCompanion(')
          ..write('idCenso: $idCenso, ')
          ..write('fechaCenso: $fechaCenso, ')
          ..write('presenciaLote: $presenciaLote, ')
          ..write('presenciaSector: $presenciaSector, ')
          ..write('lineaLimite1: $lineaLimite1, ')
          ..write('lineaLimite2: $lineaLimite2, ')
          ..write('observacionCenso: $observacionCenso, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('nombrePlaga: $nombrePlaga, ')
          ..write('estadoPlaga: $estadoPlaga')
          ..write(')'))
        .toString();
  }
}

class $CensoTable extends Censo with TableInfo<$CensoTable, CensoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CensoTable(this._db, [this._alias]);
  final VerificationMeta _idCensoMeta = const VerificationMeta('idCenso');
  late final GeneratedColumn<int?> idCenso = GeneratedColumn<int?>(
      'id_censo', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _fechaCensoMeta = const VerificationMeta('fechaCenso');
  late final GeneratedColumn<DateTime?> fechaCenso = GeneratedColumn<DateTime?>(
      'fecha_censo', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _presenciaLoteMeta =
      const VerificationMeta('presenciaLote');
  late final GeneratedColumn<bool?> presenciaLote = GeneratedColumn<bool?>(
      'presencia_lote', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (presencia_lote IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _presenciaSectorMeta =
      const VerificationMeta('presenciaSector');
  late final GeneratedColumn<bool?> presenciaSector = GeneratedColumn<bool?>(
      'presencia_sector', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (presencia_sector IN (0, 1))',
      defaultValue: Constant(true));
  final VerificationMeta _lineaLimite1Meta =
      const VerificationMeta('lineaLimite1');
  late final GeneratedColumn<int?> lineaLimite1 = GeneratedColumn<int?>(
      'linea_limite1', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _lineaLimite2Meta =
      const VerificationMeta('lineaLimite2');
  late final GeneratedColumn<int?> lineaLimite2 = GeneratedColumn<int?>(
      'linea_limite2', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _observacionCensoMeta =
      const VerificationMeta('observacionCenso');
  late final GeneratedColumn<String?> observacionCenso =
      GeneratedColumn<String?>('observacion_censo', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _nombreLoteMeta = const VerificationMeta('nombreLote');
  late final GeneratedColumn<String?> nombreLote = GeneratedColumn<String?>(
      'nombre_lote', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nombrePlagaMeta =
      const VerificationMeta('nombrePlaga');
  late final GeneratedColumn<String?> nombrePlaga = GeneratedColumn<String?>(
      'nombre_plaga', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _estadoPlagaMeta =
      const VerificationMeta('estadoPlaga');
  late final GeneratedColumn<String?> estadoPlaga = GeneratedColumn<String?>(
      'estado_plaga', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant('pendiente'));
  @override
  List<GeneratedColumn> get $columns => [
        idCenso,
        fechaCenso,
        presenciaLote,
        presenciaSector,
        lineaLimite1,
        lineaLimite2,
        observacionCenso,
        nombreLote,
        nombrePlaga,
        estadoPlaga
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
    if (data.containsKey('presencia_lote')) {
      context.handle(
          _presenciaLoteMeta,
          presenciaLote.isAcceptableOrUnknown(
              data['presencia_lote']!, _presenciaLoteMeta));
    }
    if (data.containsKey('presencia_sector')) {
      context.handle(
          _presenciaSectorMeta,
          presenciaSector.isAcceptableOrUnknown(
              data['presencia_sector']!, _presenciaSectorMeta));
    }
    if (data.containsKey('linea_limite1')) {
      context.handle(
          _lineaLimite1Meta,
          lineaLimite1.isAcceptableOrUnknown(
              data['linea_limite1']!, _lineaLimite1Meta));
    } else if (isInserting) {
      context.missing(_lineaLimite1Meta);
    }
    if (data.containsKey('linea_limite2')) {
      context.handle(
          _lineaLimite2Meta,
          lineaLimite2.isAcceptableOrUnknown(
              data['linea_limite2']!, _lineaLimite2Meta));
    } else if (isInserting) {
      context.missing(_lineaLimite2Meta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idCenso};
  @override
  CensoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CensoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CensoTable createAlias(String alias) {
    return $CensoTable(_db, alias);
  }
}

class Cosecha extends DataClass implements Insertable<Cosecha> {
  final int id;
  final String nombreLote;
  final DateTime fechaIngreso;
  final DateTime? fechaSalida;
  final int cantidadRacimos;
  final int kilos;
  final int? idViaje;
  final bool completada;
  Cosecha(
      {required this.id,
      required this.nombreLote,
      required this.fechaIngreso,
      this.fechaSalida,
      required this.cantidadRacimos,
      required this.kilos,
      this.idViaje,
      required this.completada});
  factory Cosecha.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Cosecha(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nombreLote: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_lote'])!,
      fechaIngreso: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_ingreso'])!,
      fechaSalida: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_salida']),
      cantidadRacimos: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cantidad_racimos'])!,
      kilos: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}kilos'])!,
      idViaje: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_viaje']),
      completada: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completada'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    if (!nullToAbsent || fechaSalida != null) {
      map['fecha_salida'] = Variable<DateTime?>(fechaSalida);
    }
    map['cantidad_racimos'] = Variable<int>(cantidadRacimos);
    map['kilos'] = Variable<int>(kilos);
    if (!nullToAbsent || idViaje != null) {
      map['id_viaje'] = Variable<int?>(idViaje);
    }
    map['completada'] = Variable<bool>(completada);
    return map;
  }

  CosechasCompanion toCompanion(bool nullToAbsent) {
    return CosechasCompanion(
      id: Value(id),
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
    );
  }

  factory Cosecha.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cosecha(
      id: serializer.fromJson<int>(json['id']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      fechaSalida: serializer.fromJson<DateTime?>(json['fechaSalida']),
      cantidadRacimos: serializer.fromJson<int>(json['cantidadRacimos']),
      kilos: serializer.fromJson<int>(json['kilos']),
      idViaje: serializer.fromJson<int?>(json['idViaje']),
      completada: serializer.fromJson<bool>(json['completada']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'fechaSalida': serializer.toJson<DateTime?>(fechaSalida),
      'cantidadRacimos': serializer.toJson<int>(cantidadRacimos),
      'kilos': serializer.toJson<int>(kilos),
      'idViaje': serializer.toJson<int?>(idViaje),
      'completada': serializer.toJson<bool>(completada),
    };
  }

  Cosecha copyWith(
          {int? id,
          String? nombreLote,
          DateTime? fechaIngreso,
          DateTime? fechaSalida,
          int? cantidadRacimos,
          int? kilos,
          int? idViaje,
          bool? completada}) =>
      Cosecha(
        id: id ?? this.id,
        nombreLote: nombreLote ?? this.nombreLote,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        fechaSalida: fechaSalida ?? this.fechaSalida,
        cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
        kilos: kilos ?? this.kilos,
        idViaje: idViaje ?? this.idViaje,
        completada: completada ?? this.completada,
      );
  @override
  String toString() {
    return (StringBuffer('Cosecha(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('kilos: $kilos, ')
          ..write('idViaje: $idViaje, ')
          ..write('completada: $completada')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombreLote, fechaIngreso, fechaSalida,
      cantidadRacimos, kilos, idViaje, completada);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cosecha &&
          other.id == this.id &&
          other.nombreLote == this.nombreLote &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaSalida == this.fechaSalida &&
          other.cantidadRacimos == this.cantidadRacimos &&
          other.kilos == this.kilos &&
          other.idViaje == this.idViaje &&
          other.completada == this.completada);
}

class CosechasCompanion extends UpdateCompanion<Cosecha> {
  final Value<int> id;
  final Value<String> nombreLote;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaSalida;
  final Value<int> cantidadRacimos;
  final Value<int> kilos;
  final Value<int?> idViaje;
  final Value<bool> completada;
  const CosechasCompanion({
    this.id = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.cantidadRacimos = const Value.absent(),
    this.kilos = const Value.absent(),
    this.idViaje = const Value.absent(),
    this.completada = const Value.absent(),
  });
  CosechasCompanion.insert({
    this.id = const Value.absent(),
    required String nombreLote,
    required DateTime fechaIngreso,
    this.fechaSalida = const Value.absent(),
    required int cantidadRacimos,
    required int kilos,
    this.idViaje = const Value.absent(),
    this.completada = const Value.absent(),
  })  : nombreLote = Value(nombreLote),
        fechaIngreso = Value(fechaIngreso),
        cantidadRacimos = Value(cantidadRacimos),
        kilos = Value(kilos);
  static Insertable<Cosecha> custom({
    Expression<int>? id,
    Expression<String>? nombreLote,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime?>? fechaSalida,
    Expression<int>? cantidadRacimos,
    Expression<int>? kilos,
    Expression<int?>? idViaje,
    Expression<bool>? completada,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (cantidadRacimos != null) 'cantidad_racimos': cantidadRacimos,
      if (kilos != null) 'kilos': kilos,
      if (idViaje != null) 'id_viaje': idViaje,
      if (completada != null) 'completada': completada,
    });
  }

  CosechasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nombreLote,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? fechaSalida,
      Value<int>? cantidadRacimos,
      Value<int>? kilos,
      Value<int?>? idViaje,
      Value<bool>? completada}) {
    return CosechasCompanion(
      id: id ?? this.id,
      nombreLote: nombreLote ?? this.nombreLote,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
      kilos: kilos ?? this.kilos,
      idViaje: idViaje ?? this.idViaje,
      completada: completada ?? this.completada,
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
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (fechaSalida.present) {
      map['fecha_salida'] = Variable<DateTime?>(fechaSalida.value);
    }
    if (cantidadRacimos.present) {
      map['cantidad_racimos'] = Variable<int>(cantidadRacimos.value);
    }
    if (kilos.present) {
      map['kilos'] = Variable<int>(kilos.value);
    }
    if (idViaje.present) {
      map['id_viaje'] = Variable<int?>(idViaje.value);
    }
    if (completada.present) {
      map['completada'] = Variable<bool>(completada.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CosechasCompanion(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('kilos: $kilos, ')
          ..write('idViaje: $idViaje, ')
          ..write('completada: $completada')
          ..write(')'))
        .toString();
  }
}

class $CosechasTable extends Cosechas with TableInfo<$CosechasTable, Cosecha> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CosechasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nombreLoteMeta = const VerificationMeta('nombreLote');
  late final GeneratedColumn<String?> nombreLote = GeneratedColumn<String?>(
      'nombre_lote', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  late final GeneratedColumn<DateTime?> fechaIngreso =
      GeneratedColumn<DateTime?>('fecha_ingreso', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _fechaSalidaMeta =
      const VerificationMeta('fechaSalida');
  late final GeneratedColumn<DateTime?> fechaSalida =
      GeneratedColumn<DateTime?>('fecha_salida', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _cantidadRacimosMeta =
      const VerificationMeta('cantidadRacimos');
  late final GeneratedColumn<int?> cantidadRacimos = GeneratedColumn<int?>(
      'cantidad_racimos', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _kilosMeta = const VerificationMeta('kilos');
  late final GeneratedColumn<int?> kilos = GeneratedColumn<int?>(
      'kilos', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _idViajeMeta = const VerificationMeta('idViaje');
  late final GeneratedColumn<int?> idViaje = GeneratedColumn<int?>(
      'id_viaje', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _completadaMeta = const VerificationMeta('completada');
  late final GeneratedColumn<bool?> completada = GeneratedColumn<bool?>(
      'completada', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (completada IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nombreLote,
        fechaIngreso,
        fechaSalida,
        cantidadRacimos,
        kilos,
        idViaje,
        completada
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cosecha map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Cosecha.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CosechasTable createAlias(String alias) {
    return $CosechasTable(_db, alias);
  }
}

class CosechaDiariaData extends DataClass
    implements Insertable<CosechaDiariaData> {
  final int id;
  final int idCosecha;
  final DateTime fechaIngreso;
  final int kilos;
  final int cantidadRacimos;
  CosechaDiariaData(
      {required this.id,
      required this.idCosecha,
      required this.fechaIngreso,
      required this.kilos,
      required this.cantidadRacimos});
  factory CosechaDiariaData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CosechaDiariaData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idCosecha: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_cosecha'])!,
      fechaIngreso: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_ingreso'])!,
      kilos: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}kilos'])!,
      cantidadRacimos: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cantidad_racimos'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_cosecha'] = Variable<int>(idCosecha);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    map['kilos'] = Variable<int>(kilos);
    map['cantidad_racimos'] = Variable<int>(cantidadRacimos);
    return map;
  }

  CosechaDiariaCompanion toCompanion(bool nullToAbsent) {
    return CosechaDiariaCompanion(
      id: Value(id),
      idCosecha: Value(idCosecha),
      fechaIngreso: Value(fechaIngreso),
      kilos: Value(kilos),
      cantidadRacimos: Value(cantidadRacimos),
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
    };
  }

  CosechaDiariaData copyWith(
          {int? id,
          int? idCosecha,
          DateTime? fechaIngreso,
          int? kilos,
          int? cantidadRacimos}) =>
      CosechaDiariaData(
        id: id ?? this.id,
        idCosecha: idCosecha ?? this.idCosecha,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        kilos: kilos ?? this.kilos,
        cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
      );
  @override
  String toString() {
    return (StringBuffer('CosechaDiariaData(')
          ..write('id: $id, ')
          ..write('idCosecha: $idCosecha, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('kilos: $kilos, ')
          ..write('cantidadRacimos: $cantidadRacimos')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idCosecha, fechaIngreso, kilos, cantidadRacimos);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CosechaDiariaData &&
          other.id == this.id &&
          other.idCosecha == this.idCosecha &&
          other.fechaIngreso == this.fechaIngreso &&
          other.kilos == this.kilos &&
          other.cantidadRacimos == this.cantidadRacimos);
}

class CosechaDiariaCompanion extends UpdateCompanion<CosechaDiariaData> {
  final Value<int> id;
  final Value<int> idCosecha;
  final Value<DateTime> fechaIngreso;
  final Value<int> kilos;
  final Value<int> cantidadRacimos;
  const CosechaDiariaCompanion({
    this.id = const Value.absent(),
    this.idCosecha = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.kilos = const Value.absent(),
    this.cantidadRacimos = const Value.absent(),
  });
  CosechaDiariaCompanion.insert({
    this.id = const Value.absent(),
    required int idCosecha,
    required DateTime fechaIngreso,
    required int kilos,
    required int cantidadRacimos,
  })  : idCosecha = Value(idCosecha),
        fechaIngreso = Value(fechaIngreso),
        kilos = Value(kilos),
        cantidadRacimos = Value(cantidadRacimos);
  static Insertable<CosechaDiariaData> custom({
    Expression<int>? id,
    Expression<int>? idCosecha,
    Expression<DateTime>? fechaIngreso,
    Expression<int>? kilos,
    Expression<int>? cantidadRacimos,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCosecha != null) 'id_cosecha': idCosecha,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (kilos != null) 'kilos': kilos,
      if (cantidadRacimos != null) 'cantidad_racimos': cantidadRacimos,
    });
  }

  CosechaDiariaCompanion copyWith(
      {Value<int>? id,
      Value<int>? idCosecha,
      Value<DateTime>? fechaIngreso,
      Value<int>? kilos,
      Value<int>? cantidadRacimos}) {
    return CosechaDiariaCompanion(
      id: id ?? this.id,
      idCosecha: idCosecha ?? this.idCosecha,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      kilos: kilos ?? this.kilos,
      cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CosechaDiariaCompanion(')
          ..write('id: $id, ')
          ..write('idCosecha: $idCosecha, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('kilos: $kilos, ')
          ..write('cantidadRacimos: $cantidadRacimos')
          ..write(')'))
        .toString();
  }
}

class $CosechaDiariaTable extends CosechaDiaria
    with TableInfo<$CosechaDiariaTable, CosechaDiariaData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CosechaDiariaTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idCosechaMeta = const VerificationMeta('idCosecha');
  late final GeneratedColumn<int?> idCosecha = GeneratedColumn<int?>(
      'id_cosecha', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES cosechas(id)');
  final VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  late final GeneratedColumn<DateTime?> fechaIngreso =
      GeneratedColumn<DateTime?>('fecha_ingreso', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _kilosMeta = const VerificationMeta('kilos');
  late final GeneratedColumn<int?> kilos = GeneratedColumn<int?>(
      'kilos', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _cantidadRacimosMeta =
      const VerificationMeta('cantidadRacimos');
  late final GeneratedColumn<int?> cantidadRacimos = GeneratedColumn<int?>(
      'cantidad_racimos', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idCosecha, fechaIngreso, kilos, cantidadRacimos];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CosechaDiariaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CosechaDiariaData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CosechaDiariaTable createAlias(String alias) {
    return $CosechaDiariaTable(_db, alias);
  }
}

class Enfermedade extends DataClass implements Insertable<Enfermedade> {
  final String nombreEnfermedad;
  final String procedimientoEnfermedad;
  Enfermedade(
      {required this.nombreEnfermedad, required this.procedimientoEnfermedad});
  factory Enfermedade.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Enfermedade(
      nombreEnfermedad: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}nombre_enfermedad'])!,
      procedimientoEnfermedad: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}procedimiento_enfermedad'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nombre_enfermedad'] = Variable<String>(nombreEnfermedad);
    map['procedimiento_enfermedad'] = Variable<String>(procedimientoEnfermedad);
    return map;
  }

  EnfermedadesCompanion toCompanion(bool nullToAbsent) {
    return EnfermedadesCompanion(
      nombreEnfermedad: Value(nombreEnfermedad),
      procedimientoEnfermedad: Value(procedimientoEnfermedad),
    );
  }

  factory Enfermedade.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Enfermedade(
      nombreEnfermedad: serializer.fromJson<String>(json['nombreEnfermedad']),
      procedimientoEnfermedad:
          serializer.fromJson<String>(json['procedimientoEnfermedad']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nombreEnfermedad': serializer.toJson<String>(nombreEnfermedad),
      'procedimientoEnfermedad':
          serializer.toJson<String>(procedimientoEnfermedad),
    };
  }

  Enfermedade copyWith(
          {String? nombreEnfermedad, String? procedimientoEnfermedad}) =>
      Enfermedade(
        nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
        procedimientoEnfermedad:
            procedimientoEnfermedad ?? this.procedimientoEnfermedad,
      );
  @override
  String toString() {
    return (StringBuffer('Enfermedade(')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('procedimientoEnfermedad: $procedimientoEnfermedad')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nombreEnfermedad, procedimientoEnfermedad);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Enfermedade &&
          other.nombreEnfermedad == this.nombreEnfermedad &&
          other.procedimientoEnfermedad == this.procedimientoEnfermedad);
}

class EnfermedadesCompanion extends UpdateCompanion<Enfermedade> {
  final Value<String> nombreEnfermedad;
  final Value<String> procedimientoEnfermedad;
  const EnfermedadesCompanion({
    this.nombreEnfermedad = const Value.absent(),
    this.procedimientoEnfermedad = const Value.absent(),
  });
  EnfermedadesCompanion.insert({
    required String nombreEnfermedad,
    required String procedimientoEnfermedad,
  })  : nombreEnfermedad = Value(nombreEnfermedad),
        procedimientoEnfermedad = Value(procedimientoEnfermedad);
  static Insertable<Enfermedade> custom({
    Expression<String>? nombreEnfermedad,
    Expression<String>? procedimientoEnfermedad,
  }) {
    return RawValuesInsertable({
      if (nombreEnfermedad != null) 'nombre_enfermedad': nombreEnfermedad,
      if (procedimientoEnfermedad != null)
        'procedimiento_enfermedad': procedimientoEnfermedad,
    });
  }

  EnfermedadesCompanion copyWith(
      {Value<String>? nombreEnfermedad,
      Value<String>? procedimientoEnfermedad}) {
    return EnfermedadesCompanion(
      nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
      procedimientoEnfermedad:
          procedimientoEnfermedad ?? this.procedimientoEnfermedad,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnfermedadesCompanion(')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('procedimientoEnfermedad: $procedimientoEnfermedad')
          ..write(')'))
        .toString();
  }
}

class $EnfermedadesTable extends Enfermedades
    with TableInfo<$EnfermedadesTable, Enfermedade> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EnfermedadesTable(this._db, [this._alias]);
  final VerificationMeta _nombreEnfermedadMeta =
      const VerificationMeta('nombreEnfermedad');
  late final GeneratedColumn<String?> nombreEnfermedad =
      GeneratedColumn<String?>('nombre_enfermedad', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _procedimientoEnfermedadMeta =
      const VerificationMeta('procedimientoEnfermedad');
  late final GeneratedColumn<String?> procedimientoEnfermedad =
      GeneratedColumn<String?>('procedimiento_enfermedad', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [nombreEnfermedad, procedimientoEnfermedad];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {nombreEnfermedad};
  @override
  Enfermedade map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Enfermedade.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EnfermedadesTable createAlias(String alias) {
    return $EnfermedadesTable(_db, alias);
  }
}

class Etapa extends DataClass implements Insertable<Etapa> {
  final int id;
  final String nombreEnfermedad;
  final String nombreEtapa;
  final String procedimientoEtapa;
  Etapa(
      {required this.id,
      required this.nombreEnfermedad,
      required this.nombreEtapa,
      required this.procedimientoEtapa});
  factory Etapa.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Etapa(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nombreEnfermedad: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}nombre_enfermedad'])!,
      nombreEtapa: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_etapa'])!,
      procedimientoEtapa: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}procedimiento_etapa'])!,
    );
  }
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

class $EtapasTable extends Etapas with TableInfo<$EtapasTable, Etapa> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EtapasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _nombreEnfermedadMeta =
      const VerificationMeta('nombreEnfermedad');
  late final GeneratedColumn<String?> nombreEnfermedad =
      GeneratedColumn<String?>('nombre_enfermedad', aliasedName, false,
          typeName: 'TEXT',
          requiredDuringInsert: true,
          $customConstraints: 'REFERENCES enfermedades(nombre_enfermedad)');
  final VerificationMeta _nombreEtapaMeta =
      const VerificationMeta('nombreEtapa');
  late final GeneratedColumn<String?> nombreEtapa = GeneratedColumn<String?>(
      'nombre_etapa', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _procedimientoEtapaMeta =
      const VerificationMeta('procedimientoEtapa');
  late final GeneratedColumn<String?> procedimientoEtapa =
      GeneratedColumn<String?>('procedimiento_etapa', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
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
    return Etapa.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EtapasTable createAlias(String alias) {
    return $EtapasTable(_db, alias);
  }
}

class EtapasPlagaData extends DataClass implements Insertable<EtapasPlagaData> {
  final int idEtapasPlaga;
  final String nombrePlaga;
  final String nombreEtapa;
  final String procedimientoEtapa;
  EtapasPlagaData(
      {required this.idEtapasPlaga,
      required this.nombrePlaga,
      required this.nombreEtapa,
      required this.procedimientoEtapa});
  factory EtapasPlagaData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return EtapasPlagaData(
      idEtapasPlaga: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_etapas_plaga'])!,
      nombrePlaga: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_plaga'])!,
      nombreEtapa: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_etapa'])!,
      procedimientoEtapa: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}procedimiento_etapa'])!,
    );
  }
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

class $EtapasPlagaTable extends EtapasPlaga
    with TableInfo<$EtapasPlagaTable, EtapasPlagaData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EtapasPlagaTable(this._db, [this._alias]);
  final VerificationMeta _idEtapasPlagaMeta =
      const VerificationMeta('idEtapasPlaga');
  late final GeneratedColumn<int?> idEtapasPlaga = GeneratedColumn<int?>(
      'id_etapas_plaga', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nombrePlagaMeta =
      const VerificationMeta('nombrePlaga');
  late final GeneratedColumn<String?> nombrePlaga = GeneratedColumn<String?>(
      'nombre_plaga', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES plagas(nombre_comun_plaga)');
  final VerificationMeta _nombreEtapaMeta =
      const VerificationMeta('nombreEtapa');
  late final GeneratedColumn<String?> nombreEtapa = GeneratedColumn<String?>(
      'nombre_etapa', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _procedimientoEtapaMeta =
      const VerificationMeta('procedimientoEtapa');
  late final GeneratedColumn<String?> procedimientoEtapa =
      GeneratedColumn<String?>('procedimiento_etapa', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
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
    return EtapasPlagaData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EtapasPlagaTable createAlias(String alias) {
    return $EtapasPlagaTable(_db, alias);
  }
}

class Lote extends DataClass implements Insertable<Lote> {
  final int id;
  final String nombreLote;
  final int hectareas;
  final int numeropalmas;
  Lote(
      {required this.id,
      required this.nombreLote,
      required this.hectareas,
      required this.numeropalmas});
  factory Lote.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Lote(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nombreLote: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_lote'])!,
      hectareas: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hectareas'])!,
      numeropalmas: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}numeropalmas'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['hectareas'] = Variable<int>(hectareas);
    map['numeropalmas'] = Variable<int>(numeropalmas);
    return map;
  }

  LotesCompanion toCompanion(bool nullToAbsent) {
    return LotesCompanion(
      id: Value(id),
      nombreLote: Value(nombreLote),
      hectareas: Value(hectareas),
      numeropalmas: Value(numeropalmas),
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
    };
  }

  Lote copyWith(
          {int? id, String? nombreLote, int? hectareas, int? numeropalmas}) =>
      Lote(
        id: id ?? this.id,
        nombreLote: nombreLote ?? this.nombreLote,
        hectareas: hectareas ?? this.hectareas,
        numeropalmas: numeropalmas ?? this.numeropalmas,
      );
  @override
  String toString() {
    return (StringBuffer('Lote(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('hectareas: $hectareas, ')
          ..write('numeropalmas: $numeropalmas')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombreLote, hectareas, numeropalmas);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lote &&
          other.id == this.id &&
          other.nombreLote == this.nombreLote &&
          other.hectareas == this.hectareas &&
          other.numeropalmas == this.numeropalmas);
}

class LotesCompanion extends UpdateCompanion<Lote> {
  final Value<int> id;
  final Value<String> nombreLote;
  final Value<int> hectareas;
  final Value<int> numeropalmas;
  const LotesCompanion({
    this.id = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.hectareas = const Value.absent(),
    this.numeropalmas = const Value.absent(),
  });
  LotesCompanion.insert({
    this.id = const Value.absent(),
    required String nombreLote,
    required int hectareas,
    required int numeropalmas,
  })  : nombreLote = Value(nombreLote),
        hectareas = Value(hectareas),
        numeropalmas = Value(numeropalmas);
  static Insertable<Lote> custom({
    Expression<int>? id,
    Expression<String>? nombreLote,
    Expression<int>? hectareas,
    Expression<int>? numeropalmas,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (hectareas != null) 'hectareas': hectareas,
      if (numeropalmas != null) 'numeropalmas': numeropalmas,
    });
  }

  LotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? nombreLote,
      Value<int>? hectareas,
      Value<int>? numeropalmas}) {
    return LotesCompanion(
      id: id ?? this.id,
      nombreLote: nombreLote ?? this.nombreLote,
      hectareas: hectareas ?? this.hectareas,
      numeropalmas: numeropalmas ?? this.numeropalmas,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LotesCompanion(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('hectareas: $hectareas, ')
          ..write('numeropalmas: $numeropalmas')
          ..write(')'))
        .toString();
  }
}

class $LotesTable extends Lotes with TableInfo<$LotesTable, Lote> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LotesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nombreLoteMeta = const VerificationMeta('nombreLote');
  late final GeneratedColumn<String?> nombreLote = GeneratedColumn<String?>(
      'nombre_lote', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _hectareasMeta = const VerificationMeta('hectareas');
  late final GeneratedColumn<int?> hectareas = GeneratedColumn<int?>(
      'hectareas', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _numeropalmasMeta =
      const VerificationMeta('numeropalmas');
  late final GeneratedColumn<int?> numeropalmas = GeneratedColumn<int?>(
      'numeropalmas', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nombreLote, hectareas, numeropalmas];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lote map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Lote.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LotesTable createAlias(String alias) {
    return $LotesTable(_db, alias);
  }
}

class Palma extends DataClass implements Insertable<Palma> {
  final int id;
  final String nombreLote;
  final int numerolinea;
  final int numeroenlinea;
  final String estadopalma;
  Palma(
      {required this.id,
      required this.nombreLote,
      required this.numerolinea,
      required this.numeroenlinea,
      required this.estadopalma});
  factory Palma.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Palma(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nombreLote: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_lote'])!,
      numerolinea: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}numerolinea'])!,
      numeroenlinea: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}numeroenlinea'])!,
      estadopalma: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estadopalma'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['numerolinea'] = Variable<int>(numerolinea);
    map['numeroenlinea'] = Variable<int>(numeroenlinea);
    map['estadopalma'] = Variable<String>(estadopalma);
    return map;
  }

  PalmasCompanion toCompanion(bool nullToAbsent) {
    return PalmasCompanion(
      id: Value(id),
      nombreLote: Value(nombreLote),
      numerolinea: Value(numerolinea),
      numeroenlinea: Value(numeroenlinea),
      estadopalma: Value(estadopalma),
    );
  }

  factory Palma.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Palma(
      id: serializer.fromJson<int>(json['id']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      numerolinea: serializer.fromJson<int>(json['numerolinea']),
      numeroenlinea: serializer.fromJson<int>(json['numeroenlinea']),
      estadopalma: serializer.fromJson<String>(json['estadopalma']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'numerolinea': serializer.toJson<int>(numerolinea),
      'numeroenlinea': serializer.toJson<int>(numeroenlinea),
      'estadopalma': serializer.toJson<String>(estadopalma),
    };
  }

  Palma copyWith(
          {int? id,
          String? nombreLote,
          int? numerolinea,
          int? numeroenlinea,
          String? estadopalma}) =>
      Palma(
        id: id ?? this.id,
        nombreLote: nombreLote ?? this.nombreLote,
        numerolinea: numerolinea ?? this.numerolinea,
        numeroenlinea: numeroenlinea ?? this.numeroenlinea,
        estadopalma: estadopalma ?? this.estadopalma,
      );
  @override
  String toString() {
    return (StringBuffer('Palma(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('numerolinea: $numerolinea, ')
          ..write('numeroenlinea: $numeroenlinea, ')
          ..write('estadopalma: $estadopalma')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nombreLote, numerolinea, numeroenlinea, estadopalma);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Palma &&
          other.id == this.id &&
          other.nombreLote == this.nombreLote &&
          other.numerolinea == this.numerolinea &&
          other.numeroenlinea == this.numeroenlinea &&
          other.estadopalma == this.estadopalma);
}

class PalmasCompanion extends UpdateCompanion<Palma> {
  final Value<int> id;
  final Value<String> nombreLote;
  final Value<int> numerolinea;
  final Value<int> numeroenlinea;
  final Value<String> estadopalma;
  const PalmasCompanion({
    this.id = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.numerolinea = const Value.absent(),
    this.numeroenlinea = const Value.absent(),
    this.estadopalma = const Value.absent(),
  });
  PalmasCompanion.insert({
    this.id = const Value.absent(),
    required String nombreLote,
    required int numerolinea,
    required int numeroenlinea,
    required String estadopalma,
  })  : nombreLote = Value(nombreLote),
        numerolinea = Value(numerolinea),
        numeroenlinea = Value(numeroenlinea),
        estadopalma = Value(estadopalma);
  static Insertable<Palma> custom({
    Expression<int>? id,
    Expression<String>? nombreLote,
    Expression<int>? numerolinea,
    Expression<int>? numeroenlinea,
    Expression<String>? estadopalma,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (numerolinea != null) 'numerolinea': numerolinea,
      if (numeroenlinea != null) 'numeroenlinea': numeroenlinea,
      if (estadopalma != null) 'estadopalma': estadopalma,
    });
  }

  PalmasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nombreLote,
      Value<int>? numerolinea,
      Value<int>? numeroenlinea,
      Value<String>? estadopalma}) {
    return PalmasCompanion(
      id: id ?? this.id,
      nombreLote: nombreLote ?? this.nombreLote,
      numerolinea: numerolinea ?? this.numerolinea,
      numeroenlinea: numeroenlinea ?? this.numeroenlinea,
      estadopalma: estadopalma ?? this.estadopalma,
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
    if (numerolinea.present) {
      map['numerolinea'] = Variable<int>(numerolinea.value);
    }
    if (numeroenlinea.present) {
      map['numeroenlinea'] = Variable<int>(numeroenlinea.value);
    }
    if (estadopalma.present) {
      map['estadopalma'] = Variable<String>(estadopalma.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PalmasCompanion(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('numerolinea: $numerolinea, ')
          ..write('numeroenlinea: $numeroenlinea, ')
          ..write('estadopalma: $estadopalma')
          ..write(')'))
        .toString();
  }
}

class $PalmasTable extends Palmas with TableInfo<$PalmasTable, Palma> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PalmasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nombreLoteMeta = const VerificationMeta('nombreLote');
  late final GeneratedColumn<String?> nombreLote = GeneratedColumn<String?>(
      'nombre_lote', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _numerolineaMeta =
      const VerificationMeta('numerolinea');
  late final GeneratedColumn<int?> numerolinea = GeneratedColumn<int?>(
      'numerolinea', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _numeroenlineaMeta =
      const VerificationMeta('numeroenlinea');
  late final GeneratedColumn<int?> numeroenlinea = GeneratedColumn<int?>(
      'numeroenlinea', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _estadopalmaMeta =
      const VerificationMeta('estadopalma');
  late final GeneratedColumn<String?> estadopalma = GeneratedColumn<String?>(
      'estadopalma', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nombreLote, numerolinea, numeroenlinea, estadopalma];
  @override
  String get aliasedName => _alias ?? 'palmas';
  @override
  String get actualTableName => 'palmas';
  @override
  VerificationContext validateIntegrity(Insertable<Palma> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Palma map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Palma.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PalmasTable createAlias(String alias) {
    return $PalmasTable(_db, alias);
  }
}

class Plaga extends DataClass implements Insertable<Plaga> {
  final String nombreComunPlaga;
  Plaga({required this.nombreComunPlaga});
  factory Plaga.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Plaga(
      nombreComunPlaga: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}nombre_comun_plaga'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nombre_comun_plaga'] = Variable<String>(nombreComunPlaga);
    return map;
  }

  PlagasCompanion toCompanion(bool nullToAbsent) {
    return PlagasCompanion(
      nombreComunPlaga: Value(nombreComunPlaga),
    );
  }

  factory Plaga.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plaga(
      nombreComunPlaga: serializer.fromJson<String>(json['nombreComunPlaga']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nombreComunPlaga': serializer.toJson<String>(nombreComunPlaga),
    };
  }

  Plaga copyWith({String? nombreComunPlaga}) => Plaga(
        nombreComunPlaga: nombreComunPlaga ?? this.nombreComunPlaga,
      );
  @override
  String toString() {
    return (StringBuffer('Plaga(')
          ..write('nombreComunPlaga: $nombreComunPlaga')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => nombreComunPlaga.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plaga && other.nombreComunPlaga == this.nombreComunPlaga);
}

class PlagasCompanion extends UpdateCompanion<Plaga> {
  final Value<String> nombreComunPlaga;
  const PlagasCompanion({
    this.nombreComunPlaga = const Value.absent(),
  });
  PlagasCompanion.insert({
    required String nombreComunPlaga,
  }) : nombreComunPlaga = Value(nombreComunPlaga);
  static Insertable<Plaga> custom({
    Expression<String>? nombreComunPlaga,
  }) {
    return RawValuesInsertable({
      if (nombreComunPlaga != null) 'nombre_comun_plaga': nombreComunPlaga,
    });
  }

  PlagasCompanion copyWith({Value<String>? nombreComunPlaga}) {
    return PlagasCompanion(
      nombreComunPlaga: nombreComunPlaga ?? this.nombreComunPlaga,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nombreComunPlaga.present) {
      map['nombre_comun_plaga'] = Variable<String>(nombreComunPlaga.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlagasCompanion(')
          ..write('nombreComunPlaga: $nombreComunPlaga')
          ..write(')'))
        .toString();
  }
}

class $PlagasTable extends Plagas with TableInfo<$PlagasTable, Plaga> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PlagasTable(this._db, [this._alias]);
  final VerificationMeta _nombreComunPlagaMeta =
      const VerificationMeta('nombreComunPlaga');
  late final GeneratedColumn<String?> nombreComunPlaga =
      GeneratedColumn<String?>('nombre_comun_plaga', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [nombreComunPlaga];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {nombreComunPlaga};
  @override
  Plaga map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Plaga.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlagasTable createAlias(String alias) {
    return $PlagasTable(_db, alias);
  }
}

class Plateo extends DataClass implements Insertable<Plateo> {
  final int? id;
  final String nombreLote;
  final DateTime fechaIngreso;
  final DateTime? fechaSalida;
  final int cantidadPlateada;
  final bool completado;
  Plateo(
      {this.id,
      required this.nombreLote,
      required this.fechaIngreso,
      this.fechaSalida,
      required this.cantidadPlateada,
      required this.completado});
  factory Plateo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Plateo(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nombreLote: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_lote'])!,
      fechaIngreso: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_ingreso'])!,
      fechaSalida: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_salida']),
      cantidadPlateada: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}cantidad_plateada'])!,
      completado: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completado'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    if (!nullToAbsent || fechaSalida != null) {
      map['fecha_salida'] = Variable<DateTime?>(fechaSalida);
    }
    map['cantidad_plateada'] = Variable<int>(cantidadPlateada);
    map['completado'] = Variable<bool>(completado);
    return map;
  }

  PlateosCompanion toCompanion(bool nullToAbsent) {
    return PlateosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nombreLote: Value(nombreLote),
      fechaIngreso: Value(fechaIngreso),
      fechaSalida: fechaSalida == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaSalida),
      cantidadPlateada: Value(cantidadPlateada),
      completado: Value(completado),
    );
  }

  factory Plateo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plateo(
      id: serializer.fromJson<int?>(json['id']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      fechaSalida: serializer.fromJson<DateTime?>(json['fechaSalida']),
      cantidadPlateada: serializer.fromJson<int>(json['cantidadPlateada']),
      completado: serializer.fromJson<bool>(json['completado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'fechaSalida': serializer.toJson<DateTime?>(fechaSalida),
      'cantidadPlateada': serializer.toJson<int>(cantidadPlateada),
      'completado': serializer.toJson<bool>(completado),
    };
  }

  Plateo copyWith(
          {int? id,
          String? nombreLote,
          DateTime? fechaIngreso,
          DateTime? fechaSalida,
          int? cantidadPlateada,
          bool? completado}) =>
      Plateo(
        id: id ?? this.id,
        nombreLote: nombreLote ?? this.nombreLote,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        fechaSalida: fechaSalida ?? this.fechaSalida,
        cantidadPlateada: cantidadPlateada ?? this.cantidadPlateada,
        completado: completado ?? this.completado,
      );
  @override
  String toString() {
    return (StringBuffer('Plateo(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadPlateada: $cantidadPlateada, ')
          ..write('completado: $completado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, nombreLote, fechaIngreso, fechaSalida, cantidadPlateada, completado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plateo &&
          other.id == this.id &&
          other.nombreLote == this.nombreLote &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaSalida == this.fechaSalida &&
          other.cantidadPlateada == this.cantidadPlateada &&
          other.completado == this.completado);
}

class PlateosCompanion extends UpdateCompanion<Plateo> {
  final Value<int?> id;
  final Value<String> nombreLote;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaSalida;
  final Value<int> cantidadPlateada;
  final Value<bool> completado;
  const PlateosCompanion({
    this.id = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.cantidadPlateada = const Value.absent(),
    this.completado = const Value.absent(),
  });
  PlateosCompanion.insert({
    this.id = const Value.absent(),
    required String nombreLote,
    required DateTime fechaIngreso,
    this.fechaSalida = const Value.absent(),
    required int cantidadPlateada,
    this.completado = const Value.absent(),
  })  : nombreLote = Value(nombreLote),
        fechaIngreso = Value(fechaIngreso),
        cantidadPlateada = Value(cantidadPlateada);
  static Insertable<Plateo> custom({
    Expression<int?>? id,
    Expression<String>? nombreLote,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime?>? fechaSalida,
    Expression<int>? cantidadPlateada,
    Expression<bool>? completado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (cantidadPlateada != null) 'cantidad_plateada': cantidadPlateada,
      if (completado != null) 'completado': completado,
    });
  }

  PlateosCompanion copyWith(
      {Value<int?>? id,
      Value<String>? nombreLote,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? fechaSalida,
      Value<int>? cantidadPlateada,
      Value<bool>? completado}) {
    return PlateosCompanion(
      id: id ?? this.id,
      nombreLote: nombreLote ?? this.nombreLote,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      cantidadPlateada: cantidadPlateada ?? this.cantidadPlateada,
      completado: completado ?? this.completado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (nombreLote.present) {
      map['nombre_lote'] = Variable<String>(nombreLote.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (fechaSalida.present) {
      map['fecha_salida'] = Variable<DateTime?>(fechaSalida.value);
    }
    if (cantidadPlateada.present) {
      map['cantidad_plateada'] = Variable<int>(cantidadPlateada.value);
    }
    if (completado.present) {
      map['completado'] = Variable<bool>(completado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlateosCompanion(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadPlateada: $cantidadPlateada, ')
          ..write('completado: $completado')
          ..write(')'))
        .toString();
  }
}

class $PlateosTable extends Plateos with TableInfo<$PlateosTable, Plateo> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PlateosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nombreLoteMeta = const VerificationMeta('nombreLote');
  late final GeneratedColumn<String?> nombreLote = GeneratedColumn<String?>(
      'nombre_lote', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  late final GeneratedColumn<DateTime?> fechaIngreso =
      GeneratedColumn<DateTime?>('fecha_ingreso', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _fechaSalidaMeta =
      const VerificationMeta('fechaSalida');
  late final GeneratedColumn<DateTime?> fechaSalida =
      GeneratedColumn<DateTime?>('fecha_salida', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _cantidadPlateadaMeta =
      const VerificationMeta('cantidadPlateada');
  late final GeneratedColumn<int?> cantidadPlateada = GeneratedColumn<int?>(
      'cantidad_plateada', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _completadoMeta = const VerificationMeta('completado');
  late final GeneratedColumn<bool?> completado = GeneratedColumn<bool?>(
      'completado', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (completado IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, nombreLote, fechaIngreso, fechaSalida, cantidadPlateada, completado];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plateo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Plateo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlateosTable createAlias(String alias) {
    return $PlateosTable(_db, alias);
  }
}

class PlateoDiarioData extends DataClass
    implements Insertable<PlateoDiarioData> {
  final int id;
  final int idPlateo;
  final DateTime fecha;
  final int cantidadPlateada;
  final String tipoPlateo;
  PlateoDiarioData(
      {required this.id,
      required this.idPlateo,
      required this.fecha,
      required this.cantidadPlateada,
      required this.tipoPlateo});
  factory PlateoDiarioData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlateoDiarioData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idPlateo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_plateo'])!,
      fecha: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha'])!,
      cantidadPlateada: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}cantidad_plateada'])!,
      tipoPlateo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tipo_plateo'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_plateo'] = Variable<int>(idPlateo);
    map['fecha'] = Variable<DateTime>(fecha);
    map['cantidad_plateada'] = Variable<int>(cantidadPlateada);
    map['tipo_plateo'] = Variable<String>(tipoPlateo);
    return map;
  }

  PlateoDiarioCompanion toCompanion(bool nullToAbsent) {
    return PlateoDiarioCompanion(
      id: Value(id),
      idPlateo: Value(idPlateo),
      fecha: Value(fecha),
      cantidadPlateada: Value(cantidadPlateada),
      tipoPlateo: Value(tipoPlateo),
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
    };
  }

  PlateoDiarioData copyWith(
          {int? id,
          int? idPlateo,
          DateTime? fecha,
          int? cantidadPlateada,
          String? tipoPlateo}) =>
      PlateoDiarioData(
        id: id ?? this.id,
        idPlateo: idPlateo ?? this.idPlateo,
        fecha: fecha ?? this.fecha,
        cantidadPlateada: cantidadPlateada ?? this.cantidadPlateada,
        tipoPlateo: tipoPlateo ?? this.tipoPlateo,
      );
  @override
  String toString() {
    return (StringBuffer('PlateoDiarioData(')
          ..write('id: $id, ')
          ..write('idPlateo: $idPlateo, ')
          ..write('fecha: $fecha, ')
          ..write('cantidadPlateada: $cantidadPlateada, ')
          ..write('tipoPlateo: $tipoPlateo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idPlateo, fecha, cantidadPlateada, tipoPlateo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlateoDiarioData &&
          other.id == this.id &&
          other.idPlateo == this.idPlateo &&
          other.fecha == this.fecha &&
          other.cantidadPlateada == this.cantidadPlateada &&
          other.tipoPlateo == this.tipoPlateo);
}

class PlateoDiarioCompanion extends UpdateCompanion<PlateoDiarioData> {
  final Value<int> id;
  final Value<int> idPlateo;
  final Value<DateTime> fecha;
  final Value<int> cantidadPlateada;
  final Value<String> tipoPlateo;
  const PlateoDiarioCompanion({
    this.id = const Value.absent(),
    this.idPlateo = const Value.absent(),
    this.fecha = const Value.absent(),
    this.cantidadPlateada = const Value.absent(),
    this.tipoPlateo = const Value.absent(),
  });
  PlateoDiarioCompanion.insert({
    this.id = const Value.absent(),
    required int idPlateo,
    required DateTime fecha,
    required int cantidadPlateada,
    required String tipoPlateo,
  })  : idPlateo = Value(idPlateo),
        fecha = Value(fecha),
        cantidadPlateada = Value(cantidadPlateada),
        tipoPlateo = Value(tipoPlateo);
  static Insertable<PlateoDiarioData> custom({
    Expression<int>? id,
    Expression<int>? idPlateo,
    Expression<DateTime>? fecha,
    Expression<int>? cantidadPlateada,
    Expression<String>? tipoPlateo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idPlateo != null) 'id_plateo': idPlateo,
      if (fecha != null) 'fecha': fecha,
      if (cantidadPlateada != null) 'cantidad_plateada': cantidadPlateada,
      if (tipoPlateo != null) 'tipo_plateo': tipoPlateo,
    });
  }

  PlateoDiarioCompanion copyWith(
      {Value<int>? id,
      Value<int>? idPlateo,
      Value<DateTime>? fecha,
      Value<int>? cantidadPlateada,
      Value<String>? tipoPlateo}) {
    return PlateoDiarioCompanion(
      id: id ?? this.id,
      idPlateo: idPlateo ?? this.idPlateo,
      fecha: fecha ?? this.fecha,
      cantidadPlateada: cantidadPlateada ?? this.cantidadPlateada,
      tipoPlateo: tipoPlateo ?? this.tipoPlateo,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlateoDiarioCompanion(')
          ..write('id: $id, ')
          ..write('idPlateo: $idPlateo, ')
          ..write('fecha: $fecha, ')
          ..write('cantidadPlateada: $cantidadPlateada, ')
          ..write('tipoPlateo: $tipoPlateo')
          ..write(')'))
        .toString();
  }
}

class $PlateoDiarioTable extends PlateoDiario
    with TableInfo<$PlateoDiarioTable, PlateoDiarioData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PlateoDiarioTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idPlateoMeta = const VerificationMeta('idPlateo');
  late final GeneratedColumn<int?> idPlateo = GeneratedColumn<int?>(
      'id_plateo', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES plateos(id)');
  final VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  late final GeneratedColumn<DateTime?> fecha = GeneratedColumn<DateTime?>(
      'fecha', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _cantidadPlateadaMeta =
      const VerificationMeta('cantidadPlateada');
  late final GeneratedColumn<int?> cantidadPlateada = GeneratedColumn<int?>(
      'cantidad_plateada', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _tipoPlateoMeta = const VerificationMeta('tipoPlateo');
  late final GeneratedColumn<String?> tipoPlateo = GeneratedColumn<String?>(
      'tipo_plateo', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idPlateo, fecha, cantidadPlateada, tipoPlateo];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlateoDiarioData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PlateoDiarioData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlateoDiarioTable createAlias(String alias) {
    return $PlateoDiarioTable(_db, alias);
  }
}

class Poda extends DataClass implements Insertable<Poda> {
  final int id;
  final String nombreLote;
  final DateTime fechaIngreso;
  final DateTime? fechaSalida;
  final int cantidadPodada;
  final bool completada;
  Poda(
      {required this.id,
      required this.nombreLote,
      required this.fechaIngreso,
      this.fechaSalida,
      required this.cantidadPodada,
      required this.completada});
  factory Poda.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Poda(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nombreLote: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_lote'])!,
      fechaIngreso: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_ingreso'])!,
      fechaSalida: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_salida']),
      cantidadPodada: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cantidad_podada'])!,
      completada: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completada'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    if (!nullToAbsent || fechaSalida != null) {
      map['fecha_salida'] = Variable<DateTime?>(fechaSalida);
    }
    map['cantidad_podada'] = Variable<int>(cantidadPodada);
    map['completada'] = Variable<bool>(completada);
    return map;
  }

  PodasCompanion toCompanion(bool nullToAbsent) {
    return PodasCompanion(
      id: Value(id),
      nombreLote: Value(nombreLote),
      fechaIngreso: Value(fechaIngreso),
      fechaSalida: fechaSalida == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaSalida),
      cantidadPodada: Value(cantidadPodada),
      completada: Value(completada),
    );
  }

  factory Poda.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Poda(
      id: serializer.fromJson<int>(json['id']),
      nombreLote: serializer.fromJson<String>(json['nombreLote']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      fechaSalida: serializer.fromJson<DateTime?>(json['fechaSalida']),
      cantidadPodada: serializer.fromJson<int>(json['cantidadPodada']),
      completada: serializer.fromJson<bool>(json['completada']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombreLote': serializer.toJson<String>(nombreLote),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'fechaSalida': serializer.toJson<DateTime?>(fechaSalida),
      'cantidadPodada': serializer.toJson<int>(cantidadPodada),
      'completada': serializer.toJson<bool>(completada),
    };
  }

  Poda copyWith(
          {int? id,
          String? nombreLote,
          DateTime? fechaIngreso,
          DateTime? fechaSalida,
          int? cantidadPodada,
          bool? completada}) =>
      Poda(
        id: id ?? this.id,
        nombreLote: nombreLote ?? this.nombreLote,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        fechaSalida: fechaSalida ?? this.fechaSalida,
        cantidadPodada: cantidadPodada ?? this.cantidadPodada,
        completada: completada ?? this.completada,
      );
  @override
  String toString() {
    return (StringBuffer('Poda(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadPodada: $cantidadPodada, ')
          ..write('completada: $completada')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, nombreLote, fechaIngreso, fechaSalida, cantidadPodada, completada);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Poda &&
          other.id == this.id &&
          other.nombreLote == this.nombreLote &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaSalida == this.fechaSalida &&
          other.cantidadPodada == this.cantidadPodada &&
          other.completada == this.completada);
}

class PodasCompanion extends UpdateCompanion<Poda> {
  final Value<int> id;
  final Value<String> nombreLote;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaSalida;
  final Value<int> cantidadPodada;
  final Value<bool> completada;
  const PodasCompanion({
    this.id = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.cantidadPodada = const Value.absent(),
    this.completada = const Value.absent(),
  });
  PodasCompanion.insert({
    this.id = const Value.absent(),
    required String nombreLote,
    required DateTime fechaIngreso,
    this.fechaSalida = const Value.absent(),
    required int cantidadPodada,
    this.completada = const Value.absent(),
  })  : nombreLote = Value(nombreLote),
        fechaIngreso = Value(fechaIngreso),
        cantidadPodada = Value(cantidadPodada);
  static Insertable<Poda> custom({
    Expression<int>? id,
    Expression<String>? nombreLote,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime?>? fechaSalida,
    Expression<int>? cantidadPodada,
    Expression<bool>? completada,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombreLote != null) 'nombre_lote': nombreLote,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (cantidadPodada != null) 'cantidad_podada': cantidadPodada,
      if (completada != null) 'completada': completada,
    });
  }

  PodasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nombreLote,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? fechaSalida,
      Value<int>? cantidadPodada,
      Value<bool>? completada}) {
    return PodasCompanion(
      id: id ?? this.id,
      nombreLote: nombreLote ?? this.nombreLote,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      cantidadPodada: cantidadPodada ?? this.cantidadPodada,
      completada: completada ?? this.completada,
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
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (fechaSalida.present) {
      map['fecha_salida'] = Variable<DateTime?>(fechaSalida.value);
    }
    if (cantidadPodada.present) {
      map['cantidad_podada'] = Variable<int>(cantidadPodada.value);
    }
    if (completada.present) {
      map['completada'] = Variable<bool>(completada.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodasCompanion(')
          ..write('id: $id, ')
          ..write('nombreLote: $nombreLote, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('cantidadPodada: $cantidadPodada, ')
          ..write('completada: $completada')
          ..write(')'))
        .toString();
  }
}

class $PodasTable extends Podas with TableInfo<$PodasTable, Poda> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PodasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nombreLoteMeta = const VerificationMeta('nombreLote');
  late final GeneratedColumn<String?> nombreLote = GeneratedColumn<String?>(
      'nombre_lote', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  late final GeneratedColumn<DateTime?> fechaIngreso =
      GeneratedColumn<DateTime?>('fecha_ingreso', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _fechaSalidaMeta =
      const VerificationMeta('fechaSalida');
  late final GeneratedColumn<DateTime?> fechaSalida =
      GeneratedColumn<DateTime?>('fecha_salida', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _cantidadPodadaMeta =
      const VerificationMeta('cantidadPodada');
  late final GeneratedColumn<int?> cantidadPodada = GeneratedColumn<int?>(
      'cantidad_podada', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _completadaMeta = const VerificationMeta('completada');
  late final GeneratedColumn<bool?> completada = GeneratedColumn<bool?>(
      'completada', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (completada IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, nombreLote, fechaIngreso, fechaSalida, cantidadPodada, completada];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Poda map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Poda.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PodasTable createAlias(String alias) {
    return $PodasTable(_db, alias);
  }
}

class PodaDiariaData extends DataClass implements Insertable<PodaDiariaData> {
  final int id;
  final int idPoda;
  final DateTime fechaIngreso;
  final int cantidadPodada;
  PodaDiariaData(
      {required this.id,
      required this.idPoda,
      required this.fechaIngreso,
      required this.cantidadPodada});
  factory PodaDiariaData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PodaDiariaData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idPoda: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_poda'])!,
      fechaIngreso: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_ingreso'])!,
      cantidadPodada: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cantidad_podada'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_poda'] = Variable<int>(idPoda);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    map['cantidad_podada'] = Variable<int>(cantidadPodada);
    return map;
  }

  PodaDiariaCompanion toCompanion(bool nullToAbsent) {
    return PodaDiariaCompanion(
      id: Value(id),
      idPoda: Value(idPoda),
      fechaIngreso: Value(fechaIngreso),
      cantidadPodada: Value(cantidadPodada),
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
    };
  }

  PodaDiariaData copyWith(
          {int? id,
          int? idPoda,
          DateTime? fechaIngreso,
          int? cantidadPodada}) =>
      PodaDiariaData(
        id: id ?? this.id,
        idPoda: idPoda ?? this.idPoda,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        cantidadPodada: cantidadPodada ?? this.cantidadPodada,
      );
  @override
  String toString() {
    return (StringBuffer('PodaDiariaData(')
          ..write('id: $id, ')
          ..write('idPoda: $idPoda, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('cantidadPodada: $cantidadPodada')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idPoda, fechaIngreso, cantidadPodada);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PodaDiariaData &&
          other.id == this.id &&
          other.idPoda == this.idPoda &&
          other.fechaIngreso == this.fechaIngreso &&
          other.cantidadPodada == this.cantidadPodada);
}

class PodaDiariaCompanion extends UpdateCompanion<PodaDiariaData> {
  final Value<int> id;
  final Value<int> idPoda;
  final Value<DateTime> fechaIngreso;
  final Value<int> cantidadPodada;
  const PodaDiariaCompanion({
    this.id = const Value.absent(),
    this.idPoda = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.cantidadPodada = const Value.absent(),
  });
  PodaDiariaCompanion.insert({
    this.id = const Value.absent(),
    required int idPoda,
    required DateTime fechaIngreso,
    required int cantidadPodada,
  })  : idPoda = Value(idPoda),
        fechaIngreso = Value(fechaIngreso),
        cantidadPodada = Value(cantidadPodada);
  static Insertable<PodaDiariaData> custom({
    Expression<int>? id,
    Expression<int>? idPoda,
    Expression<DateTime>? fechaIngreso,
    Expression<int>? cantidadPodada,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idPoda != null) 'id_poda': idPoda,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (cantidadPodada != null) 'cantidad_podada': cantidadPodada,
    });
  }

  PodaDiariaCompanion copyWith(
      {Value<int>? id,
      Value<int>? idPoda,
      Value<DateTime>? fechaIngreso,
      Value<int>? cantidadPodada}) {
    return PodaDiariaCompanion(
      id: id ?? this.id,
      idPoda: idPoda ?? this.idPoda,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      cantidadPodada: cantidadPodada ?? this.cantidadPodada,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodaDiariaCompanion(')
          ..write('id: $id, ')
          ..write('idPoda: $idPoda, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('cantidadPodada: $cantidadPodada')
          ..write(')'))
        .toString();
  }
}

class $PodaDiariaTable extends PodaDiaria
    with TableInfo<$PodaDiariaTable, PodaDiariaData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PodaDiariaTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idPodaMeta = const VerificationMeta('idPoda');
  late final GeneratedColumn<int?> idPoda = GeneratedColumn<int?>(
      'id_poda', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES podas(id)');
  final VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  late final GeneratedColumn<DateTime?> fechaIngreso =
      GeneratedColumn<DateTime?>('fecha_ingreso', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _cantidadPodadaMeta =
      const VerificationMeta('cantidadPodada');
  late final GeneratedColumn<int?> cantidadPodada = GeneratedColumn<int?>(
      'cantidad_podada', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idPoda, fechaIngreso, cantidadPodada];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PodaDiariaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PodaDiariaData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PodaDiariaTable createAlias(String alias) {
    return $PodaDiariaTable(_db, alias);
  }
}

class ProductoAgroquimicoData extends DataClass
    implements Insertable<ProductoAgroquimicoData> {
  final int id;
  final String nombreProductoAgroquimico;
  final String tipoProductoAgroquimico;
  final String ingredienteActivoProductoAgroquimico;
  final int periodoCarenciaProductoAgroquimico;
  final String presentacionProductoAgroquimico;
  ProductoAgroquimicoData(
      {required this.id,
      required this.nombreProductoAgroquimico,
      required this.tipoProductoAgroquimico,
      required this.ingredienteActivoProductoAgroquimico,
      required this.periodoCarenciaProductoAgroquimico,
      required this.presentacionProductoAgroquimico});
  factory ProductoAgroquimicoData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductoAgroquimicoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nombreProductoAgroquimico: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}nombre_producto_agroquimico'])!,
      tipoProductoAgroquimico: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}tipo_producto_agroquimico'])!,
      ingredienteActivoProductoAgroquimico: const StringType()
          .mapFromDatabaseResponse(data[
              '${effectivePrefix}ingrediente_activo_producto_agroquimico'])!,
      periodoCarenciaProductoAgroquimico: const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}periodo_carencia_producto_agroquimico'])!,
      presentacionProductoAgroquimico: const StringType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}presentacion_producto_agroquimico'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre_producto_agroquimico'] =
        Variable<String>(nombreProductoAgroquimico);
    map['tipo_producto_agroquimico'] =
        Variable<String>(tipoProductoAgroquimico);
    map['ingrediente_activo_producto_agroquimico'] =
        Variable<String>(ingredienteActivoProductoAgroquimico);
    map['periodo_carencia_producto_agroquimico'] =
        Variable<int>(periodoCarenciaProductoAgroquimico);
    map['presentacion_producto_agroquimico'] =
        Variable<String>(presentacionProductoAgroquimico);
    return map;
  }

  ProductoAgroquimicoCompanion toCompanion(bool nullToAbsent) {
    return ProductoAgroquimicoCompanion(
      id: Value(id),
      nombreProductoAgroquimico: Value(nombreProductoAgroquimico),
      tipoProductoAgroquimico: Value(tipoProductoAgroquimico),
      ingredienteActivoProductoAgroquimico:
          Value(ingredienteActivoProductoAgroquimico),
      periodoCarenciaProductoAgroquimico:
          Value(periodoCarenciaProductoAgroquimico),
      presentacionProductoAgroquimico: Value(presentacionProductoAgroquimico),
    );
  }

  factory ProductoAgroquimicoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductoAgroquimicoData(
      id: serializer.fromJson<int>(json['id']),
      nombreProductoAgroquimico:
          serializer.fromJson<String>(json['nombreProductoAgroquimico']),
      tipoProductoAgroquimico:
          serializer.fromJson<String>(json['tipoProductoAgroquimico']),
      ingredienteActivoProductoAgroquimico: serializer
          .fromJson<String>(json['ingredienteActivoProductoAgroquimico']),
      periodoCarenciaProductoAgroquimico:
          serializer.fromJson<int>(json['periodoCarenciaProductoAgroquimico']),
      presentacionProductoAgroquimico:
          serializer.fromJson<String>(json['presentacionProductoAgroquimico']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombreProductoAgroquimico':
          serializer.toJson<String>(nombreProductoAgroquimico),
      'tipoProductoAgroquimico':
          serializer.toJson<String>(tipoProductoAgroquimico),
      'ingredienteActivoProductoAgroquimico':
          serializer.toJson<String>(ingredienteActivoProductoAgroquimico),
      'periodoCarenciaProductoAgroquimico':
          serializer.toJson<int>(periodoCarenciaProductoAgroquimico),
      'presentacionProductoAgroquimico':
          serializer.toJson<String>(presentacionProductoAgroquimico),
    };
  }

  ProductoAgroquimicoData copyWith(
          {int? id,
          String? nombreProductoAgroquimico,
          String? tipoProductoAgroquimico,
          String? ingredienteActivoProductoAgroquimico,
          int? periodoCarenciaProductoAgroquimico,
          String? presentacionProductoAgroquimico}) =>
      ProductoAgroquimicoData(
        id: id ?? this.id,
        nombreProductoAgroquimico:
            nombreProductoAgroquimico ?? this.nombreProductoAgroquimico,
        tipoProductoAgroquimico:
            tipoProductoAgroquimico ?? this.tipoProductoAgroquimico,
        ingredienteActivoProductoAgroquimico:
            ingredienteActivoProductoAgroquimico ??
                this.ingredienteActivoProductoAgroquimico,
        periodoCarenciaProductoAgroquimico:
            periodoCarenciaProductoAgroquimico ??
                this.periodoCarenciaProductoAgroquimico,
        presentacionProductoAgroquimico: presentacionProductoAgroquimico ??
            this.presentacionProductoAgroquimico,
      );
  @override
  String toString() {
    return (StringBuffer('ProductoAgroquimicoData(')
          ..write('id: $id, ')
          ..write('nombreProductoAgroquimico: $nombreProductoAgroquimico, ')
          ..write('tipoProductoAgroquimico: $tipoProductoAgroquimico, ')
          ..write(
              'ingredienteActivoProductoAgroquimico: $ingredienteActivoProductoAgroquimico, ')
          ..write(
              'periodoCarenciaProductoAgroquimico: $periodoCarenciaProductoAgroquimico, ')
          ..write(
              'presentacionProductoAgroquimico: $presentacionProductoAgroquimico')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      nombreProductoAgroquimico,
      tipoProductoAgroquimico,
      ingredienteActivoProductoAgroquimico,
      periodoCarenciaProductoAgroquimico,
      presentacionProductoAgroquimico);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductoAgroquimicoData &&
          other.id == this.id &&
          other.nombreProductoAgroquimico == this.nombreProductoAgroquimico &&
          other.tipoProductoAgroquimico == this.tipoProductoAgroquimico &&
          other.ingredienteActivoProductoAgroquimico ==
              this.ingredienteActivoProductoAgroquimico &&
          other.periodoCarenciaProductoAgroquimico ==
              this.periodoCarenciaProductoAgroquimico &&
          other.presentacionProductoAgroquimico ==
              this.presentacionProductoAgroquimico);
}

class ProductoAgroquimicoCompanion
    extends UpdateCompanion<ProductoAgroquimicoData> {
  final Value<int> id;
  final Value<String> nombreProductoAgroquimico;
  final Value<String> tipoProductoAgroquimico;
  final Value<String> ingredienteActivoProductoAgroquimico;
  final Value<int> periodoCarenciaProductoAgroquimico;
  final Value<String> presentacionProductoAgroquimico;
  const ProductoAgroquimicoCompanion({
    this.id = const Value.absent(),
    this.nombreProductoAgroquimico = const Value.absent(),
    this.tipoProductoAgroquimico = const Value.absent(),
    this.ingredienteActivoProductoAgroquimico = const Value.absent(),
    this.periodoCarenciaProductoAgroquimico = const Value.absent(),
    this.presentacionProductoAgroquimico = const Value.absent(),
  });
  ProductoAgroquimicoCompanion.insert({
    this.id = const Value.absent(),
    required String nombreProductoAgroquimico,
    required String tipoProductoAgroquimico,
    required String ingredienteActivoProductoAgroquimico,
    required int periodoCarenciaProductoAgroquimico,
    required String presentacionProductoAgroquimico,
  })  : nombreProductoAgroquimico = Value(nombreProductoAgroquimico),
        tipoProductoAgroquimico = Value(tipoProductoAgroquimico),
        ingredienteActivoProductoAgroquimico =
            Value(ingredienteActivoProductoAgroquimico),
        periodoCarenciaProductoAgroquimico =
            Value(periodoCarenciaProductoAgroquimico),
        presentacionProductoAgroquimico =
            Value(presentacionProductoAgroquimico);
  static Insertable<ProductoAgroquimicoData> custom({
    Expression<int>? id,
    Expression<String>? nombreProductoAgroquimico,
    Expression<String>? tipoProductoAgroquimico,
    Expression<String>? ingredienteActivoProductoAgroquimico,
    Expression<int>? periodoCarenciaProductoAgroquimico,
    Expression<String>? presentacionProductoAgroquimico,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombreProductoAgroquimico != null)
        'nombre_producto_agroquimico': nombreProductoAgroquimico,
      if (tipoProductoAgroquimico != null)
        'tipo_producto_agroquimico': tipoProductoAgroquimico,
      if (ingredienteActivoProductoAgroquimico != null)
        'ingrediente_activo_producto_agroquimico':
            ingredienteActivoProductoAgroquimico,
      if (periodoCarenciaProductoAgroquimico != null)
        'periodo_carencia_producto_agroquimico':
            periodoCarenciaProductoAgroquimico,
      if (presentacionProductoAgroquimico != null)
        'presentacion_producto_agroquimico': presentacionProductoAgroquimico,
    });
  }

  ProductoAgroquimicoCompanion copyWith(
      {Value<int>? id,
      Value<String>? nombreProductoAgroquimico,
      Value<String>? tipoProductoAgroquimico,
      Value<String>? ingredienteActivoProductoAgroquimico,
      Value<int>? periodoCarenciaProductoAgroquimico,
      Value<String>? presentacionProductoAgroquimico}) {
    return ProductoAgroquimicoCompanion(
      id: id ?? this.id,
      nombreProductoAgroquimico:
          nombreProductoAgroquimico ?? this.nombreProductoAgroquimico,
      tipoProductoAgroquimico:
          tipoProductoAgroquimico ?? this.tipoProductoAgroquimico,
      ingredienteActivoProductoAgroquimico:
          ingredienteActivoProductoAgroquimico ??
              this.ingredienteActivoProductoAgroquimico,
      periodoCarenciaProductoAgroquimico: periodoCarenciaProductoAgroquimico ??
          this.periodoCarenciaProductoAgroquimico,
      presentacionProductoAgroquimico: presentacionProductoAgroquimico ??
          this.presentacionProductoAgroquimico,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombreProductoAgroquimico.present) {
      map['nombre_producto_agroquimico'] =
          Variable<String>(nombreProductoAgroquimico.value);
    }
    if (tipoProductoAgroquimico.present) {
      map['tipo_producto_agroquimico'] =
          Variable<String>(tipoProductoAgroquimico.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductoAgroquimicoCompanion(')
          ..write('id: $id, ')
          ..write('nombreProductoAgroquimico: $nombreProductoAgroquimico, ')
          ..write('tipoProductoAgroquimico: $tipoProductoAgroquimico, ')
          ..write(
              'ingredienteActivoProductoAgroquimico: $ingredienteActivoProductoAgroquimico, ')
          ..write(
              'periodoCarenciaProductoAgroquimico: $periodoCarenciaProductoAgroquimico, ')
          ..write(
              'presentacionProductoAgroquimico: $presentacionProductoAgroquimico')
          ..write(')'))
        .toString();
  }
}

class $ProductoAgroquimicoTable extends ProductoAgroquimico
    with TableInfo<$ProductoAgroquimicoTable, ProductoAgroquimicoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ProductoAgroquimicoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nombreProductoAgroquimicoMeta =
      const VerificationMeta('nombreProductoAgroquimico');
  late final GeneratedColumn<String?> nombreProductoAgroquimico =
      GeneratedColumn<String?>(
          'nombre_producto_agroquimico', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _tipoProductoAgroquimicoMeta =
      const VerificationMeta('tipoProductoAgroquimico');
  late final GeneratedColumn<String?> tipoProductoAgroquimico =
      GeneratedColumn<String?>('tipo_producto_agroquimico', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _ingredienteActivoProductoAgroquimicoMeta =
      const VerificationMeta('ingredienteActivoProductoAgroquimico');
  late final GeneratedColumn<String?> ingredienteActivoProductoAgroquimico =
      GeneratedColumn<String?>(
          'ingrediente_activo_producto_agroquimico', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _periodoCarenciaProductoAgroquimicoMeta =
      const VerificationMeta('periodoCarenciaProductoAgroquimico');
  late final GeneratedColumn<int?> periodoCarenciaProductoAgroquimico =
      GeneratedColumn<int?>(
          'periodo_carencia_producto_agroquimico', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _presentacionProductoAgroquimicoMeta =
      const VerificationMeta('presentacionProductoAgroquimico');
  late final GeneratedColumn<String?> presentacionProductoAgroquimico =
      GeneratedColumn<String?>(
          'presentacion_producto_agroquimico', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nombreProductoAgroquimico,
        tipoProductoAgroquimico,
        ingredienteActivoProductoAgroquimico,
        periodoCarenciaProductoAgroquimico,
        presentacionProductoAgroquimico
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductoAgroquimicoData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return ProductoAgroquimicoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductoAgroquimicoTable createAlias(String alias) {
    return $ProductoAgroquimicoTable(_db, alias);
  }
}

class RegistroEnfermedadData extends DataClass
    implements Insertable<RegistroEnfermedadData> {
  final int id;
  final DateTime fechaRegistro;
  final DateTime horaRegistro;
  final int idPalma;
  final String nombreEnfermedad;
  final int? idEtapaEnfermedad;
  final String? observaciones;
  RegistroEnfermedadData(
      {required this.id,
      required this.fechaRegistro,
      required this.horaRegistro,
      required this.idPalma,
      required this.nombreEnfermedad,
      this.idEtapaEnfermedad,
      this.observaciones});
  factory RegistroEnfermedadData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RegistroEnfermedadData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      fechaRegistro: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_registro'])!,
      horaRegistro: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hora_registro'])!,
      idPalma: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_palma'])!,
      nombreEnfermedad: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}nombre_enfermedad'])!,
      idEtapaEnfermedad: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_etapa_enfermedad']),
      observaciones: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}observaciones']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['fecha_registro'] = Variable<DateTime>(fechaRegistro);
    map['hora_registro'] = Variable<DateTime>(horaRegistro);
    map['id_palma'] = Variable<int>(idPalma);
    map['nombre_enfermedad'] = Variable<String>(nombreEnfermedad);
    if (!nullToAbsent || idEtapaEnfermedad != null) {
      map['id_etapa_enfermedad'] = Variable<int?>(idEtapaEnfermedad);
    }
    if (!nullToAbsent || observaciones != null) {
      map['observaciones'] = Variable<String?>(observaciones);
    }
    return map;
  }

  RegistroEnfermedadCompanion toCompanion(bool nullToAbsent) {
    return RegistroEnfermedadCompanion(
      id: Value(id),
      fechaRegistro: Value(fechaRegistro),
      horaRegistro: Value(horaRegistro),
      idPalma: Value(idPalma),
      nombreEnfermedad: Value(nombreEnfermedad),
      idEtapaEnfermedad: idEtapaEnfermedad == null && nullToAbsent
          ? const Value.absent()
          : Value(idEtapaEnfermedad),
      observaciones: observaciones == null && nullToAbsent
          ? const Value.absent()
          : Value(observaciones),
    );
  }

  factory RegistroEnfermedadData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegistroEnfermedadData(
      id: serializer.fromJson<int>(json['id']),
      fechaRegistro: serializer.fromJson<DateTime>(json['fechaRegistro']),
      horaRegistro: serializer.fromJson<DateTime>(json['horaRegistro']),
      idPalma: serializer.fromJson<int>(json['idPalma']),
      nombreEnfermedad: serializer.fromJson<String>(json['nombreEnfermedad']),
      idEtapaEnfermedad: serializer.fromJson<int?>(json['idEtapaEnfermedad']),
      observaciones: serializer.fromJson<String?>(json['observaciones']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fechaRegistro': serializer.toJson<DateTime>(fechaRegistro),
      'horaRegistro': serializer.toJson<DateTime>(horaRegistro),
      'idPalma': serializer.toJson<int>(idPalma),
      'nombreEnfermedad': serializer.toJson<String>(nombreEnfermedad),
      'idEtapaEnfermedad': serializer.toJson<int?>(idEtapaEnfermedad),
      'observaciones': serializer.toJson<String?>(observaciones),
    };
  }

  RegistroEnfermedadData copyWith(
          {int? id,
          DateTime? fechaRegistro,
          DateTime? horaRegistro,
          int? idPalma,
          String? nombreEnfermedad,
          int? idEtapaEnfermedad,
          String? observaciones}) =>
      RegistroEnfermedadData(
        id: id ?? this.id,
        fechaRegistro: fechaRegistro ?? this.fechaRegistro,
        horaRegistro: horaRegistro ?? this.horaRegistro,
        idPalma: idPalma ?? this.idPalma,
        nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
        idEtapaEnfermedad: idEtapaEnfermedad ?? this.idEtapaEnfermedad,
        observaciones: observaciones ?? this.observaciones,
      );
  @override
  String toString() {
    return (StringBuffer('RegistroEnfermedadData(')
          ..write('id: $id, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('horaRegistro: $horaRegistro, ')
          ..write('idPalma: $idPalma, ')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('idEtapaEnfermedad: $idEtapaEnfermedad, ')
          ..write('observaciones: $observaciones')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fechaRegistro, horaRegistro, idPalma,
      nombreEnfermedad, idEtapaEnfermedad, observaciones);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegistroEnfermedadData &&
          other.id == this.id &&
          other.fechaRegistro == this.fechaRegistro &&
          other.horaRegistro == this.horaRegistro &&
          other.idPalma == this.idPalma &&
          other.nombreEnfermedad == this.nombreEnfermedad &&
          other.idEtapaEnfermedad == this.idEtapaEnfermedad &&
          other.observaciones == this.observaciones);
}

class RegistroEnfermedadCompanion
    extends UpdateCompanion<RegistroEnfermedadData> {
  final Value<int> id;
  final Value<DateTime> fechaRegistro;
  final Value<DateTime> horaRegistro;
  final Value<int> idPalma;
  final Value<String> nombreEnfermedad;
  final Value<int?> idEtapaEnfermedad;
  final Value<String?> observaciones;
  const RegistroEnfermedadCompanion({
    this.id = const Value.absent(),
    this.fechaRegistro = const Value.absent(),
    this.horaRegistro = const Value.absent(),
    this.idPalma = const Value.absent(),
    this.nombreEnfermedad = const Value.absent(),
    this.idEtapaEnfermedad = const Value.absent(),
    this.observaciones = const Value.absent(),
  });
  RegistroEnfermedadCompanion.insert({
    this.id = const Value.absent(),
    required DateTime fechaRegistro,
    required DateTime horaRegistro,
    required int idPalma,
    required String nombreEnfermedad,
    this.idEtapaEnfermedad = const Value.absent(),
    this.observaciones = const Value.absent(),
  })  : fechaRegistro = Value(fechaRegistro),
        horaRegistro = Value(horaRegistro),
        idPalma = Value(idPalma),
        nombreEnfermedad = Value(nombreEnfermedad);
  static Insertable<RegistroEnfermedadData> custom({
    Expression<int>? id,
    Expression<DateTime>? fechaRegistro,
    Expression<DateTime>? horaRegistro,
    Expression<int>? idPalma,
    Expression<String>? nombreEnfermedad,
    Expression<int?>? idEtapaEnfermedad,
    Expression<String?>? observaciones,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fechaRegistro != null) 'fecha_registro': fechaRegistro,
      if (horaRegistro != null) 'hora_registro': horaRegistro,
      if (idPalma != null) 'id_palma': idPalma,
      if (nombreEnfermedad != null) 'nombre_enfermedad': nombreEnfermedad,
      if (idEtapaEnfermedad != null) 'id_etapa_enfermedad': idEtapaEnfermedad,
      if (observaciones != null) 'observaciones': observaciones,
    });
  }

  RegistroEnfermedadCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? fechaRegistro,
      Value<DateTime>? horaRegistro,
      Value<int>? idPalma,
      Value<String>? nombreEnfermedad,
      Value<int?>? idEtapaEnfermedad,
      Value<String?>? observaciones}) {
    return RegistroEnfermedadCompanion(
      id: id ?? this.id,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
      horaRegistro: horaRegistro ?? this.horaRegistro,
      idPalma: idPalma ?? this.idPalma,
      nombreEnfermedad: nombreEnfermedad ?? this.nombreEnfermedad,
      idEtapaEnfermedad: idEtapaEnfermedad ?? this.idEtapaEnfermedad,
      observaciones: observaciones ?? this.observaciones,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fechaRegistro.present) {
      map['fecha_registro'] = Variable<DateTime>(fechaRegistro.value);
    }
    if (horaRegistro.present) {
      map['hora_registro'] = Variable<DateTime>(horaRegistro.value);
    }
    if (idPalma.present) {
      map['id_palma'] = Variable<int>(idPalma.value);
    }
    if (nombreEnfermedad.present) {
      map['nombre_enfermedad'] = Variable<String>(nombreEnfermedad.value);
    }
    if (idEtapaEnfermedad.present) {
      map['id_etapa_enfermedad'] = Variable<int?>(idEtapaEnfermedad.value);
    }
    if (observaciones.present) {
      map['observaciones'] = Variable<String?>(observaciones.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegistroEnfermedadCompanion(')
          ..write('id: $id, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('horaRegistro: $horaRegistro, ')
          ..write('idPalma: $idPalma, ')
          ..write('nombreEnfermedad: $nombreEnfermedad, ')
          ..write('idEtapaEnfermedad: $idEtapaEnfermedad, ')
          ..write('observaciones: $observaciones')
          ..write(')'))
        .toString();
  }
}

class $RegistroEnfermedadTable extends RegistroEnfermedad
    with TableInfo<$RegistroEnfermedadTable, RegistroEnfermedadData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RegistroEnfermedadTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _fechaRegistroMeta =
      const VerificationMeta('fechaRegistro');
  late final GeneratedColumn<DateTime?> fechaRegistro =
      GeneratedColumn<DateTime?>('fecha_registro', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _horaRegistroMeta =
      const VerificationMeta('horaRegistro');
  late final GeneratedColumn<DateTime?> horaRegistro =
      GeneratedColumn<DateTime?>('hora_registro', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _idPalmaMeta = const VerificationMeta('idPalma');
  late final GeneratedColumn<int?> idPalma = GeneratedColumn<int?>(
      'id_palma', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nombreEnfermedadMeta =
      const VerificationMeta('nombreEnfermedad');
  late final GeneratedColumn<String?> nombreEnfermedad =
      GeneratedColumn<String?>('nombre_enfermedad', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idEtapaEnfermedadMeta =
      const VerificationMeta('idEtapaEnfermedad');
  late final GeneratedColumn<int?> idEtapaEnfermedad = GeneratedColumn<int?>(
      'id_etapa_enfermedad', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _observacionesMeta =
      const VerificationMeta('observaciones');
  late final GeneratedColumn<String?> observaciones = GeneratedColumn<String?>(
      'observaciones', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        fechaRegistro,
        horaRegistro,
        idPalma,
        nombreEnfermedad,
        idEtapaEnfermedad,
        observaciones
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
    } else if (isInserting) {
      context.missing(_horaRegistroMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegistroEnfermedadData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RegistroEnfermedadData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RegistroEnfermedadTable createAlias(String alias) {
    return $RegistroEnfermedadTable(_db, alias);
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
  RegistroTratamientoData(
      {required this.id,
      required this.idRegistroEnfermedad,
      required this.idProductoAgroquimico,
      required this.tipoControl,
      required this.dosis,
      this.descripcionProcedimiento,
      required this.fechaRegistro});
  factory RegistroTratamientoData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RegistroTratamientoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idRegistroEnfermedad: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_registro_enfermedad'])!,
      idProductoAgroquimico: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_producto_agroquimico'])!,
      tipoControl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tipo_control'])!,
      dosis: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dosis'])!,
      descripcionProcedimiento: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}descripcion_procedimiento']),
      fechaRegistro: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_registro'])!,
    );
  }
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
          Variable<String?>(descripcionProcedimiento);
    }
    map['fecha_registro'] = Variable<DateTime>(fechaRegistro);
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
    };
  }

  RegistroTratamientoData copyWith(
          {int? id,
          int? idRegistroEnfermedad,
          int? idProductoAgroquimico,
          String? tipoControl,
          double? dosis,
          String? descripcionProcedimiento,
          DateTime? fechaRegistro}) =>
      RegistroTratamientoData(
        id: id ?? this.id,
        idRegistroEnfermedad: idRegistroEnfermedad ?? this.idRegistroEnfermedad,
        idProductoAgroquimico:
            idProductoAgroquimico ?? this.idProductoAgroquimico,
        tipoControl: tipoControl ?? this.tipoControl,
        dosis: dosis ?? this.dosis,
        descripcionProcedimiento:
            descripcionProcedimiento ?? this.descripcionProcedimiento,
        fechaRegistro: fechaRegistro ?? this.fechaRegistro,
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
          ..write('fechaRegistro: $fechaRegistro')
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
      fechaRegistro);
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
          other.fechaRegistro == this.fechaRegistro);
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
  const RegistroTratamientoCompanion({
    this.id = const Value.absent(),
    this.idRegistroEnfermedad = const Value.absent(),
    this.idProductoAgroquimico = const Value.absent(),
    this.tipoControl = const Value.absent(),
    this.dosis = const Value.absent(),
    this.descripcionProcedimiento = const Value.absent(),
    this.fechaRegistro = const Value.absent(),
  });
  RegistroTratamientoCompanion.insert({
    this.id = const Value.absent(),
    required int idRegistroEnfermedad,
    required int idProductoAgroquimico,
    required String tipoControl,
    required double dosis,
    this.descripcionProcedimiento = const Value.absent(),
    required DateTime fechaRegistro,
  })  : idRegistroEnfermedad = Value(idRegistroEnfermedad),
        idProductoAgroquimico = Value(idProductoAgroquimico),
        tipoControl = Value(tipoControl),
        dosis = Value(dosis),
        fechaRegistro = Value(fechaRegistro);
  static Insertable<RegistroTratamientoData> custom({
    Expression<int>? id,
    Expression<int>? idRegistroEnfermedad,
    Expression<int>? idProductoAgroquimico,
    Expression<String>? tipoControl,
    Expression<double>? dosis,
    Expression<String?>? descripcionProcedimiento,
    Expression<DateTime>? fechaRegistro,
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
    });
  }

  RegistroTratamientoCompanion copyWith(
      {Value<int>? id,
      Value<int>? idRegistroEnfermedad,
      Value<int>? idProductoAgroquimico,
      Value<String>? tipoControl,
      Value<double>? dosis,
      Value<String?>? descripcionProcedimiento,
      Value<DateTime>? fechaRegistro}) {
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
          Variable<String?>(descripcionProcedimiento.value);
    }
    if (fechaRegistro.present) {
      map['fecha_registro'] = Variable<DateTime>(fechaRegistro.value);
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
          ..write('fechaRegistro: $fechaRegistro')
          ..write(')'))
        .toString();
  }
}

class $RegistroTratamientoTable extends RegistroTratamiento
    with TableInfo<$RegistroTratamientoTable, RegistroTratamientoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RegistroTratamientoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idRegistroEnfermedadMeta =
      const VerificationMeta('idRegistroEnfermedad');
  late final GeneratedColumn<int?> idRegistroEnfermedad = GeneratedColumn<int?>(
      'id_registro_enfermedad', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES registro_enfermedad(id)');
  final VerificationMeta _idProductoAgroquimicoMeta =
      const VerificationMeta('idProductoAgroquimico');
  late final GeneratedColumn<int?> idProductoAgroquimico =
      GeneratedColumn<int?>('id_producto_agroquimico', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: true,
          $customConstraints: 'REFERENCES producto_agroquimico(id)');
  final VerificationMeta _tipoControlMeta =
      const VerificationMeta('tipoControl');
  late final GeneratedColumn<String?> tipoControl = GeneratedColumn<String?>(
      'tipo_control', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dosisMeta = const VerificationMeta('dosis');
  late final GeneratedColumn<double?> dosis = GeneratedColumn<double?>(
      'dosis', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _descripcionProcedimientoMeta =
      const VerificationMeta('descripcionProcedimiento');
  late final GeneratedColumn<String?> descripcionProcedimiento =
      GeneratedColumn<String?>('descripcion_procedimiento', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _fechaRegistroMeta =
      const VerificationMeta('fechaRegistro');
  late final GeneratedColumn<DateTime?> fechaRegistro =
      GeneratedColumn<DateTime?>('fecha_registro', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idRegistroEnfermedad,
        idProductoAgroquimico,
        tipoControl,
        dosis,
        descripcionProcedimiento,
        fechaRegistro
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegistroTratamientoData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return RegistroTratamientoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RegistroTratamientoTable createAlias(String alias) {
    return $RegistroTratamientoTable(_db, alias);
  }
}

class Viaje extends DataClass implements Insertable<Viaje> {
  final int id;
  final DateTime horaCargue;
  final DateTime? horaSalida;
  final int cantidadRacimos;
  final int? kilos;
  final int? kilosExtractora;
  final bool completado;
  Viaje(
      {required this.id,
      required this.horaCargue,
      this.horaSalida,
      required this.cantidadRacimos,
      this.kilos,
      this.kilosExtractora,
      required this.completado});
  factory Viaje.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Viaje(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      horaCargue: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hora_cargue'])!,
      horaSalida: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hora_salida']),
      cantidadRacimos: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cantidad_racimos'])!,
      kilos: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}kilos']),
      kilosExtractora: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}kilos_extractora']),
      completado: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completado'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hora_cargue'] = Variable<DateTime>(horaCargue);
    if (!nullToAbsent || horaSalida != null) {
      map['hora_salida'] = Variable<DateTime?>(horaSalida);
    }
    map['cantidad_racimos'] = Variable<int>(cantidadRacimos);
    if (!nullToAbsent || kilos != null) {
      map['kilos'] = Variable<int?>(kilos);
    }
    if (!nullToAbsent || kilosExtractora != null) {
      map['kilos_extractora'] = Variable<int?>(kilosExtractora);
    }
    map['completado'] = Variable<bool>(completado);
    return map;
  }

  ViajesCompanion toCompanion(bool nullToAbsent) {
    return ViajesCompanion(
      id: Value(id),
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
    );
  }

  factory Viaje.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Viaje(
      id: serializer.fromJson<int>(json['id']),
      horaCargue: serializer.fromJson<DateTime>(json['horaCargue']),
      horaSalida: serializer.fromJson<DateTime?>(json['horaSalida']),
      cantidadRacimos: serializer.fromJson<int>(json['cantidadRacimos']),
      kilos: serializer.fromJson<int?>(json['kilos']),
      kilosExtractora: serializer.fromJson<int?>(json['kilosExtractora']),
      completado: serializer.fromJson<bool>(json['completado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'horaCargue': serializer.toJson<DateTime>(horaCargue),
      'horaSalida': serializer.toJson<DateTime?>(horaSalida),
      'cantidadRacimos': serializer.toJson<int>(cantidadRacimos),
      'kilos': serializer.toJson<int?>(kilos),
      'kilosExtractora': serializer.toJson<int?>(kilosExtractora),
      'completado': serializer.toJson<bool>(completado),
    };
  }

  Viaje copyWith(
          {int? id,
          DateTime? horaCargue,
          DateTime? horaSalida,
          int? cantidadRacimos,
          int? kilos,
          int? kilosExtractora,
          bool? completado}) =>
      Viaje(
        id: id ?? this.id,
        horaCargue: horaCargue ?? this.horaCargue,
        horaSalida: horaSalida ?? this.horaSalida,
        cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
        kilos: kilos ?? this.kilos,
        kilosExtractora: kilosExtractora ?? this.kilosExtractora,
        completado: completado ?? this.completado,
      );
  @override
  String toString() {
    return (StringBuffer('Viaje(')
          ..write('id: $id, ')
          ..write('horaCargue: $horaCargue, ')
          ..write('horaSalida: $horaSalida, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('kilos: $kilos, ')
          ..write('kilosExtractora: $kilosExtractora, ')
          ..write('completado: $completado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, horaCargue, horaSalida, cantidadRacimos,
      kilos, kilosExtractora, completado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Viaje &&
          other.id == this.id &&
          other.horaCargue == this.horaCargue &&
          other.horaSalida == this.horaSalida &&
          other.cantidadRacimos == this.cantidadRacimos &&
          other.kilos == this.kilos &&
          other.kilosExtractora == this.kilosExtractora &&
          other.completado == this.completado);
}

class ViajesCompanion extends UpdateCompanion<Viaje> {
  final Value<int> id;
  final Value<DateTime> horaCargue;
  final Value<DateTime?> horaSalida;
  final Value<int> cantidadRacimos;
  final Value<int?> kilos;
  final Value<int?> kilosExtractora;
  final Value<bool> completado;
  const ViajesCompanion({
    this.id = const Value.absent(),
    this.horaCargue = const Value.absent(),
    this.horaSalida = const Value.absent(),
    this.cantidadRacimos = const Value.absent(),
    this.kilos = const Value.absent(),
    this.kilosExtractora = const Value.absent(),
    this.completado = const Value.absent(),
  });
  ViajesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime horaCargue,
    this.horaSalida = const Value.absent(),
    required int cantidadRacimos,
    this.kilos = const Value.absent(),
    this.kilosExtractora = const Value.absent(),
    this.completado = const Value.absent(),
  })  : horaCargue = Value(horaCargue),
        cantidadRacimos = Value(cantidadRacimos);
  static Insertable<Viaje> custom({
    Expression<int>? id,
    Expression<DateTime>? horaCargue,
    Expression<DateTime?>? horaSalida,
    Expression<int>? cantidadRacimos,
    Expression<int?>? kilos,
    Expression<int?>? kilosExtractora,
    Expression<bool>? completado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (horaCargue != null) 'hora_cargue': horaCargue,
      if (horaSalida != null) 'hora_salida': horaSalida,
      if (cantidadRacimos != null) 'cantidad_racimos': cantidadRacimos,
      if (kilos != null) 'kilos': kilos,
      if (kilosExtractora != null) 'kilos_extractora': kilosExtractora,
      if (completado != null) 'completado': completado,
    });
  }

  ViajesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? horaCargue,
      Value<DateTime?>? horaSalida,
      Value<int>? cantidadRacimos,
      Value<int?>? kilos,
      Value<int?>? kilosExtractora,
      Value<bool>? completado}) {
    return ViajesCompanion(
      id: id ?? this.id,
      horaCargue: horaCargue ?? this.horaCargue,
      horaSalida: horaSalida ?? this.horaSalida,
      cantidadRacimos: cantidadRacimos ?? this.cantidadRacimos,
      kilos: kilos ?? this.kilos,
      kilosExtractora: kilosExtractora ?? this.kilosExtractora,
      completado: completado ?? this.completado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (horaCargue.present) {
      map['hora_cargue'] = Variable<DateTime>(horaCargue.value);
    }
    if (horaSalida.present) {
      map['hora_salida'] = Variable<DateTime?>(horaSalida.value);
    }
    if (cantidadRacimos.present) {
      map['cantidad_racimos'] = Variable<int>(cantidadRacimos.value);
    }
    if (kilos.present) {
      map['kilos'] = Variable<int?>(kilos.value);
    }
    if (kilosExtractora.present) {
      map['kilos_extractora'] = Variable<int?>(kilosExtractora.value);
    }
    if (completado.present) {
      map['completado'] = Variable<bool>(completado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ViajesCompanion(')
          ..write('id: $id, ')
          ..write('horaCargue: $horaCargue, ')
          ..write('horaSalida: $horaSalida, ')
          ..write('cantidadRacimos: $cantidadRacimos, ')
          ..write('kilos: $kilos, ')
          ..write('kilosExtractora: $kilosExtractora, ')
          ..write('completado: $completado')
          ..write(')'))
        .toString();
  }
}

class $ViajesTable extends Viajes with TableInfo<$ViajesTable, Viaje> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ViajesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _horaCargueMeta = const VerificationMeta('horaCargue');
  late final GeneratedColumn<DateTime?> horaCargue = GeneratedColumn<DateTime?>(
      'hora_cargue', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _horaSalidaMeta = const VerificationMeta('horaSalida');
  late final GeneratedColumn<DateTime?> horaSalida = GeneratedColumn<DateTime?>(
      'hora_salida', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _cantidadRacimosMeta =
      const VerificationMeta('cantidadRacimos');
  late final GeneratedColumn<int?> cantidadRacimos = GeneratedColumn<int?>(
      'cantidad_racimos', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _kilosMeta = const VerificationMeta('kilos');
  late final GeneratedColumn<int?> kilos = GeneratedColumn<int?>(
      'kilos', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _kilosExtractoraMeta =
      const VerificationMeta('kilosExtractora');
  late final GeneratedColumn<int?> kilosExtractora = GeneratedColumn<int?>(
      'kilos_extractora', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _completadoMeta = const VerificationMeta('completado');
  late final GeneratedColumn<bool?> completado = GeneratedColumn<bool?>(
      'completado', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (completado IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        horaCargue,
        horaSalida,
        cantidadRacimos,
        kilos,
        kilosExtractora,
        completado
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Viaje map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Viaje.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ViajesTable createAlias(String alias) {
    return $ViajesTable(_db, alias);
  }
}

class CensoEtapasPlagaData extends DataClass
    implements Insertable<CensoEtapasPlagaData> {
  final int idCensoEtapasplaga;
  final int idCenso;
  final int idEtapasplaga;
  CensoEtapasPlagaData(
      {required this.idCensoEtapasplaga,
      required this.idCenso,
      required this.idEtapasplaga});
  factory CensoEtapasPlagaData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CensoEtapasPlagaData(
      idCensoEtapasplaga: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_censo_etapasplaga'])!,
      idCenso: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_censo'])!,
      idEtapasplaga: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_etapasplaga'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_censo_etapasplaga'] = Variable<int>(idCensoEtapasplaga);
    map['id_censo'] = Variable<int>(idCenso);
    map['id_etapasplaga'] = Variable<int>(idEtapasplaga);
    return map;
  }

  CensoEtapasPlagaCompanion toCompanion(bool nullToAbsent) {
    return CensoEtapasPlagaCompanion(
      idCensoEtapasplaga: Value(idCensoEtapasplaga),
      idCenso: Value(idCenso),
      idEtapasplaga: Value(idEtapasplaga),
    );
  }

  factory CensoEtapasPlagaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CensoEtapasPlagaData(
      idCensoEtapasplaga: serializer.fromJson<int>(json['idCensoEtapasplaga']),
      idCenso: serializer.fromJson<int>(json['idCenso']),
      idEtapasplaga: serializer.fromJson<int>(json['idEtapasplaga']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idCensoEtapasplaga': serializer.toJson<int>(idCensoEtapasplaga),
      'idCenso': serializer.toJson<int>(idCenso),
      'idEtapasplaga': serializer.toJson<int>(idEtapasplaga),
    };
  }

  CensoEtapasPlagaData copyWith(
          {int? idCensoEtapasplaga, int? idCenso, int? idEtapasplaga}) =>
      CensoEtapasPlagaData(
        idCensoEtapasplaga: idCensoEtapasplaga ?? this.idCensoEtapasplaga,
        idCenso: idCenso ?? this.idCenso,
        idEtapasplaga: idEtapasplaga ?? this.idEtapasplaga,
      );
  @override
  String toString() {
    return (StringBuffer('CensoEtapasPlagaData(')
          ..write('idCensoEtapasplaga: $idCensoEtapasplaga, ')
          ..write('idCenso: $idCenso, ')
          ..write('idEtapasplaga: $idEtapasplaga')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idCensoEtapasplaga, idCenso, idEtapasplaga);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CensoEtapasPlagaData &&
          other.idCensoEtapasplaga == this.idCensoEtapasplaga &&
          other.idCenso == this.idCenso &&
          other.idEtapasplaga == this.idEtapasplaga);
}

class CensoEtapasPlagaCompanion extends UpdateCompanion<CensoEtapasPlagaData> {
  final Value<int> idCensoEtapasplaga;
  final Value<int> idCenso;
  final Value<int> idEtapasplaga;
  const CensoEtapasPlagaCompanion({
    this.idCensoEtapasplaga = const Value.absent(),
    this.idCenso = const Value.absent(),
    this.idEtapasplaga = const Value.absent(),
  });
  CensoEtapasPlagaCompanion.insert({
    this.idCensoEtapasplaga = const Value.absent(),
    required int idCenso,
    required int idEtapasplaga,
  })  : idCenso = Value(idCenso),
        idEtapasplaga = Value(idEtapasplaga);
  static Insertable<CensoEtapasPlagaData> custom({
    Expression<int>? idCensoEtapasplaga,
    Expression<int>? idCenso,
    Expression<int>? idEtapasplaga,
  }) {
    return RawValuesInsertable({
      if (idCensoEtapasplaga != null)
        'id_censo_etapasplaga': idCensoEtapasplaga,
      if (idCenso != null) 'id_censo': idCenso,
      if (idEtapasplaga != null) 'id_etapasplaga': idEtapasplaga,
    });
  }

  CensoEtapasPlagaCompanion copyWith(
      {Value<int>? idCensoEtapasplaga,
      Value<int>? idCenso,
      Value<int>? idEtapasplaga}) {
    return CensoEtapasPlagaCompanion(
      idCensoEtapasplaga: idCensoEtapasplaga ?? this.idCensoEtapasplaga,
      idCenso: idCenso ?? this.idCenso,
      idEtapasplaga: idEtapasplaga ?? this.idEtapasplaga,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CensoEtapasPlagaCompanion(')
          ..write('idCensoEtapasplaga: $idCensoEtapasplaga, ')
          ..write('idCenso: $idCenso, ')
          ..write('idEtapasplaga: $idEtapasplaga')
          ..write(')'))
        .toString();
  }
}

class $CensoEtapasPlagaTable extends CensoEtapasPlaga
    with TableInfo<$CensoEtapasPlagaTable, CensoEtapasPlagaData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CensoEtapasPlagaTable(this._db, [this._alias]);
  final VerificationMeta _idCensoEtapasplagaMeta =
      const VerificationMeta('idCensoEtapasplaga');
  late final GeneratedColumn<int?> idCensoEtapasplaga = GeneratedColumn<int?>(
      'id_censo_etapasplaga', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idCensoMeta = const VerificationMeta('idCenso');
  late final GeneratedColumn<int?> idCenso = GeneratedColumn<int?>(
      'id_censo', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _idEtapasplagaMeta =
      const VerificationMeta('idEtapasplaga');
  late final GeneratedColumn<int?> idEtapasplaga = GeneratedColumn<int?>(
      'id_etapasplaga', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idCensoEtapasplaga, idCenso, idEtapasplaga];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idCensoEtapasplaga};
  @override
  CensoEtapasPlagaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CensoEtapasPlagaData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CensoEtapasPlagaTable createAlias(String alias) {
    return $CensoEtapasPlagaTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AplicacionesTable aplicaciones = $AplicacionesTable(this);
  late final $CensoTable censo = $CensoTable(this);
  late final $CosechasTable cosechas = $CosechasTable(this);
  late final $CosechaDiariaTable cosechaDiaria = $CosechaDiariaTable(this);
  late final $EnfermedadesTable enfermedades = $EnfermedadesTable(this);
  late final $EtapasTable etapas = $EtapasTable(this);
  late final $EtapasPlagaTable etapasPlaga = $EtapasPlagaTable(this);
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
  late final $RegistroTratamientoTable registroTratamiento =
      $RegistroTratamientoTable(this);
  late final $ViajesTable viajes = $ViajesTable(this);
  late final $CensoEtapasPlagaTable censoEtapasPlaga =
      $CensoEtapasPlagaTable(this);
  late final CosechaDao cosechaDao = CosechaDao(this as AppDatabase);
  late final CosechaDiariaDao cosechaDiariaDao =
      CosechaDiariaDao(this as AppDatabase);
  late final EnfermedadesDao enfermedadesDao =
      EnfermedadesDao(this as AppDatabase);
  late final FumigacionDao fumigacionDao = FumigacionDao(this as AppDatabase);
  late final LoteDao loteDao = LoteDao(this as AppDatabase);
  late final PalmaDao palmaDao = PalmaDao(this as AppDatabase);
  late final PlagasDao plagasDao = PlagasDao(this as AppDatabase);
  late final PodaDao podaDao = PodaDao(this as AppDatabase);
  late final PlateoDao plateoDao = PlateoDao(this as AppDatabase);
  late final ProductoAgroquimicoDao productoAgroquimicoDao =
      ProductoAgroquimicoDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        aplicaciones,
        censo,
        cosechas,
        cosechaDiaria,
        enfermedades,
        etapas,
        etapasPlaga,
        lotes,
        palmas,
        plagas,
        plateos,
        plateoDiario,
        podas,
        podaDiaria,
        productoAgroquimico,
        registroEnfermedad,
        registroTratamiento,
        viajes,
        censoEtapasPlaga
      ];
}
