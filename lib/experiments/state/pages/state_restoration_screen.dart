import 'dart:developer';

import 'package:flutter/material.dart';

/// [STATE RESTORATION]
/// At the end of a Frame (rendering), ALL data related to the State Restoration that have been the subject of a modification, are serialized and sent to the Engine (flutter/restoration) which puts them in cache until the OS asks for them in fact these are the Buckets,
///
/// Where Data Store ? -> in [RestorationBucket]
///
///
/// Note: The size of data that can be saved is limited to a few K-bytes and Serialization and sending to the Engine are synchronous operations.
///
/// How Active State Restoration ?
/// 1- add restorationScopeId to MaterialApp
///  Or You can wrap your App with [RootRestorationScope]
///   ex : ```
/// void main(){
///     runApp(
///         const RootRestorationScope(
///             restorationId: 'root',
///             child: Application(),
///         ),
///     );
/// }
/// ```
/// What are the "main components"?
/// 1- RestorationManager (the "coordinator")
///   It is unique in any Flutter application.
///   It is started as soon as the Bindings are initialized (see Flutter Internals). It handles all communications with the Engine with regard to State Restoration. It is also responsible for the management of the "data" to be sent to the Engine at the end of the next Frame Rendering.
///
/// 2- RestorationScope (the "isolation") have types
///   - RootRestorationScope:
///       this step creation of the [RestorationBucket]
///   - RestorationScope:
///       Widget whose sole purpose is to define a new isolated "area" (or Scope) of restoration and allow retrieval of the main RestorationBucket related to this "area".
///
/// 3- The RestorationBucket (the "memory")
///   The RestorationBucket is a storage for information exchanged between your application and the OS as part of State Restoration. It includes:
///   - A unique name for each RestorationScope.
///   - Stores information in the form of a Map containing key-value pairs.
///   - Knows its position in the tree structure with parent-children relationships.
///   Typically, you don't manipulate the RestorationBucket directly but delegate this to the RestorationMixin.
///
/// 4- The RestorableProperty (the "data") is ChangeNotifier
///
///
/// Note: If you have a RootRestorationScope upstream, you MUST mention a restorationScopeId at the level of your MateriaApp/CupelationApp, because, as mentioned earlier, an absence of an identity disables the State Restoration for the entire subtree!!!
/// Resource:
/// https://www.flutteris.com/blog/en/state_restoration
///
class StateRestorationScreen extends StatefulWidget {
  const StateRestorationScreen({super.key});

  @override
  State<StateRestorationScreen> createState() => _StateRestorationScreenState();
}

class _StateRestorationScreenState extends State<StateRestorationScreen> with RestorationMixin {
  final scrollOffset = RestorableDouble(0);
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() => scrollOffset.value = scrollController.offset);

    WidgetsBinding.instance
        .addPostFrameCallback((_) => scrollController.jumpTo(scrollOffset.value));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: 'home_page',
      appBar: AppBar(
        title: Text(
          'State Restoration Types Examples',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        controller: scrollController,
        itemBuilder: (c, i) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: Text(
            '# $i State Restoration',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }

  @override
  String? get restorationId => 'home_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(scrollOffset, 'title');
    log(scrollOffset.value.toString());
  }
}
