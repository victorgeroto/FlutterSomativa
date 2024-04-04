import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Cadastro de produtos'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text ('voltar')
          ),
        )
    );
  }
}
class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  TextEditingController nomeController =TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  String _textInfo = "Informe seus dados";

  void _cadastro() {
    setState(() {
      String nome = nomeController.text;
      String descricao = descricaoController.text;
      if (nome.isEmpty || descricao.isEmpty) {
        _textInfo = "O campos estão vazios";
      } else {
        _textInfo = "Produto foi cadastrado com sucesso";
      }

    });
  }
  void _limpar_tela(){
    nomeController.text = "";
    descricaoController.text = "";
    setState(() {
      _textInfo = "Informe os dados do produto";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produto"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(onPressed: _limpar_tela, icon: Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 120.0,
              color: Colors.amberAccent,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome do produto",
                  labelStyle: TextStyle(color: Colors.amberAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: nomeController,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Descricao do produto",
                  labelStyle: TextStyle(color: Colors.amberAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              obscureText: true,
              controller: descricaoController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _cadastro,
                  child: const Text("Cadastre-se"),
                ),
              ),
            ),
            Text(
              _textInfo,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}