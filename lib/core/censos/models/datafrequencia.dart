class DataFrequencia {
  String periodo;
  int frequencia;

  DataFrequencia(
    this.periodo,
    this.frequencia,
  );

  @override
  String toString() {
    // TODO: implement toString
    return '{periodo: $periodo, frequencia $frequencia}';
  }

}
