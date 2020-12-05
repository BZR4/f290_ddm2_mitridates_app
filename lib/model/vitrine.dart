class Vitrine {
  String aluno;
  String descricao;
  String linkedin;
  String github;
  String curso;
  String tipoVaga;

  Vitrine.fromJson(Map<String, dynamic> json) {
    aluno = json['aluno'];
    descricao = json['descricao'];
    linkedin = json['linkedin'];
    github = json['github'];
    curso = json['curso'];
    tipoVaga = json['tipo_vaga'];
  }

  @override
  String toString() {
    return 'Vitrine{aluno=$aluno, descricao=$descricao, linkedin=$linkedin, github=$github, curso=$curso, tipoVaga: $tipoVaga}';
  }
}
