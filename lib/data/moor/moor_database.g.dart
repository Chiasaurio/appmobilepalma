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
  static const VerificationMeta _ccUsuarioMeta =
      const VerificationMeta('ccUsuario');
  @override
  late final GeneratedColumn<String> ccUsuario = GeneratedColumn<String>(
      'cc_usuario', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
        ccUsuario,
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
      ccUsuario: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cc_usuario'])!,
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
  final String ccUsuario;
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
      required this.ccUsuario,
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
    map['cc_usuario'] = Variable<String>(ccUsuario);
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
      ccUsuario: Value(ccUsuario),
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
      ccUsuario: serializer.fromJson<String>(json['ccUsuario']),
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
      'ccUsuario': serializer.toJson<String>(ccUsuario),
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
          String? ccUsuario,
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
        ccUsuario: ccUsuario ?? this.ccUsuario,
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
          ..write('ccUsuario: $ccUsuario, ')
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
      ccUsuario,
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
          other.ccUsuario == this.ccUsuario &&
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
  final Value<String> ccUsuario;
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
    this.ccUsuario = const Value.absent(),
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
    required String ccUsuario,
    required int idCenso,
    required int idProductoAgroquimico,
    required String responsable,
    this.sincronizado = const Value.absent(),
  })  : dosis = Value(dosis),
        area = Value(area),
        fechaAplicacion = Value(fechaAplicacion),
        fechaReingreso = Value(fechaReingreso),
        ccUsuario = Value(ccUsuario),
        idCenso = Value(idCenso),
        idProductoAgroquimico = Value(idProductoAgroquimico),
        responsable = Value(responsable);
  static Insertable<Aplicacione> custom({
    Expression<int>? id,
    Expression<double>? dosis,
    Expression<int>? area,
    Expression<DateTime>? fechaAplicacion,
    Expression<DateTime>? fechaReingreso,
    Expression<String>? ccUsuario,
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
      if (ccUsuario != null) 'cc_usuario': ccUsuario,
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
      Value<String>? ccUsuario,
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
      ccUsuario: ccUsuario ?? this.ccUsuario,
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
          ..write('ccUsuario: $ccUsuario, ')
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
  static const VerificationMeta _idCensoMeta =
      const VerificationMeta('idCenso');
  @override
  late final GeneratedColumn<int> idCenso = GeneratedColumn<int>(
      'id_censo', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fechaCensoMeta =
      const VerificationMeta('fechaCenso');
  @override
  late final GeneratedColumn<DateTime> fechaCenso = GeneratedColumn<DateTime>(
      'fecha_censo', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _presenciaLoteMeta =
      const VerificationMeta('presenciaLote');
  @override
  late final GeneratedColumn<bool> presenciaLote =
      GeneratedColumn<bool>('presencia_lote', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("presencia_lote" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _presenciaSectorMeta =
      const VerificationMeta('presenciaSector');
  @override
  late final GeneratedColumn<bool> presenciaSector =
      GeneratedColumn<bool>('presencia_sector', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("presencia_sector" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(true));
  static const VerificationMeta _lineaLimite1Meta =
      const VerificationMeta('lineaLimite1');
  @override
  late final GeneratedColumn<int> lineaLimite1 = GeneratedColumn<int>(
      'linea_limite1', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lineaLimite2Meta =
      const VerificationMeta('lineaLimite2');
  @override
  late final GeneratedColumn<int> lineaLimite2 = GeneratedColumn<int>(
      'linea_limite2', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
      defaultValue: const Constant('pendiente'));
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
        idCenso,
        fechaCenso,
        presenciaLote,
        presenciaSector,
        lineaLimite1,
        lineaLimite2,
        observacionCenso,
        nombreLote,
        nombrePlaga,
        estadoPlaga,
        sincronizado
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
    if (data.containsKey('sincronizado')) {
      context.handle(
          _sincronizadoMeta,
          sincronizado.isAcceptableOrUnknown(
              data['sincronizado']!, _sincronizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idCenso};
  @override
  CensoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CensoData(
      idCenso: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_censo'])!,
      fechaCenso: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_censo'])!,
      presenciaLote: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}presencia_lote'])!,
      presenciaSector: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}presencia_sector'])!,
      lineaLimite1: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}linea_limite1'])!,
      lineaLimite2: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}linea_limite2'])!,
      observacionCenso: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}observacion_censo']),
      nombreLote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_lote'])!,
      nombrePlaga: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_plaga'])!,
      estadoPlaga: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}estado_plaga'])!,
      sincronizado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sincronizado'])!,
    );
  }

  @override
  $CensoTable createAlias(String alias) {
    return $CensoTable(attachedDatabase, alias);
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
  final bool sincronizado;
  const CensoData(
      {required this.idCenso,
      required this.fechaCenso,
      required this.presenciaLote,
      required this.presenciaSector,
      required this.lineaLimite1,
      required this.lineaLimite2,
      this.observacionCenso,
      required this.nombreLote,
      required this.nombrePlaga,
      required this.estadoPlaga,
      required this.sincronizado});
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
      map['observacion_censo'] = Variable<String>(observacionCenso);
    }
    map['nombre_lote'] = Variable<String>(nombreLote);
    map['nombre_plaga'] = Variable<String>(nombrePlaga);
    map['estado_plaga'] = Variable<String>(estadoPlaga);
    map['sincronizado'] = Variable<bool>(sincronizado);
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
      sincronizado: Value(sincronizado),
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
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
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
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  CensoData copyWith(
          {int? idCenso,
          DateTime? fechaCenso,
          bool? presenciaLote,
          bool? presenciaSector,
          int? lineaLimite1,
          int? lineaLimite2,
          Value<String?> observacionCenso = const Value.absent(),
          String? nombreLote,
          String? nombrePlaga,
          String? estadoPlaga,
          bool? sincronizado}) =>
      CensoData(
        idCenso: idCenso ?? this.idCenso,
        fechaCenso: fechaCenso ?? this.fechaCenso,
        presenciaLote: presenciaLote ?? this.presenciaLote,
        presenciaSector: presenciaSector ?? this.presenciaSector,
        lineaLimite1: lineaLimite1 ?? this.lineaLimite1,
        lineaLimite2: lineaLimite2 ?? this.lineaLimite2,
        observacionCenso: observacionCenso.present
            ? observacionCenso.value
            : this.observacionCenso,
        nombreLote: nombreLote ?? this.nombreLote,
        nombrePlaga: nombrePlaga ?? this.nombrePlaga,
        estadoPlaga: estadoPlaga ?? this.estadoPlaga,
        sincronizado: sincronizado ?? this.sincronizado,
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
          ..write('estadoPlaga: $estadoPlaga, ')
          ..write('sincronizado: $sincronizado')
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
      estadoPlaga,
      sincronizado);
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
          other.estadoPlaga == this.estadoPlaga &&
          other.sincronizado == this.sincronizado);
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
  final Value<bool> sincronizado;
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
    this.sincronizado = const Value.absent(),
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
    this.sincronizado = const Value.absent(),
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
    Expression<String>? observacionCenso,
    Expression<String>? nombreLote,
    Expression<String>? nombrePlaga,
    Expression<String>? estadoPlaga,
    Expression<bool>? sincronizado,
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
      if (sincronizado != null) 'sincronizado': sincronizado,
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
      Value<String>? estadoPlaga,
      Value<bool>? sincronizado}) {
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
      sincronizado: sincronizado ?? this.sincronizado,
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
      map['observacion_censo'] = Variable<String>(observacionCenso.value);
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
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
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
          ..write('estadoPlaga: $estadoPlaga, ')
          ..write('sincronizado: $sincronizado')
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
  int get hashCode => Object.hash(id, nombreLote, fechaIngreso, fechaSalida,
      cantidadRacimos, kilos, idViaje, completada, sincronizado);
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
          other.completada == this.completada &&
          other.sincronizado == this.sincronizado);
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
  final Value<bool> sincronizado;
  const CosechasCompanion({
    this.id = const Value.absent(),
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Enfermedade(
      nombreEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nombre_enfermedad'])!,
      procedimientoEnfermedad: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}procedimiento_enfermedad'])!,
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
  const Enfermedade(
      {required this.nombreEnfermedad, required this.procedimientoEnfermedad});
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
  const Lote(
      {required this.id,
      required this.nombreLote,
      required this.hectareas,
      required this.numeropalmas});
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plaga(
      nombreComunPlaga: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nombre_comun_plaga'])!,
    );
  }

  @override
  $PlagasTable createAlias(String alias) {
    return $PlagasTable(attachedDatabase, alias);
  }
}

