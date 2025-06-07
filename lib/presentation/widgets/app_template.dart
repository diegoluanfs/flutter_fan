import 'package:flutter/material.dart';
import 'package:flutter_fan/presentation/widgets/responsive_banner.dart';

class AppTemplate extends StatelessWidget {
  final Widget child;

  const AppTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // MediaQuery para obter informações da tela
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Você pode usar constraints para adaptar o layout
            return Column(
              children: [
                Expanded(child: child),
                ResponsiveBanner(
                  maxWidth: constraints.maxWidth,
                  deviceHeight: mediaQuery.size.height,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
