import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.wb_sunny, color: Colors.amber),
            SizedBox(width: 8.0,),
            Text("Meu Aplicativo"),
          ],
        )
      ),
      body: LayoutBuilder(
        builder: (context, constraints){
          final largura = constraints.maxWidth;
        }
      ),
    );
  }
}