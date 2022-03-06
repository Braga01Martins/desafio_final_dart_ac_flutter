import 'package:dart_desafio_final/database/data_base.dart';
import 'package:dart_desafio_final/repository/city_repository.dart';
import 'package:dart_desafio_final/repository/state_repository.dart';

class SearchDesafio {
  //------------------Inserir os Estados no BD---------------------------------
  Future<void> insertBDState() async {
    final dataBase = Database();
    var mySql = await dataBase.openConn();

    try {
      var res = await StateRepository().buscarEstado();
      for (var viewSate in res) {
        await mySql.query(
          'insert into estado(uf, nome) values(?,?)',
          [viewSate.uf, viewSate.nome],
        );

        print('Estados inseridos com sucesso');
      }
    } on Exception catch (e) {
      print('Erro ao inserir os estados, Erro: $e');
    }
  } //-------------- fim insercao dos Estados no BD --------------------------

//------------------Inserir as cidades no BD---------------------------------
  Future<void> insertBDCity() async {
    final dataBase = Database();
    var mySql2 = await dataBase.openConn();

    try {
      var response = await CityRepository().buscarCity(35);
      for (var viewCity in response) {
        await mySql2.query(
          'insert into cidade(id_uf, nome) values(?,?)',
            [viewCity.idUf, viewCity.nome]
          );

        print('Cidade inserida no banco de dados com sucesso');
        
      }
    } on Exception catch (e) {
      print('Erro ao buscar cidade, Erro: $e');
      
    }
    
  }
//-------------- fim insercao das cidades no BD --------------------------
}
