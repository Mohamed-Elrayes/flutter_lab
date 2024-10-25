import 'package:flutter/material.dart';

class MultiplePageFormScreen extends StatelessWidget {
  const MultiplePageFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 1')),
      body: Navigator(
        initialRoute: 'step1',
        onGenerateRoute: (setting) {
          return switch (setting.name) {
            'step1' => MaterialPageRoute(builder: (context) => const Step1()),
            'step2' => MaterialPageRoute(builder: (context) => const Step2()),
            'step3' => MaterialPageRoute(builder: (context) => const Step3()),
            _ => throw Exception('Unknown route: ${setting.name}'),
          };
        },
      ),
    );
  }
}

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'First Page Name'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed('step2'),
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

class Step2 extends StatelessWidget {
  const Step2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Second Page Name'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed('step3'),
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Third Page Name'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
