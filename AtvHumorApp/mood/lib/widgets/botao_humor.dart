import 'package:flutter/material.dart';

class BotaoHumor extends StatelessWidget {
  final String texto;
  final Color corFundo;
  final VoidCallback onPressed;

  const BotaoHumor({
    super.key,
    required this.texto,
    required this.corFundo,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: corFundo,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        elevation: 3,
      ),
      child: Text(
        texto,
        style:  const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
