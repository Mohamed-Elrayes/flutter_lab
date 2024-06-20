import 'package:flutter/foundation.dart';

@immutable
class ScrollPhysicsData {
  const ScrollPhysicsData({
    required this.title,
    required this.pageRoute,
  });

  final String title;
  final String pageRoute;
}
