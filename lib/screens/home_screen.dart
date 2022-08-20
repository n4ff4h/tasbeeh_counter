import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasbeeh_counter/screens/home_body.dart';
import 'package:tasbeeh_counter/shared/constants.dart';
import 'package:tasbeeh_counter/widgets/toggle_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0,
        leading: Image.asset('assets/images/tasbeeh_counter.png'),
        title: const Text(
          'Tasbeeh Counter',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: const HomeBody(),
      bottomNavigationBar: SizedBox(
        width: size.width,
        height: 125,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ToggleButton(icon: Icons.volume_up),
            ToggleButton(icon: Icons.vibration),
            ToggleButton(icon: Icons.add_alert),
            ToggleButton(icon: Icons.dark_mode),
          ],
        ),
      ),
    );
  }
}
