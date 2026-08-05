import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:menusanduiche/pages/paginaPerfil.dart';
import 'package:menusanduiche/pages/paginaFavoritos.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Explorer',

      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      home: const TelaInicio(),
    );
  }
}

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Explorer'),
        centerTitle: true,
      ),


     drawer: Drawer(
               child: ListView(
                padding: EdgeInsets.zero,

                        children: [
                        DrawerHeader(
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Container(
                            alignment: Alignment.center,
                            height: 120, // altura personalizada
                            child: Text(
                              "Menu Sanduíche",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.home),
                          title: Text("Home"),
                          onTap: () {
                            Navigator.pop(context); // fecha o Drawer
                          },
                        ),
                        ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Perfil"),
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return Perfil( );
                        }
                    
                        ),
                        );
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text("Favoritos"),
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return JogosFavoritosPage();
                        }
                    
                        ),
                        );
                      },
                    )
                      ],
               ),
               
       ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.sports_esports,
                size: 100,
              ),

              SizedBox(height: 16),

              Text(
                'Bem-vindo ao Game Explorer!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Explore jogos, descubra novas aventuras '
                'e organize seus conteúdos favoritos.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 30),

              CardJogo(
                icone: Icons.explore,
                titulo: 'Explorar',
                descricao:
                    'Descubra novos jogos, mundos e personagens.',
              ),

              SizedBox(height: 12),

              CardJogo(
                icone: Icons.favorite,
                titulo: 'Favoritos',
                descricao:
                    'Organize os jogos que você mais gosta.',
              ),

              SizedBox(height: 12),

              CardJogo(
                icone: Icons.emoji_events,
                titulo: 'Conquistas',
                descricao:
                    'Acompanhe seus desafios e recompensas.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardJogo extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;

  const CardJogo({
    super.key,
    required this.icone,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(
              icone,
              size: 50,
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(descricao),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
