
import 'package:flutter/material.dart';
import 'CadastroProduto.dart';


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
              child: const Text('Leva pra tela de cadastro dos usuarios'),
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    '/CadastroUser'
                );
              }
          ),
        )
    );
  }
}
class CadastroUser extends StatefulWidget {
  const CadastroUser({super.key});

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  TextEditingController usuarioController =TextEditingController();
  TextEditingController senhaController = TextEditingController();
  String _textInfo = "Informe seus dados";

  void _cadastro() {
    setState(() {
      String user = usuarioController.text;
      String senha = senhaController.text;
      if (user.isEmpty || senha.isEmpty) {
        _textInfo = "O campos estão vazios";
      } else {
        _textInfo = "Usuario foi cadastrado com sucesso";
      }

    });
  }
  void _limpar_tela(){
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {
      _textInfo = "Informe seus dados";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de usuario"),
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
                  labelText: "Usuario",
                  labelStyle: TextStyle(color: Colors.amberAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuarioController,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.amberAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              obscureText: true,
              controller: senhaController,
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
