import 'package:flutter/material.dart';
import 'package:flutter_somativa/CadastroUser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tela contador'),
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
class Cont extends StatefulWidget {
  const Cont({super.key, required this.title});



  final String title;

  @override
  State<Cont> createState() => _ContPageState();
}

class _ContPageState extends State<Cont> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {

      _counter--;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),

                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove),
                )
              ],
            ),
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */
    );
  }
}