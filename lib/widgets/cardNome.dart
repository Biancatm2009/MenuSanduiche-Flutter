import 'package:flutter/material.dart';

class CardJogador extends StatelessWidget {
  final String nome;
  final int pontuacao;
  final int jogosConcluidos;
  final int numeroDeConquistas;
  final String pequenaDescricao;
  const CardJogador({
    super.key,
    required this.nome,
    required this.pontuacao,
    required this.jogosConcluidos,
    required this.numeroDeConquistas,
    required this.pequenaDescricao,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 50,
                  ),
                  Text(
                    nome,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(pequenaDescricao),

                
                ],
              ),
            ),
          ],
        ),
         ]
        )
      ),
       
    ),
   SizedBox(height: 20),
   
       Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(child: _buildInfo("Pontuação", pontuacao.toString(), Icons.star, Colors.orange)),
          const SizedBox(width: 12),
          Expanded(child: _buildInfo("Jogos", jogosConcluidos.toString(), Icons.sports_esports, Colors.blue)),
          const SizedBox(width: 12),
          Expanded(child: _buildInfo("Conquistas", numeroDeConquistas.toString(), Icons.emoji_events, Colors.green)),
        ],
      ),
    )
    ],
    );
  }

  Widget _buildInfo(String titulo, String valor, IconData icone, Color cor) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, color: cor, size: 28),
            const SizedBox(height: 8),
            Text(
              titulo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              valor,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
    
    
    
         }
          }