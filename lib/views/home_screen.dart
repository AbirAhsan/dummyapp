import 'package:dummyapp/model/lucky_place_model.dart';
import 'package:dummyapp/services/page_navigation.dart';
import 'package:dummyapp/views/chat_screen.dart';
import 'package:dummyapp/views/lucky_place_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Chat Screen"),
              onTap: () => navigateToNextScreen(context, const ChatScreen()),
            ),
            ListTile(
              title: const Text("Lucky Place Screen"),
              onTap: () =>
                  navigateToNextScreen(context, const LuckyPlaceList()),
            )
          ],
        ),
      ),
    );
  }
}
