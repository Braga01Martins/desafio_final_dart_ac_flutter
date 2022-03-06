import 'package:dart_desafio_final/models/cidade.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CityRepository {
  Future<List<Cidade>> buscarCity(int id) async {
    var url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${id.toString()}/distritos';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseData = convert.jsonDecode(response.body);

      //Retorna um Json Array em uma  Lista
      if (responseData is List) {
        return responseData.map((r) {
          return Cidade.fromMap(r);
        }).toList();
      } else {
        throw Exception();
      }
    } else {
      return <Cidade>[];
    }
  }
}
