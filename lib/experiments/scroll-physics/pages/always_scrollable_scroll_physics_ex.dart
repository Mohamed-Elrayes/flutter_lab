import 'package:flutter/material.dart';

class AlwaysScrollableScrollPhysicsEx extends StatelessWidget {
  const AlwaysScrollableScrollPhysicsEx({super.key});

  static const String routeName = 'always-scrollable-scroll-physics-ex';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AlwaysScrollableScrollPhysics Example',
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        physics: const AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                'Adding AlwaysScrollableScrollPhysics to the parent SingleChildScrollView in this page forces scrolling even when the content of the scrollable widget’s content doesn’t exceed the height of the screen',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
              child: Text(
                'Note: It is important that you set shrinkWrap to true in the ListView.builder() widget or else you will get the scary "Vertical viewport was given unbounded height." Error',
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 100,
              itemBuilder: (c, i) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'List Item ${i + 1}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
