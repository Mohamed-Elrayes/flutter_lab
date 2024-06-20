import 'package:flutter/material.dart';
import 'package:flutter_lab/core/data/experiment.dart';

class ExperimentListItem extends StatelessWidget {
  final Experiment experiment;

  const ExperimentListItem(this.experiment, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: experiment.tutorialPageRoute == null
          ? null
          : () => Navigator.of(context).pushNamed(experiment.tutorialPageRoute!),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black.withOpacity(0.2)),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(experiment.title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  Text(experiment.description),
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
