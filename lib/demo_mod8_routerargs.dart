import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => ListeMemesPage(),
        routes: [
          GoRoute(
            path: 'meme/:memeid',
            builder: (_, state) {
              return Detailpage(state.pathParameters['memeid'].toString());
            },
          ),
        ],
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Material App', routerConfig: router);
  }
}

class ListeMemesPage extends StatelessWidget {
  const ListeMemesPage({super.key});

  static const List<String> memeUrls = [
    "30b1gx.jpg",
    "1g8my4.jpg",
    "1ur9b0.jpg",
    "3lmzyx.jpg",
    "22bdq6.jpg",
    "3oevdk.jpg",
    "261o3j.jpg",
    "23ls.jpg",
    "24y43o.jpg",
    "26jxvz.jpg",
    "2fm6x.jpg",
    "1c1uej.jpg",
    "28j0te.jpg",
    "46e43q.png",
    "9ehk.jpg",
    "1jwhww.jpg",
    "43a45p.png",
    "5c7lwq.png",
    "345v97.jpg",
    "1otk96.jpg",
    "1ihzfe.jpg",
    "54hjww.jpg",
    "1tl71a.jpg",
    "1ii4oc.jpg",
    "2odckz.jpg",
    "2ybua0.png",
    "1b42wl.jpg",
    "1bij.jpg",
    "2za3u1.jpg",
    "3pdf2w.png",
    "2gnnjh.jpg",
    "1o00in.jpg",
    "1bhk.jpg",
    "wxica.jpg",
    "21uy0f.jpg",
    "46hhvr.jpg",
    "gk5el.jpg",
    "98qr33.jpg",
    "26am.jpg",
    "1wz1x.jpg",
    "gtj5t.jpg",
    "m78d.jpg",
    "38el31.jpg",
    "2xscjb.png",
    "1yxkcp.jpg",
    "1e7ql7.jpg",
    "64sz4u.png",
    "2reqtg.png",
    "72epa9.png",
    "58eyvu.png",
    "145qvv.jpg",
    "1op9wy.jpg",
    "1h7in3.jpg",
    "19vcz0.jpg",
    "39t1o.jpg",
    "grr.jpg",
    "4pn1an.png",
    "2kbn1e.jpg",
    "1nck6k.jpg",
    "3nx72a.png",
    "434i5j.png",
    "28s2gu.jpg",
    "2tzo2k.jpg",
    "1bhw.jpg",
    "1yz6z4.jpg",
    "3qqcim.png",
    "8tw3vb.png",
    "4acd7j.png",
    "5v6gwj.jpg",
    "3vfrmx.jpg",
    "1bgw.jpg",
    "265k.jpg",
    "u0pf0.jpg",
    "1w7ygt.jpg",
    "33e92f.jpg",
    "2896ro.jpg",
    "3kwur5.jpg",
    "29v4rt.jpg",
    "2oo7h0.jpg",
    "21tqf4.jpg",
    "8k0sa.jpg",
    "3eqjd8.jpg",
    "65939r.jpg",
    "2cjr7j.jpg",
    "hmt3v.jpg",
    "3po4m7.jpg",
    "5o32tt.png",
    "bwu6w.jpg",
    "3pnmg.jpg",
    "1tkjq9.jpg",
    "9au02y.jpg",
    "392xtu.jpg",
    "1bh8.jpg",
    "2wifvo.jpg",
    "1iruch.jpg",
    "54d9lj.png",
    "176h0h.jpg",
    "1itoun.jpg",
    "2eeunw.jpg",
    "5youx3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle')),
      body: ListView.builder(
        itemCount: memeUrls.length,
        itemBuilder:
            (_, index) => InkWell(
              onTap: () => context.go('/meme/${memeUrls[index]}'),
              child: Image.network(
                "https://i.imgflip.com/${memeUrls[index]}",
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
      ),
    );
  }
}

class Detailpage extends StatelessWidget {
  final String url;
  Detailpage(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle')),
      body: Image.network("https://i.imgflip.com/$url"),
    );
  }
}
