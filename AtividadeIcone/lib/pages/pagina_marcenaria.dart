import 'package:flutter/material.dart';

class PaginaMarcenaria extends StatelessWidget {
  const PaginaMarcenaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: const Text('Marcenaria'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.handyman, size: 100, color: Colors.brown),
            const SizedBox(height: 20),
            const Text('Projetos em Madeira 🪚', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.brown)),
            const SizedBox(height: 40),
            FilledButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar à Oficina'),
              style: FilledButton.styleFrom(backgroundColor: Colors.brown),
            )
          ],
        ),
      ),
    );
  }
}