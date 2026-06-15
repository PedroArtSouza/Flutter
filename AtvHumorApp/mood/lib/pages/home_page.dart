import 'package:flutter/material.dart';
import '../widgets/botao_humor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _corAtual = Colors.grey.shade300;
  double _tamanhoAtual = 160.0;
  IconData _iconeAtual = Icons.question_mark;
  String _textoAtual = "Como voce esta?";
  double _bordaAtual = 16.0;

  double _opacidadeMensagem = 0.0;
  String _mensagemExtra = "";

  void _mudarHumor(String humor) {
    setState(() {
      _opacidadeMensagem = 0.0;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        switch (humor) {
          case "Feliz":
            _corAtual = Colors.yellow.shade600;
            _tamanhoAtual = 200.0;
            _iconeAtual = Icons.sentiment_very_satisfied;
            _textoAtual = "To muito feliz!!!!!";
            _bordaAtual = 100.0;
            _mensagemExtra = "Aproveite sua felicidade";
            break;

          case "Calmo":
            _corAtual = Colors.blue.shade300;
            _tamanhoAtual = 180.0;
            _iconeAtual = Icons.cloud;
            _textoAtual = "Garoto(a) tranquilo(a)";
            _bordaAtual = 40.0;
            _mensagemExtra = "Relaxa e agacha('E um meme!!)";
            break;

          case "Triste":
            _corAtual = Colors.blueGrey.shade600;
            _tamanhoAtual = 170.0;
            _iconeAtual = Icons.sentiment_dissatisfied;
            _textoAtual = "Bart deprecivo!";
            _bordaAtual = 8.0;
            _mensagemExtra = "Fique feliz a tristeza nao faz bem!";
            break;
        }
        _opacidadeMensagem = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mood App",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: "Arial"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Escolha seu humor atual',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Toque em um dos botões abaixo para ver a tela refletir o que você está sentindo!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                BotaoHumor(
                  texto: 'Feliz',
                  corFundo: Colors.yellow.shade700,
                  onPressed: () => _mudarHumor('Feliz'),
                ),
                BotaoHumor(
                  texto: 'Calmo',
                  corFundo: Colors.blue,
                  onPressed: () => _mudarHumor('Calmo'),
                ),
                // Botão "Triste"
                BotaoHumor(
                  texto: 'Triste',
                  corFundo: Colors.blueGrey,
                  onPressed: () => _mudarHumor('Triste'),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // Container Animado Principal
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              width: _tamanhoAtual,
              height: _tamanhoAtual,
              decoration: BoxDecoration(
                color: _corAtual,
                borderRadius: BorderRadius.circular(_bordaAtual),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_iconeAtual, size: 60, color: Colors.white),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      _textoAtual,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Mensagem Extra Animada com Opacidade
            AnimatedOpacity(
              opacity: _opacidadeMensagem,
              duration: const Duration(milliseconds: 800),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _mensagemExtra,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
