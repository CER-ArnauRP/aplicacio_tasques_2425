import 'package:aplicacio_tasques_2425/pagines/pagina_principal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async { // flutter run -d chrome --web-port 63110

  await Hive.initFlutter();
  await Hive.openBox("box_tasques_app");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaPrincipal(),
    );
  }
}
