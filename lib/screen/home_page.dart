import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_charades_guess_words/core/theme/colors.dart';
import 'package:picture_charades_guess_words/core/theme/icons.dart';
import 'package:picture_charades_guess_words/core/theme/strings.dart';
import 'package:picture_charades_guess_words/core/widgets/card_button.dart';
import 'package:picture_charades_guess_words/core/widgets/icon_button.dart';

const coin = "assets/images/coin.png";
const brain = 'assets/images/brain.png';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 150),

            // Birinchi Card
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment(-0.2, 0),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: CardContainer(
                        imgUrl: "assets/images/images_card/level1.0.png",
                      ),
                    ),
                  ),

                  SizedBox(width: 20), // Ikkita card orasiga masofa qo‘shish
                  Align(
                    alignment: Alignment(-0.4, 0),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: CardContainer(
                        imgUrl: "assets/images/images_card/level1.1.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.greyShadow,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.black2,
            ),
            child: AppIconButton(
              colorIcon: AppColors.white,
              colorBackround: AppColors.black,
              icon: AppIcons.back,
              function: () {},
              radius: 2,
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.black2,
            ),
            child: AppIconButton(
              colorIcon: AppColors.white,
              colorBackround: AppColors.black,
              icon: AppIcons.menu,
              function: () {},
              radius: 2,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.appBar,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),

      actions: [
        Text(
          "150",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 15),
        SizedBox(
          width: 25,
          height: 25,
          child: Image.asset(coin, fit: BoxFit.fitWidth),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
