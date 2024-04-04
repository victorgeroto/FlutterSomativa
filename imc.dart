import 'dart:math';
import 'package:flutter/material.dart';
import 'Cont.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tela imc'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: ElevatedButton(
              child: const Text('Leva pra tela de contador'),
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    '/contador'
                );
              }
          ),
        )
    );
  }
}

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcPageState();
}

class _ImcPageState extends State<Imc> {
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();
  String _textoInfo = "Informe seus dados";

  void _limpar_tela(){
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _textoInfo= "Informe seus dados";
    });

  }
  void _calcular_Imc(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);

      double imc = peso/pow((altura/100),2);

      if(imc<16.5){
        _textoInfo = "Desnutrido (${imc})";
      }
      else if(imc<=18.5){
        _textoInfo = "Abaixo do peso (${imc})";
      }
      else if(imc<=24.9){
        _textoInfo = "Peso ideal (${imc})";
      }
      else if(imc<=29.9){
        _textoInfo = "Sobre peso (${imc})";
      }
      else if(imc<=34.9){
        _textoInfo = "Obesidade grau 1(${imc})";
      }
      else if(imc<=39.9){
        _textoInfo = "Obesidade grau 2(${imc})";
      }
      else{
        _textoInfo = "Obesidade grau 3(${imc})";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              onPressed: _limpar_tela,
              icon: Icon(Icons.refresh)
          )
        ],
      ),
      body: SingleChildScrollView (
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.indigoAccent,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "PESO(Kg)",
                    labelStyle: TextStyle(color: Colors.amberAccent)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: pesoController,
              ),
              //Segundo input para a altura
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "ALTURA(CM)",
                    labelStyle: TextStyle(color: Colors.amberAccent)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: alturaController,
              ),
              //Botão para executar o calculo do imc
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  height:50.0,
                  child: ElevatedButton(
                      onPressed:_calcular_Imc,
                      child: const Text("Calcular")
                  ),
                ),
              ),
              Text(
                _textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25.0
                ),
              ),
            ]
        ),
      ),
    );
  }
}