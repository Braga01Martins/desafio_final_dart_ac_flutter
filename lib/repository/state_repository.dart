import 'package:dart_desafio_final/models/estado.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class StateRepository {
  Future<List<Estado>> buscarEstado() async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var resposenseData = convert.jsonDecode(response.body);

      // retorna um Json Array em uma lista...
      if (resposenseData is List) {
        return resposenseData.map((r) {
          return Estado.fromMap(r);
        }).toList();
      } else {
        throw Exception();
      }
    } else {
      throw <Estado>[];
    }
  }
}
