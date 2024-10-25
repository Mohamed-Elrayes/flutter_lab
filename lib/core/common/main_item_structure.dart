import 'package:flutter/material.dart';

class MainItemStructure extends StatelessWidget {
  const MainItemStructure({
    super.key,
    required this.routeName,
    required this.title,
    this.description,
  });

  final String routeName;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).restorablePushNamed(routeName),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.white.withOpacity(0.2)),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  if (description case final description?) Text(description),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
