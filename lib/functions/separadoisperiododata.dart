String separaDoisPeriodoData({required String data}) {
  String restoValorData = '';
  if (data.contains(',')) {
    int length = data.length;
    int localDaVirgula = data.indexOf(',');
    restoValorData = data.substring(localDaVirgula + 1, length);
  } else {
    restoValorData = data;
  }
  return restoValorData;
}
