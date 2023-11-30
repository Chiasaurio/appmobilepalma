String generateIdentifier(
    int numeroLinea, int numeroEnLinea, String nombreLote) {
  return '${numeroLinea.toString()}.${numeroEnLinea.toString()}.$nombreLote';
}

String getLinea({required String identificador}) {
  return identificador.split('.')[0];
}

String getNumeroPalma({required String identificador}) {
  return identificador.split('.')[1];
}

String getNombreLote({required String identificador}) {
  return identificador.split('.')[2];
}
