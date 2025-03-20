import 'package:flutter/material.dart';
import 'package:picture_charades_guess_words/screen/home_page.dart';
class GuesWords extends StatelessWidget {
  const GuesWords({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}
