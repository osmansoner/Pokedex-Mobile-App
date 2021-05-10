import 'package:flutter/material.dart';

import 'models/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;
  PokemonDetail({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.deepOrange.shade400,
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height * (3 / 4),
            width: MediaQuery.of(context).size.width * (9 / 10),
            top: MediaQuery.of(context).size.height * (0.1),
            left: MediaQuery.of(context).size.width * (0.05),
            child: Card(
              color: Colors.amber.shade200,
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text("Height: " + pokemon.height),
                  Text("Weight: " + pokemon.weight),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map(
                          (pokeType) => Chip(
                            backgroundColor: Colors.orange.shade300,
                            label: Text(
                              pokeType,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map(
                              (evolution) => Chip(
                                backgroundColor: Colors.orange.shade300,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList()
                        : [
                            Chip(
                              backgroundColor: Colors.red,
                              label: Text(
                                "First version!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                  ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map(
                              (evolution) => Chip(
                                backgroundColor: Colors.orange.shade300,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList()
                        : [
                            Chip(
                              backgroundColor: Colors.red,
                              label: Text(
                                "Latest version!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map(
                              (weakness) => Chip(
                                backgroundColor: Colors.orange.shade300,
                                label: Text(
                                  weakness,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList()
                        : [
                            Chip(
                              backgroundColor: Colors.red,
                              label: Text(
                                "Has no weakness!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img.replaceAll('http', 'https'),
              child: Container(
                height: 200,
                width: 200,
                child: Image.network(
                  pokemon.img.replaceAll('http', 'https'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
