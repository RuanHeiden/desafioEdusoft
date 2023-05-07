String removeColchetes({required String valor}) {
  String valorfinal = valor.replaceAll('[', '').replaceAll(']', '');
  return valorfinal;
}