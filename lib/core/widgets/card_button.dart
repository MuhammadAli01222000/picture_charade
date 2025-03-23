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
    return SizedBox(
      width: 151,
      height:151,
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(widget.pictureCharade.left.imageUrl,fit: BoxFit.scaleDown,)),
          SizedBox(width: 5,),

        ],
      ),
    );
  }
}

class SmalContainerWork extends StatelessWidget {
final  Color color;
  const SmalContainerWork({
    super.key, required this.color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,height: 10,child: Card(color: color,),
    );
  }
}