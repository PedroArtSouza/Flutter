import 'package:flutter/material.dart';
import '../widgets/card_icone.dart';
import 'pagina_rpg.dart';
import 'pagina_linux.dart';
import 'pagina_marcenaria.dart';
import 'pagina_dart.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Interesses', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        children: [
          CardIcone(
            icone: Icons.casino,
            titulo: 'Ordem Paranormal',
            descricao: 'Campanhas, dados e fichas de RPG de mesa.',
            textoBotao: 'Abrir Fichas',
            cor: Colors.red,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaginaRpg()));
            },
          ),
          CardIcone(
            icone: Icons.terminal,
            titulo: 'Ubuntu & Linux',
            descricao: 'Customizações, Ulauncher e configurações.',
            textoBotao: 'Acessar Terminal',
            cor: Colors.orange,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaginaLinux()));
            },
          ),
          CardIcone(
            icone: Icons.handyman,
            titulo: 'Projetos de Marcenaria',
            descricao: 'Construções manuais e trabalhos em madeira.',
            textoBotao: 'Ver Projetos',
            cor: Colors.brown,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaginaMarcenaria()));
            },
          ),
          CardIcone(
            icone: Icons.code,
            titulo: 'Projetos em Dart',
            descricao: 'Sistemas, modularização e Flutter.',
            textoBotao: 'Ver Código',
            cor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaginaDart()));
            },
          ),
          // Botão do Modal
          CardIcone(
            icone: Icons.info_outline,
            titulo: 'Sobre o App',
            descricao: 'Informações adicionais do sistema.',
            textoBotao: 'Ver Detalhes',
            cor: Colors.grey.shade700,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.verified, size: 50, color: Colors.green),
                        const SizedBox(height: 10),
                        const Text(
                          'Tudo certo! 🚀',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'O modal inferior tá funcionando perfeitamente.',
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context); // Fecha o modal
                          },
                          icon: const Icon(Icons.check),
                          label: const Text('Fechar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}