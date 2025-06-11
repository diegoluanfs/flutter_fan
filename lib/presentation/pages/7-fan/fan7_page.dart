import 'package:flutter/material.dart';
import 'package:flutter_fan/presentation/widgets/app_template.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter_fan/app.dart';

class Fan7Page extends StatefulWidget {
  const Fan7Page({super.key});

  @override
  State<Fan7Page> createState() => _Fan7PageState();
}

class _Fan7PageState extends State<Fan7Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AudioPlayer _audioPlayer;
  bool _isSpinning = false;
  double _speed = 1.0; // 1 segundo por volta

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: (1000 ~/ _speed)),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed && _isSpinning) {
        _controller.repeat();
      }
    });

    _audioPlayer = AudioPlayer();
    _setupAudio();
    _isSpinning = true; // Começa girando e tocando
  }

  Future<void> _setupAudio() async {
    await _audioPlayer.setAsset('assets/sounds/2-fan.mp3');
    await _audioPlayer.setLoopMode(LoopMode.one);
    await _audioPlayer.setSpeed(_speed);
    _controller.repeat();
    await _audioPlayer.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _toggleSpin() async {
    setState(() {
      _isSpinning = !_isSpinning;
      if (_isSpinning) {
        _controller.repeat();
        _audioPlayer.setSpeed(_speed);
        _audioPlayer.play();
      } else {
        _controller.stop();
        _audioPlayer.pause();
      }
    });
  }

  void _onSpeedChanged(double value) {
    setState(() {
      _speed = value;
      _controller.duration = Duration(milliseconds: (1000 ~/ _speed));
      if (_isSpinning) {
        _controller.repeat();
        _audioPlayer.setSpeed(_speed);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fan 7'),
        actions: [
          DayNightSwitcherIcon(
            isDarkModeEnabled: themeNotifier.value == ThemeMode.dark,
            onStateChanged: (isDarkModeEnabled) {
              themeNotifier.value =
                  isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
            },
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: AppTemplate(
        child: GestureDetector(
          onTap: _toggleSpin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 32),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: _controller,
                      child: SvgPicture.asset(
                        'assets/imagens/7-fan.svg',
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'Velocidade: ${_speed.toStringAsFixed(1)}x',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Slider(
                    value: _speed,
                    min: 1.0,
                    max: 3.0,
                    divisions: 14,
                    label: '${_speed.toStringAsFixed(1)}x',
                    onChanged: (value) => _onSpeedChanged(value),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
