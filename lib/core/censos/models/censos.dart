class Censos {
  String nome;
  int regiao;
  int freq;
  int rank;
  String sexo;

  Censos(
    this.nome,
    this.regiao,
    this.freq,
    this.rank,
    this.sexo,
  );

  @override
  String toString() {
    // TODO: implement toString
    return '{nome: $nome, regiao: $regiao, freq: $freq, rank: $rank, sexo: $sexo}';
  }
}
