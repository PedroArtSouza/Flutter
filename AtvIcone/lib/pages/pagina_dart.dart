import 'package:flutter/material.dart';

class PaginaDart extends StatelessWidget {
  const PaginaDart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Projetos em Dart'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.code, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text('Código Limpo ✨', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
            ),
            const SizedBox(height: 80),
            const Text('Desenvolvido por Pedro', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}