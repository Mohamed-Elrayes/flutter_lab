import 'package:flutter/material.dart';
import 'package:flutter_lab/core/data/app_data.dart';

class ScrollPhysicsScreen extends StatelessWidget {
  const ScrollPhysicsScreen({super.key});

  static const String routeName = 'scroll-physics-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ScrollPhysics Types w/ Examples',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: AppData.scrollPhysicsTypes.length,
        itemBuilder: (c, i) => InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppData.scrollPhysicsTypes[i].pageRoute),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Text(AppData.scrollPhysicsTypes[i].title,
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
      ),
    );
  }
}
