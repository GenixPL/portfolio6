import 'package:dino_game/dino_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class DinoPage extends StatefulWidget {
  const DinoPage({super.key});

  @override
  State<DinoPage> createState() => _DinoPageState();
}

class _DinoPageState extends State<DinoPage> {
  final TextEditingController _jumpForceController = TextEditingController.fromValue(
    TextEditingValue(text: '1.0'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(64),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 640,
                maxHeight: 240,
              ),
              child: DinoGame(
                jumpForceMultiplier: double.tryParse(_jumpForceController.text),
                scoreTextStyle: TextStyle(
                  color: context.theme.primary,
                  fontSize: 16,
                  fontFamily: FontFamily.cpMono.assetName,
                ),
              ),
            ),
            Gap(16),
            MenuButton(
              onTap: () {
                context.pop();
              },
              name: 'Go back',
              routeName: '',
            ),
            Gap(32),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 160
              ),
              child: TextField(
                controller: _jumpForceController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  labelText: "Jump Force Multiplier",
                ),
                onChanged: (_) => setState(() {}),
              ),
            ),
            Gap(32),
          ],
        ),
      ),
    );
  }
}
