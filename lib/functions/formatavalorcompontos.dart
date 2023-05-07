String formataNumeroComPontos({required String numero}) {
  String valor = numero.toString();
  int length = valor.length;

  String restoValorComVirgula = '';

  ///Verificando se tem virgula
  if (valor.contains(',')) {
    int localDaVirgula = valor.indexOf(',');
    restoValorComVirgula = valor.substring(localDaVirgula, length);
    valor = valor.substring(0, localDaVirgula);
    length = valor.length;
  }

  /// Se o valor ter menos que 3 caracteris, retorna o valor passado
  if (length <= 3) {
    return valor;
  }

  int ComVirgula = (length - 1) % 3 + 1;

  String resultado = valor.substring(0, ComVirgula);

  for (int i = ComVirgula; i < length; i += 3) {
    resultado += '.' + valor.substring(i, i + 3) ;
  }
  ///Mesclando o valor final com pontos com o valor reservado anteriormente com virgula
  resultado = resultado + restoValorComVirgula;
  return resultado;
}