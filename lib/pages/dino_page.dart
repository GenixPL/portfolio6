import 'package:dino_game/dino_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    const TextEditingValue(text: '1.0'),
  );

  @override
  void dispose() {
    _jumpForceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Gap(64),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 640,
                  maxHeight: 240,
                ),
                child: DinoGame(
                  jumpForceMultiplier: double.tryParse(
                    _jumpForceController.text,
                  ),
                  scoreTextStyle: TextStyle(
                    color: context.theme.primary,
                    fontSize: 16,
                    fontFamily: FontFamily.cpMono.assetName,
                  ),
                ),
              ),
              const Gap(16),
              MenuButton(
                onTap: () {
                  context.pop();
                },
                name: 'Go back',
                routeName: '',
              ),
              const Gap(32),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 160),
                child: TextField(
                  controller: _jumpForceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: "Jump Force Multiplier",
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}
