part of 'tratamiento_cubit.dart';

enum TratamientoStatus { initial, loading, loaded, selected, success, error }

class TratamientoState extends Equatable {
  final TratamientoStatus status;
  final List<PalmaConEnfermedad>? palmasEnfermas;
  final PalmaConEnfermedad? palmaEnferma;
  final List<ProductoAgroquimicoData>? productos;

  const TratamientoState(
      {this.palmasEnfermas,
      this.palmaEnferma,
      this.productos,
      this.status = TratamientoStatus.initial});
  TratamientoState copyWith({
    TratamientoStatus? status,
    List<PalmaConEnfermedad>? palmasEnfermas,
    PalmaConEnfermedad? palmaEnferma,
    List<ProductoAgroquimicoData>? productos,
  }) {
    return TratamientoState(
      status: status ?? this.status,
      palmasEnfermas: palmasEnfermas ?? this.palmasEnfermas,
      palmaEnferma: palmaEnferma ?? this.palmaEnferma,
      productos: productos ?? this.productos,
    );
  }

  @override
  List<Object?> get props => [palmaEnferma, productos, status, palmasEnfermas];
}
