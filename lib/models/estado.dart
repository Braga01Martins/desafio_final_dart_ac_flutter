import 'dart:convert';

class Estado {
  final int id;
  final String uf;
  final String nome;

  Estado({
    required this.id,
    required this.uf,
    required this.nome
  });

// Transforma em Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': uf,
      'nome': nome,
    };
  }
// Generate Json
  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(
      id: map['id']?.toInt() ?? 0,
      uf: map['sigla'] ?? '',
      nome: map['nome'] ?? '',
    );
  }
// Transforma Json
  String toJson() => json.encode(toMap());

  factory Estado.fromJson(String source) => Estado.fromMap(json.decode(source));

  @override
  String toString() => 'Estado(id: $id, sigla: $uf, nome: $nome)';
}
