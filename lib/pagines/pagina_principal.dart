import 'package:aplicacio_tasques_2425/components/dialog_nova_tasca.dart';
import 'package:aplicacio_tasques_2425/components/item_tasca.dart';
import 'package:aplicacio_tasques_2425/data/base_de_dades.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  /*List tasquesLlista = [
    {"titol": "Tasca 1", "valor": false},
    {"titol": "Tasca 2", "valor": true},
    {"titol": "Tasca 3", "valor": true},
  ];*/

  final Box _boxHive = Hive.box("box_tasques_app");
  BaseDeDades db = BaseDeDades();

  TextEditingController tecTextTasca = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (_boxHive.get("box_tasques_app") == null) {
      // Si està buida, carreguem les dades d'exemple.
      db.crearDadesExemple();
    } else {
      db.carregarDades();
    }

    super.initState();
  }

  void accioGuardar() {
    setState(() {
      db.tasquesLlista.add(
        {
          "titol": tecTextTasca.text,
          "valor": false,
        }
      );
    });
    db.actualitzarDades();
    accioCancelar();
  }

  void accioCancelar() {
    Navigator.of(context).pop();
    tecTextTasca.clear();
  }

  void canviaCheckbox(int posLlista) {
    setState(() {
      db.tasquesLlista[posLlista]["valor"] = !db.tasquesLlista[posLlista]["valor"];
    });
    db.actualitzarDades();
  }

  void accioEsborrarTasca(int posLlista) {
    setState(() {
      db.tasquesLlista.removeAt(posLlista);
    });
    db.actualitzarDades();
  }

  void crearNovaTasca() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogNovaTasca(
            tecTextTasca: tecTextTasca,
            accioGuardar: accioGuardar,
            accioCancelar: accioCancelar,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],

      // AppBar.
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("App Tasques"),
        foregroundColor: Colors.orange[200],
      ),

      // FloatingActionButton.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        shape: const CircleBorder(),
        onPressed: crearNovaTasca,
        child: Icon(
          Icons.add,
          color: Colors.orange[200],
        ),
      ),

      // Body.
      body: ListView.builder(
        itemCount: db.tasquesLlista.length,
        itemBuilder: (context, index) {
          return ItemTasca(
            textTasca: db.tasquesLlista[index]["titol"],
            valorCheckbox: db.tasquesLlista[index]["valor"],
            canviaValorCheckbox: (valor) => canviaCheckbox(index),
            esborrarTasca: (valor) => accioEsborrarTasca(index),
          );
        },
      ),
    );
  }
}
