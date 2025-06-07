import 'package:flutter/material.dart';
import 'package:flutter_fan/presentation/widgets/app_template.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      child: Center(
        child: Image.asset(
          'assets/imagens/sample_image.png',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