class Plaga extends DataClass implements Insertable<Plaga> {
  final String nombreComunPlaga;
  const Plaga({required this.nombreComunPlaga});
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
  final String nombreLote;
  final DateTime fechaIngreso;
  final DateTime? fechaSalida;
  final int cantidadPlateada;
  final bool completado;
  final bool sincronizado;
  const Plateo(
      {required this.id,
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
          String? nombreLote,
          DateTime? fechaIngreso,
          Value<DateTime?> fechaSalida = const Value.absent(),
          int? cantidadPlateada,
          bool? completado,
          bool? sincronizado}) =>
      Plateo(
        id: id ?? this.id,
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
  int get hashCode => Object.hash(id, nombreLote, fechaIngreso, fechaSalida,
      cantidadPlateada, completado, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plateo &&
          other.id == this.id &&
          other.nombreLote == this.nombreLote &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaSalida == this.fechaSalida &&
          other.cantidadPlateada == this.cantidadPlateada &&
          other.completado == this.completado &&
          other.sincronizado == this.sincronizado);
}

class PlateosCompanion extends UpdateCompanion<Plateo> {
  final Value<int> id;
  final Value<String> nombreLote;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaSalida;
  final Value<int> cantidadPlateada;
  final Value<bool> completado;
  final Value<bool> sincronizado;
  const PlateosCompanion({
    this.id = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.cantidadPlateada = const Value.absent(),
    this.completado = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  PlateosCompanion.insert({
    this.id = const Value.absent(),
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
    Expression<String>? nombreLote,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime>? fechaSalida,
    Expression<int>? cantidadPlateada,
    Expression<bool>? completado,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
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
      Value<String>? nombreLote,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? fechaSalida,
      Value<int>? cantidadPlateada,
      Value<bool>? completado,
      Value<bool>? sincronizado}) {
    return PlateosCompanion(
      id: id ?? this.id,
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
  final String nombreLote;
  final DateTime fechaIngreso;
  final DateTime? fechaSalida;
  final int cantidadPodada;
  final bool completada;
  final bool sincronizado;
  const Poda(
      {required this.id,
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
          String? nombreLote,
          DateTime? fechaIngreso,
          Value<DateTime?> fechaSalida = const Value.absent(),
          int? cantidadPodada,
          bool? completada,
          bool? sincronizado}) =>
      Poda(
        id: id ?? this.id,
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
  int get hashCode => Object.hash(id, nombreLote, fechaIngreso, fechaSalida,
      cantidadPodada, completada, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Poda &&
          other.id == this.id &&
          other.nombreLote == this.nombreLote &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaSalida == this.fechaSalida &&
          other.cantidadPodada == this.cantidadPodada &&
          other.completada == this.completada &&
          other.sincronizado == this.sincronizado);
}

class PodasCompanion extends UpdateCompanion<Poda> {
  final Value<int> id;
  final Value<String> nombreLote;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaSalida;
  final Value<int> cantidadPodada;
  final Value<bool> completada;
  final Value<bool> sincronizado;
  const PodasCompanion({
    this.id = const Value.absent(),
    this.nombreLote = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.cantidadPodada = const Value.absent(),
    this.completada = const Value.absent(),
    this.sincronizado = const Value.absent(),
  });
  PodasCompanion.insert({
    this.id = const Value.absent(),
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
    Expression<String>? nombreLote,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime>? fechaSalida,
    Expression<int>? cantidadPodada,
    Expression<bool>? completada,
    Expression<bool>? sincronizado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
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
      Value<String>? nombreLote,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? fechaSalida,
      Value<int>? cantidadPodada,
      Value<bool>? completada,
      Value<bool>? sincronizado}) {
    return PodasCompanion(
      id: id ?? this.id,
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
  @override
  List<GeneratedColumn> get $columns => [
        idProductoAgroquimico,
        nombreProductoAgroquimico,
        tipoProductoAgroquimico,
        claseProducto,
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
  const ProductoAgroquimicoData(
      {required this.idProductoAgroquimico,
      required this.nombreProductoAgroquimico,
      required this.tipoProductoAgroquimico,
      required this.claseProducto,
      required this.ingredienteActivoProductoAgroquimico,
      required this.periodoCarenciaProductoAgroquimico,
      required this.presentacionProductoAgroquimico});
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
    };
  }

  ProductoAgroquimicoData copyWith(
          {int? idProductoAgroquimico,
          String? nombreProductoAgroquimico,
          String? tipoProductoAgroquimico,
          String? claseProducto,
          String? ingredienteActivoProductoAgroquimico,
          int? periodoCarenciaProductoAgroquimico,
          String? presentacionProductoAgroquimico}) =>
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
              'presentacionProductoAgroquimico: $presentacionProductoAgroquimico')
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
      presentacionProductoAgroquimico);
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
              this.presentacionProductoAgroquimico);
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
  const ProductoAgroquimicoCompanion({
    this.idProductoAgroquimico = const Value.absent(),
    this.nombreProductoAgroquimico = const Value.absent(),
    this.tipoProductoAgroquimico = const Value.absent(),
    this.claseProducto = const Value.absent(),
    this.ingredienteActivoProductoAgroquimico = const Value.absent(),
    this.periodoCarenciaProductoAgroquimico = const Value.absent(),
    this.presentacionProductoAgroquimico = const Value.absent(),
  });
  ProductoAgroquimicoCompanion.insert({
    this.idProductoAgroquimico = const Value.absent(),
    required String nombreProductoAgroquimico,
    required String tipoProductoAgroquimico,
    required String claseProducto,
    required String ingredienteActivoProductoAgroquimico,
    required int periodoCarenciaProductoAgroquimico,
    required String presentacionProductoAgroquimico,
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
    });
  }

  ProductoAgroquimicoCompanion copyWith(
      {Value<int>? idProductoAgroquimico,
      Value<String>? nombreProductoAgroquimico,
      Value<String>? tipoProductoAgroquimico,
      Value<String>? claseProducto,
      Value<String>? ingredienteActivoProductoAgroquimico,
      Value<int>? periodoCarenciaProductoAgroquimico,
      Value<String>? presentacionProductoAgroquimico}) {
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
              'presentacionProductoAgroquimico: $presentacionProductoAgroquimico')
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
  int get hashCode => Object.hash(id, horaCargue, horaSalida, cantidadRacimos,
      kilos, kilosExtractora, completado, responsable, sincronizado);
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
          other.completado == this.completado &&
          other.responsable == this.responsable &&
          other.sincronizado == this.sincronizado);
}

class ViajesCompanion extends UpdateCompanion<Viaje> {
  final Value<int> id;
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CensoEtapasPlagaData(
      idCensoEtapasplaga: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_censo_etapasplaga'])!,
      idCenso: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_censo'])!,
      idEtapasplaga: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_etapasplaga'])!,
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
  const CensoEtapasPlagaData(
      {required this.idCensoEtapasplaga,
      required this.idCenso,
      required this.idEtapasplaga});
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
        registroTratamiento,
        viajes,
        censoEtapasPlaga
      ];
}
