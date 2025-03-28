import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> options = ["pedra", "papel", "tesoura", "lagarto", "spock"];
  String _message = "";
  String _imagepath = "images/indefinido.png";
  String _imagepathuser = "images/indefinido.png";

  int _jogador = 0;
  int _maquina = 0;
  int _empate = 0;

  void _resetarJogo() {
    setState(() {
      _jogador = 0;
      _maquina = 0;
      _empate = 0;
      _message = "";
      _imagepath = "images/indefinido.png";
      _imagepathuser = "images/indefinido.png";
    });
  }

  void _play(String choice) {
    int i = Random().nextInt(options.length);
    String randmChoice = options[i];

    setState(() {
      _imagepath = "images/$randmChoice.png";
      _imagepathuser = "images/$choice.png";
    });

    if (choice == randmChoice) {
      _message = "Empatou!";
      _empate++;
    } else if ((choice == "pedra" &&
            (randmChoice == "tesoura" || randmChoice == "lagarto")) ||
        (choice == "papel" &&
            (randmChoice == "pedra" || randmChoice == "spock")) ||
        (choice == "tesoura" &&
            (randmChoice == "papel" || randmChoice == "lagarto")) ||
        (choice == "lagarto" &&
            (randmChoice == "papel" || randmChoice == "spock")) ||
        (choice == "spock" &&
            (randmChoice == "tesoura" || randmChoice == "pedra"))) {
      _message = "Você Venceu!!";
      _jogador++;
    } else {
      _message = "Você Perdeu!!";
      _maquina++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JoKenPô",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              "Disputa",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Maquina",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(_imagepath, height: 120),
                ],
              ),
              Text(
                "VS",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    "Você",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(_imagepathuser, height: 120),
                ],
              ),
            ],
          ),
          //SizedBox(height: 5),
          Text(
            _message,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 243, 65, 33),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Placar",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Jogador",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("$_jogador", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Empate",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("$_empate", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Máquina",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("$_maquina", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Escolha uma Opção",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _play("pedra"),
                child: Image.asset("images/pedra.png", height: 70),
              ),
              GestureDetector(
                onTap: () => _play("papel"),
                child: Image.asset("images/papel.png", height: 70),
              ),
              GestureDetector(
                onTap: () => _play("tesoura"),
                child: Image.asset("images/tesoura.png", height: 70),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Pedra",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Text(
                "Papel",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Text(
                "Tesoura",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _play("lagarto"),
                child: Image.asset("images/lagarto.png", height: 70),
              ),
              GestureDetector(
                onTap: () => _play("spock"),
                child: Image.asset("images/spock.png", height: 70),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Lagarto",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Text(
                "Spock",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: _resetarJogo,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.red,
              shadowColor: Colors.black,
              side: BorderSide(color: Colors.black, width: 2),
            ),
            child: Text(
              "Reiniciar",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
