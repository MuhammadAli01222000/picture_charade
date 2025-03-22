import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:picture_charades_guess_words/core/theme/colors.dart';
import 'package:picture_charades_guess_words/core/theme/icons.dart';
import 'package:picture_charades_guess_words/core/theme/strings.dart';
import 'package:picture_charades_guess_words/core/widgets/card_button.dart';
import 'package:picture_charades_guess_words/core/widgets/icon_button.dart';
import 'package:picture_charades_guess_words/services/data_controler.dart';

import '../core/widgets/drag_target.dart';
import '../core/widgets/text_widget.dart';
import '../model/model.dart';

const coin = "assets/images/coin.png";
const brain = 'assets/images/brain.png';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool correct = false;
  int level = 0;
  int coinCount = 1000;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void music() {
    _playSoundWrong(_audioPlayer);
  }

  Future<void> _playSoundWrong(AudioPlayer _audioPlayer) async {
    try {
      await _audioPlayer.setAsset("assets/sound/win.wav");
      await _audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer.play();
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    correct ? coinCount += 100 : coinCount;
    final DataController dataController = DataController();

    return Scaffold(
      appBar: _buildAppBar(level: level, coins: coinCount),
      backgroundColor: AppColors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backround),
            fit: BoxFit.fill,
          ),
        ),
        child: FutureBuilder<void>(
          future: dataController.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                _light_button(), //  Joyida turishi kerak bo'lgan button
                SizedBox(height: 30),


                SizedBox(
                  height:150,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(

                              child: CardContainer(
                                imgUrl: dataController.list[index].left.imageUrl,
                                pictureCharade: dataController.list[index],
                              ),
                              height: 100,
                            ),
                            SizedBox(width: 10),

                          ],
                        );
                      },
                    ),
                ),


                /// 🔹 Quyidagi widgetlar joyida turadi
                SizedBox(height: 20),
                WordsLength(pictureCharade: dataController.list.first),
                DragTargetBox(pictureCharade: dataController.list.first),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent() {
    final dataController = DataController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 250,
          height: 250,
          child: CardContainer(
            imgUrl: dataController.list.first.left.imageUrl,
            pictureCharade: dataController.list.first,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 250,
          height: 250,
          child: CardContainer(
            imgUrl: dataController.list.first.right.imageUrl,
            pictureCharade: dataController.list.first,
          ),
        ),
      ],
    );
  }

  ///o'ng tarafdagi yashil button
  Align _light_button() {
    return Align(
      alignment: Alignment(0.8, -0.9),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          children: [
            Card(
              color: Colors.green,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      coinCount -= 100;
                    });
                  },
                  icon: Icon(Icons.lightbulb, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar({required int coins, required int level}) {
    return AppBar(
      backgroundColor: Colors.white70,
      elevation: 0,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: TextWidgetLevel(level: level,),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 45,
                    child: Card(
                      color: AppColors.grey,

                      child: Row(
                        children: [
                          SizedBox(width: 9),

                          SizedBox(
                            height: 35,
                            child: Image.asset(coin, fit: BoxFit.contain),
                          ),
                          SizedBox(width: 15),
                          TextWidgetCoin(coins: coins,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      actions: [
        SizedBox(width: 15),

        AppIconButton(
          colorIcon: AppColors.black,
          colorBackround: AppColors.black,
          icon: AppIcons.menu,
          function: () {},
          radius: 2,
        ),
      ],
    );
  }
}
//Container drop
class WordsLength extends StatelessWidget {
  final PictureCharade pictureCharade;
  const WordsLength({super.key, required this.pictureCharade});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      width: 550,
      height: 175,
      child: Card(
        color: Colors.blue.shade900,
           child:Column(
             children: [
               ColoredBox(
                 color: Colors.blue.shade500,
                 child: SizedBox(
                   width: 530,height: 50,
                 ),
               ),
               Divider(height: 5,color:Colors.blueGrey.shade900,),
               SizedBox(height: 4,),
               ColoredBox(
                 color: Colors.blue.shade500,
                 child: SizedBox(
                   width: 530,height: 100,

                 ),
               )
             ],
           ),
      ),
    );
  }
}
