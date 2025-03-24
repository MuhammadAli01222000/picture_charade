import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:picture_charades_guess_words/core/theme/colors.dart';
import 'package:picture_charades_guess_words/core/theme/icons.dart';
import 'package:picture_charades_guess_words/core/widgets/card_button.dart';
import 'package:picture_charades_guess_words/core/widgets/icon_button.dart';
import 'package:picture_charades_guess_words/services/data_controler.dart';

import '../core/widgets/text_widget.dart';
import '../model/model.dart';
import '../tests.dart';

const coin = "assets/images/coin.png";

///sound
const gameSound = 'assets/sound/game_sound.mp3';

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

  Future<void> _playSoundWrong(AudioPlayer audioPlayer) async {
    try {
      await audioPlayer.setAsset("assets/sound/win.wav");
      await audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }
  }

  void gamePlay() {
    _soundGame(_audioPlayer);
  }

  Future<void> _soundGame(AudioPlayer audioPlayer) async {
    try {
      await audioPlayer.setAsset(gameSound);
      await audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer.play();
    gamePlay();
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
final controller =ScrollController();
    return Scaffold(
      appBar: _buildAppBar(level: level, coins: coinCount),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        child: Container(
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
                  _light_button(),
                  SizedBox(height: 10),
                  soundOf(),
                  SizedBox(height: 10),
        ///img uchun
                  SizedBox(
                    height: 270,
                    width: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: MyImg(
                            leftImg: dataController.list[index].left.imageUrl,
                            rightImg: dataController.list[index].right.imageUrl,
                            countWords: dataController.list[index].right.length,
                            countWordsLeft:
                                dataController.list[index].left.length,
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20),
                  Draggable(
                    feedback: SizedBox(
                      width: 50,
                      height: 50,
                      child: Text(""),
                    ),
                    child: Container(
                      width: 300,height: 145,
                      child: WordsLength(
                        pictureCharade: dataController.list.first,
                        dataController: dataController,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

 ///icon button sound of
  Align soundOf() {
    return Align(
      alignment: Alignment(0.8, 0.8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => pause(),
          icon: Icon(Icons.volume_off, color: Colors.yellowAccent),
        ),
      ),
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

  ///appbar
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
            child: TextWidgetLevel(level: level),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
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
                          TextWidgetCoin(coins: coins),
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

class WordsLength extends StatefulWidget {
  final DataController dataController;
  final PictureCharade pictureCharade;

  const WordsLength({
    super.key,
    required this.dataController,
    required this.pictureCharade,
  });

  @override
  State<WordsLength> createState() => _WordsLengthState();
}

class _WordsLengthState extends State<WordsLength> {
  List<String?> placedLetters = [];
  int coin = 0;

  @override
  void initState() {
    super.initState();
    placedLetters = List.filled(widget.pictureCharade.word.length, null);
  }

  void checkResult() {
    String collectedWord = placedLetters.join("");
    if (collectedWord == widget.pictureCharade.word) {
      setState(() {
        coin += 100;
      });
      debugPrint("To'g'ri ");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade900,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.pictureCharade.word.length, (index) {
            String letter = widget.pictureCharade.word[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DragTarget<String>(
                    onAcceptWithDetails: (receivedLetter) {
                      setState(() {
                        placedLetters[index] = receivedLetter as String;
                      });
                      checkResult();
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Card(
                        color: Colors.white,
                        elevation: 2,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: placedLetters[index] != null
                                ? Text(
                              placedLetters[index]!,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                                : Text(""),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 5),

                  Draggable<String>(
                    data: letter,
                    feedback: Material(
                      elevation: 5,
                      shadowColor: Colors.black45,
                      color: Colors.transparent,
                      child: Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            letter,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    child: Card(
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          letter,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

}
