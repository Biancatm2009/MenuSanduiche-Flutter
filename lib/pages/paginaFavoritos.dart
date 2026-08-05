import 'package:flutter/material.dart';

class JogoFavorito {
  final IconData icone;
  final String nomeJogo;
  final String detalhes;

  const JogoFavorito({
    required this.icone,
    required this.nomeJogo,
    required this.detalhes,
  });
}

class JogosFavoritosPage extends StatelessWidget {
  const JogosFavoritosPage({super.key});

  final List<JogoFavorito> jogosFavoritos = const [
    JogoFavorito(
      icone: Icons.sports_esports,
      nomeJogo: "FIFA 24",
      detalhes: "Jogo de futebol realista",
    ),
    JogoFavorito(
      icone: Icons.sports_motorsports,
      nomeJogo: "Need for Speed",
      detalhes: "Corridas emocionantes",
    ),
    JogoFavorito(
      icone: Icons.sports_basketball,
      nomeJogo: "NBA 2K",
      detalhes: "Basquete profissional",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jogos Favoritos")),
      body: ListView.builder(
        itemCount: jogosFavoritos.length,
        itemBuilder: (context, index) {
          final jogo = jogosFavoritos[index];
          return CardJogo(
            jogo: jogo,
            indicarFavorito: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Favoritou ${jogo.nomeJogo}!")),
              );
            },
          );
        },
      ),
    );
  }
}

class CardJogo extends StatelessWidget {
  final JogoFavorito jogo;
  final VoidCallback indicarFavorito;

  const CardJogo({
    super.key,
    required this.jogo,
    required this.indicarFavorito,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(jogo.icone, size: 50, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jogo.nomeJogo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(jogo.detalhes),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: indicarFavorito,
            ),
          ],
        ),
      ),
    );
  }
}
