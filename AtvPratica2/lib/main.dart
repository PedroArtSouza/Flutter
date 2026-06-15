import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:device_preview/device_preview.dart";

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Pedro Artur de Souza Araujo"),
          ),
        ),
        body: const SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Chamando o widget que agora é um StatefulWidget
              Cartao(),
            ],
          ),
        ),
      ),
    );
  }
}

// Transformamos o Cartao em um StatefulWidget para ele poder mudar na tela
class Cartao extends StatefulWidget {
  const Cartao({super.key});

  @override
  State<Cartao> createState() => _CartaoState();
}

class _CartaoState extends State<Cartao> {
  // Variável para guardar a mensagem mutável (estado inicial)
  String mensagem = 'Clique no botão para saber mais!';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Text(
            "Witch Hat Atelier",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(
            "https://m.media-amazon.com/images/M/MV5BZjQ2NGVmNzEtODg3Mi00MmViLTkzNGYtNWExNGEzNmNkOGYwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
            height: 350,
          ),
          const SizedBox(height: 16), // Espaçamento visual
          
          // O texto agora exibe o valor da nossa variável
          Text(
            mensagem, 
            style: const TextStyle(
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          // Botão que fará a alteração da mensagem
          ElevatedButton(
            onPressed: () {
              // O setState avisa o Flutter que a variável mudou e a tela precisa ser redesenhada
              setState(() {
                mensagem = 'Esse anime mostra que a magia exige estudo, precisão e muita arte!';
              });
            },
            child: const Text('Ver detalhes'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}