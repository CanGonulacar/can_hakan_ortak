import 'package:drive_deneme/screen/video_player_widget.dart';
import 'package:flutter/material.dart';

part 'main_screen.dart';

extension on MainScreen {
  AppBar buildAppBar() {
    return AppBar(title: const Text('Google Drive Test'), centerTitle: true);
  }
}
