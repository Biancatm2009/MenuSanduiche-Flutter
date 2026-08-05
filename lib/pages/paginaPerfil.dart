import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:menusanduiche/widgets/cardNome.dart';


class Perfil extends StatefulWidget{
  

  @override
  State<StatefulWidget> createState() {
   return _Perfil();
  }
}

class _Perfil extends State<Perfil>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Center(
        child: Column(
        
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/perfil.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
             
            ),
            SizedBox(height: 40),
             
                CardJogador(
                  
                  nome: "João Silva",
                  pontuacao: 100,
                  jogosConcluidos: 10,
                  numeroDeConquistas: 5,
                  pequenaDescricao: "Gamer apaixonado por aventuras e desafios",
                ),
          ],
        ),
      ),
    );
  }
}