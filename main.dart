import 'package:flutter/material.dart';
import 'home.dart';
import 'imc.dart';
import 'Cont.dart';
import 'CadastroUser.dart';
import 'CadastroProduto.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home() ,
    );
  }
}