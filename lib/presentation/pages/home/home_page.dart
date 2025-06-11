import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_fan/presentation/widgets/app_template.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter_fan/app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> fanThumbnails = [
      'assets/imagens/3-fan.svg',
      'assets/imagens/4-fan.svg',
      'assets/imagens/5-fan.svg',
      'assets/imagens/6-fan.svg',
      'assets/imagens/7-fan.svg',
      'assets/imagens/8-fan.svg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DayNightSwitcherIcon(
                isDarkModeEnabled: themeNotifier.value == ThemeMode.dark,
                onStateChanged: (isDarkModeEnabled) {
                  themeNotifier.value =
                      isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
                },
              ),
              const SizedBox(width: 48), // espaço à direita
            ],
          ),
        ],
      ),
      body: AppTemplate(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: fanThumbnails.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(24),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      String nextRoute;
                      switch (index) {
                        case 0:
                          nextRoute = '/fan3';
                          break;
                        case 1:
                          nextRoute = '/fan4';
                          break;
                        case 2:
                          nextRoute = '/fan5';
                          break;
                        case 3:
                          nextRoute = '/fan6';
                          break;
                        case 4:
                          nextRoute = '/fan7';
                          break;
                        case 5:
                          nextRoute = '/fan8';
                          break;
                        default:
                          nextRoute = '/home';
                      }
                      Navigator.of(context).pushNamed(
                        '/splash',
                        arguments: {
                          'fanIndex': index,
                          'fanAsset': fanThumbnails[index],
                          'nextRoute': nextRoute,
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      fanThumbnails[index],
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
