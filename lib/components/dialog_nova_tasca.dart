import 'package:aplicacio_tasques_2425/components/boto_dialog.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  final TextEditingController tecTextTasca;
  final Function()? accioGuardar;
  final Function()? accioCancelar;

  const DialogNovaTasca({
    super.key,
    required this.tecTextTasca,
    required this.accioGuardar,
    required this.accioCancelar,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: tecTextTasca,
              cursorColor: Colors.orange[300],
              decoration: InputDecoration(
                hintText: "Escriu la tasca...",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal[100],
              ),
            ),
            //SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BotoDialog(
                  textBoto: "Guardar",
                  accioBoto: accioGuardar,
                ), // Botó guardar.
                BotoDialog(
                  textBoto: "Cancelar",
                  accioBoto: accioCancelar,
                ), // Botó cancelar.
              ],
            )
          ],
        ),
      ),
    );
  }
}
