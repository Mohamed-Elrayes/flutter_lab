import 'package:flutter/foundation.dart';

@immutable
class SubScreenData {
  const SubScreenData({
    required this.title,
    required this.pageRoute,
  });

  final String title;
  final String pageRoute;
}
