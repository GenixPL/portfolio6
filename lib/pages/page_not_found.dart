import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/_theme.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(context.theme.defaultPageHorizontalPadding(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You've reached the world's edge, none but devils play past here...".toUpperCase(),
                style: TextStyle(
                  fontFamily: FontFamily.cpMono.assetName,
                  fontSize: 16,
                  color: context.theme.colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/images/404.png',
              ),
              TextButton(
                onPressed: () => context.goNamed('home'),
                child: Text(
                  'TURN BACK',
                  style: TextStyle(
                    fontFamily: FontFamily.cpMono.assetName,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
