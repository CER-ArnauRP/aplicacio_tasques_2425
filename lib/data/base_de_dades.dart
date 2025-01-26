
import 'package:hive/hive.dart';

class BaseDeDades {

  List tasquesLlista = [];

  final Box _boxDeLaHive = Hive.box("box_tasques_app");

  void crearDadesExemple() {
    tasquesLlista = [
      {"titol": "Tasca 1", "valor": false},
      {"titol": "Tasca 2", "valor": true},
      {"titol": "Tasca 3", "valor": true},
    ];
  }

  void carregarDades() {
    tasquesLlista = _boxDeLaHive.get("box_tasques_app");
  }

  void actualitzarDades() {
    _boxDeLaHive.put("box_tasques_app", tasquesLlista);
  }
}