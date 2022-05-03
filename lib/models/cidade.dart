import 'dart:convert';

class Cidade {
  final String id;
  final String nome;
  final int estado;
  Cidade({
    required this.id,
    required this.nome,
    required this.estado,
  });

  

// gera uma cidade baseada em chave e valor
  Map<String, dynamic> toMap() {
    return {
     'id': id,
      'nome': nome,
      'estado': estado,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id']?? 0,
      //id: int.tryParse(map['id']) ?? 0,
      nome: map['nome'] ?? '',
      estado: map['municipio']['microrregiao']['mesorregiao']['UF']['id'] ?? '',
    );
  }
// Pega a instancia e transforma no map e decodificaela para um Json
  String toJson() => json.encode(toMap());

// Decodifica a cidade e o source, e gera um Json decode...
  factory Cidade.fromJson(String source) => Cidade.fromMap(json.decode(source));

  @override
  String toString() => 'Cidade(id: $id, nome: $nome, estado: $estado)';
}
