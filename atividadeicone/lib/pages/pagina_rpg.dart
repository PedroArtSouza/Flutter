import 'package:flutter/material.dart';

class PaginaRpg extends StatelessWidget {
  const PaginaRpg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text('Ordem Paranormal'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.casino, size: 100, color: Colors.red),
            const SizedBox(height: 20),
            const Text('Rolando iniciativa... 🎲', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red)),
            const SizedBox(height: 40),
            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}