import 'package:flutter/material.dart';

import '../../model/model.dart';
const backround='assets/images/images_card/backround.png';

class CardContainer extends StatefulWidget {
  final PictureCharade pictureCharade;
  final String imgUrl;
  const CardContainer({super.key, required this.imgUrl, required this.pictureCharade});

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 251,
      height: 251,
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: 250,
              height: 250,
              child: Image.asset(widget.pictureCharade.left.imageUrl,fit: BoxFit.scaleDown,)),
          SizedBox(width: 5,),
          SizedBox(
              width: 250,
              height: 250,
              child: Image.asset(widget.pictureCharade.right.imageUrl,fit: BoxFit.contain,))

        ],
      ),
    );
  }
}

class SmalContainerWork extends StatelessWidget {
  final ImageCard imageCard;
  final Color colorBackround;

  const SmalContainerWork({
    super.key,
    required this.colorBackround,
    required this.imageCard,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}