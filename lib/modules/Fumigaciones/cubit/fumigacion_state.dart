part of 'fumigacion_cubit.dart';

class FumigacionState extends Equatable {
  final List<ProductoAgroquimicoData>? productos;
  final CensoData? censo;
  final FormStatus status;
  final bool productosLoaded;
  const FumigacionState(
      {this.status = FormStatus.noSubmitted,
      this.productosLoaded = false,
      this.productos,
      this.censo});

  @override
  List<Object?> get props => [censo, productos, status, productosLoaded];

  FumigacionState copyWith(
      {List<ProductoAgroquimicoData>? productos,
      CensoData? censo,
      FormStatus? status,
      bool? productosLoaded}) {
    return FumigacionState(
      productos: productos ?? this.productos,
      censo: censo ?? this.censo,
      status: status ?? this.status,
      productosLoaded: productosLoaded ?? this.productosLoaded,
    );
  }
}
