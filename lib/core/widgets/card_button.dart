import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatefulWidget {
  final String imgUrl;
  const CardContainer({super.key, required this.imgUrl});

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.blueGrey, offset: Offset(-1.5, 5)),
              BoxShadow(color: Colors.blueGrey, offset: Offset(4, -1.5)),
            ],
            color: Colors.white,

            borderRadius: BorderRadius.circular(15),
          ),
        ),

        Positioned(
          bottom: 60,
          left: 23,
          child: Image.asset(
            widget.imgUrl,
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
          bottom: 2,
          child: SizedBox(
            width: 200,
            height: 50,
            child: Card(
              color: Colors.blue[900],
              child: Center(
                child: SizedBox(
                  width: 100,
                  height: 25,
                  child: Card(color: Colors.red),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LetterTilesWidget extends StatelessWidget {
  const LetterTilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> letters = ["E", "A", "O", "T", "P", "R"];
    return Row(
      children:
          letters.map((letter) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                letter,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
    );
  }
}

class BlueButtonWidget extends StatelessWidget {
  const BlueButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          "Click Me",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
