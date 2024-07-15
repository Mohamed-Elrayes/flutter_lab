import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab/core/data/app_data.dart';

class MainAnimationScreen extends StatelessWidget {
  const MainAnimationScreen({super.key});

  static const String routeName = 'DialogsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animation Screen Example",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: AppData.animationsList.length,
        itemBuilder: (c, i) => InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppData.animationsList[i].pageRoute),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Text(AppData.animationsList[i].title,
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
      ),
    );
  }
}
