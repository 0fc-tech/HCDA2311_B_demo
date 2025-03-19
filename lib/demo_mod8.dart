import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Mon Router', routerConfig: _router);
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, __) => RouteA(),
      routes: [GoRoute(path: '/b', builder: (_, __) => RouteB())],
    ),
  ],
);

class RouteB extends StatelessWidget {
  const RouteB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("RouteB")), body: Text("B"));
  }
}

class RouteA extends StatelessWidget {
  const RouteA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RouteAA")),
      body: OutlinedButton(child: Text("A"), onPressed: () => context.go('/b')),
    );
  }
}
