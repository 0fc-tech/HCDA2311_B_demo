import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Youtube'),
      ),
      body: Column(
        spacing: 8,
        children: [
          RowChannels(),
          RowFilterChips(),
          Expanded(child: ListViewVideos()),
        ],
      ),
    );
  }
}

class ListViewVideos extends StatelessWidget {
  const ListViewVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Image.network(
                  "https://picsum.photos/id/$index/533/300",
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  leading: Icon(Icons.newspaper),
                  title: Text(
                    "Les entreprises ne veulent plus du télétravail !?",
                  ),
                  subtitle: Text("France Info · il y a 1 jours"),
                  trailing: IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class RowFilterChips extends StatelessWidget {
  const RowFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        spacing: 8,
        children: [
          Chip(label: Text("Tous")),
          Chip(label: Text("Aujourd'hui")),
          Chip(label: Text("Shorts")),
        ],
      ),
    );
  }
}

class RowChannels extends StatelessWidget {
  const RowChannels({super.key});

  @override
  Widget build(BuildContext context) {
    const listChannels = [
      "Mark Rober",
      "HugoDe..",
      "Squeeze",
      "Maxime",
      "MaChaine",
      "LaChaine 2",
      "Café Moulu",
      "Orange",
      "SFR",
      "Frit",
    ];
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8),
        child: ListView.builder(
          itemCount: listChannels.length,
          scrollDirection: Axis.horizontal,
          itemBuilder:
              (context, index) => SizedBox(
                width: 64,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://picsum.photos/id/${100 + index}/128/128",
                      ),
                    ),
                    Expanded(
                      child: Text(
                        listChannels[index],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
