import 'package:flutter/material.dart';
import '../pages/home.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();

  String _mensagem = '';
  bool _sucesso = false;
  bool _senhaVisivel = false;
  bool _confirmarSenhaVisivel = false;

  void _cadastrar() {
    final nome = _nomeController.text.trim();
    final email = _emailController.text.trim();
    final senha = _senhaController.text;
    final confirmar = _confirmarSenhaController.text;

    setState(() {
      _sucesso = false;
      if (nome.isEmpty) {
        _mensagem = 'Digite seu nome';
      } else if (email.isEmpty) {
        _mensagem = 'Digite seu email';
      } else if (!email.contains('@')) {
        _mensagem = 'Digite um email válido';
      } else if (senha.isEmpty) {
        _mensagem = 'Digite sua senha';
      } else if (senha.length < 6) {
        _mensagem = 'A senha precisa ter pelo menos 6 caracteres';
      } else if (confirmar != senha) {
        _mensagem = 'As senhas não são iguais';
      } else {
        _mensagem = 'Cadastro realizado com sucesso!';
        _sucesso = true;
      }
    });

    if (_sucesso) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TelaHome()),
          );
        }
      });
    }
  }

  void _voltarLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        title: const Text(
          'Cadastro',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4F6EF7),
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Ícone
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4F6EF7).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_add_outlined,
                      size: 48,
                      color: Color(0xFF4F6EF7),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Título
                  const Text(
                    'Criar Conta',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Campo nome
                  TextField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Seu nome completo',
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Color(0xFF4F6EF7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF4F6EF7),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FF),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campo email
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'exemplo@email.com',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Color(0xFF4F6EF7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF4F6EF7),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FF),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campo senha
                  TextField(
                    controller: _senhaController,
                    obscureText: !_senhaVisivel,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Mínimo 6 caracteres',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xFF4F6EF7),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _senhaVisivel
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () =>
                            setState(() => _senhaVisivel = !_senhaVisivel),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF4F6EF7),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FF),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campo confirmar senha
                  TextField(
                    controller: _confirmarSenhaController,
                    obscureText: !_confirmarSenhaVisivel,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      hintText: 'Repita a senha',
                      prefixIcon: const Icon(
                        Icons.lock_reset_outlined,
                        color: Color(0xFF4F6EF7),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _confirmarSenhaVisivel
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => setState(
                          () =>
                              _confirmarSenhaVisivel = !_confirmarSenhaVisivel,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF4F6EF7),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FF),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Mensagem de erro ou sucesso
                  if (_mensagem.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _sucesso
                            ? Colors.green.shade50
                            : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _sucesso
                              ? Colors.green.shade200
                              : Colors.red.shade200,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _sucesso
                                ? Icons.check_circle_outline
                                : Icons.error_outline,
                            color: _sucesso
                                ? Colors.green.shade600
                                : Colors.red.shade600,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _mensagem,
                              style: TextStyle(
                                color: _sucesso
                                    ? Colors.green.shade700
                                    : Colors.red.shade700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 24),

                  // Botão Cadastrar
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _cadastrar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F6EF7),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Botão Voltar para Login
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: _voltarLogin,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF4F6EF7),
                        side: const BorderSide(
                          color: Color(0xFF4F6EF7),
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Voltar para Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
