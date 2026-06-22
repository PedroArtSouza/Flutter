import 'package:flutter/material.dart';

class PaginaLinux extends StatelessWidget {
  const PaginaLinux({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text('Ubuntu & Linux'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.terminal, size: 100, color: Colors.orange),
            const SizedBox(height: 20),
            const Text('Terminal Aberto 🐧', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.orange)),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Fechar Terminal'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}