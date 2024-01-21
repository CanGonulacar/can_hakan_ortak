part of 'b_main_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: buildAppBar(),
      body: const VideoPlayerWidget(
          uri: 'https://www.youtube.com/watch?v=hEZU77mfad4'),
    );
  }
}
