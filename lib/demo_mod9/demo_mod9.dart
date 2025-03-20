import 'dart:convert';

import 'package:demo/demo_mod9/response_citation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body: FutureBuilder<List<Citation>>(
          future: getCitationsK(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null)
              return ListViewCitations(snapshot.data!);
            else
              return Text("En cours de chargement...");
          },
        ),
      ),
    );
  }

  Future<List<Citation>> getCitationsK() async {
    //On récupère le résultat de la requête
    final response = await get(
      Uri.parse("https://kaamelott.chaudie.re/api/all"),
    );
    //On transforme le corps de la requete (JSON Citation) en une Map Dart (+ manipulable qu'une string)
    //
    final Map<String, dynamic> mapCitation = jsonDecode(response.body);
    //final List<Map> mapCitation = jsonDecode(response.body);
    //On transforme notre Map JSON citation en une liste de Citations
    return ResponseCitation.fromMap(mapCitation).citation;
  }
}

class ListViewCitations extends StatelessWidget {
  final List<Citation> listCitations;
  const ListViewCitations(this.listCitations, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder:
          (context, index) => ListTile(
            leading: Image.network(
              "https://kaamelott.chaudie.re/api/personnage/${listCitations[index].personnage}/pic",
              errorBuilder: (_, __, ___) => SizedBox(height: 54, width: 54),
            ),
            title: Text(listCitations[index].citation),
            subtitle: Text(listCitations[index].personnage),
          ),
    );
  }
}
