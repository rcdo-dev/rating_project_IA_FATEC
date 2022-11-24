import 'package:flutter/material.dart';

import 'package:rating_project/app/pages/splash_page.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
