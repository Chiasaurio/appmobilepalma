String generateIdentifier(
    int numeroLinea, int numeroEnLinea, String nombreLote) {
  return (numeroLinea.toString() + numeroEnLinea.toString() + nombreLote.trim())
      .trim();
}
