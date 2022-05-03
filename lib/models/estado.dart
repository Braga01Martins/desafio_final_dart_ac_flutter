import 'dart:convert';

class Estado {
  final int id;
  final String nome;
  final String sigla;
  Estado({
    required this.id,
    required this.nome,
    required this.sigla,
  });


// Transforma em Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sigla': sigla,
    };
  }
// Generate Json
  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(
      id: map['id'] ?? 0,
      //id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      sigla: map['sigla'] ?? '',
    );
  }
// Transforma Json
  String toJson() => json.encode(toMap());

  factory Estado.fromJson(String source) => Estado.fromMap(json.decode(source));


  @override
  String toString() => 'Estado(id: $id, nome: $nome, sigla: $sigla)';
}
