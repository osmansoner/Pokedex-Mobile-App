import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail.dart';

import 'models/pokedex.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  Uri url = Uri.parse(
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
  Pokedex pokedex;
  Future<Pokedex> data;
  Future<Pokedex> getPokemons() async {
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return FutureBuilder(
                future: getPokemons(),
                builder: (context, AsyncSnapshot<Pokedex> obtainedPokedex) {
                  if (obtainedPokedex.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (obtainedPokedex.connectionState ==
                      ConnectionState.done) {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: obtainedPokedex.data.pokemon.map((poke) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PokemonDetail(
                                  pokemon: poke,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: poke.img.replaceAll('http', 'https'),
                            child: Card(
                              elevation: 6,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 150,
                                      width: 200,
                                      child: FadeInImage.assetNetwork(
                                          placeholder:
                                              "assets/images/loading.gif",
                                          image: poke.img
                                              .replaceAll('http', 'https')),
                                    ),
                                    Text(
                                      poke.name,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                });
          } else {
            return FutureBuilder(
                future: getPokemons(),
                builder: (context, AsyncSnapshot<Pokedex> obtainedPokedex) {
                  if (obtainedPokedex.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (obtainedPokedex.connectionState ==
                      ConnectionState.done) {
                    return GridView.extent(
                      maxCrossAxisExtent: 300,
                      children: obtainedPokedex.data.pokemon.map((poke) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PokemonDetail(
                                  pokemon: poke,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: poke.img.replaceAll('http', 'https'),
                            child: Card(
                              elevation: 6,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 150,
                                      width: 200,
                                      child: FadeInImage.assetNetwork(
                                          placeholder:
                                              "assets/images/loading.gif",
                                          image: poke.img
                                              .replaceAll('http', 'https')),
                                    ),
                                    Text(
                                      poke.name,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                });
          }
        },
      ),
    );
  }
}
