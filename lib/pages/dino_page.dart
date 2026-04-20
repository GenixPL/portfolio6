import 'package:dino_game/dino_game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class DinoPage extends StatelessWidget {
  const DinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 640,
                  maxHeight: 240,
                ),
                child: DinoGame(
                  scoreTextStyle: TextStyle(
                    color: context.theme.primary,
                    fontSize: 16,
                    fontFamily: FontFamily.cpMono.assetName,
                  ),
                ),
              ),
              MenuButton(
                onTap: () {
                  context.pop();
                },
                name: 'Go back',
                routeName: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
