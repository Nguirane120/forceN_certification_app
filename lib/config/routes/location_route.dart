import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteLocation {
  const RouteLocation._();

  static String get home => '/';
  static String get createTask => '/createTask';
  static String get profile => '/profile';
  static String get login => '/login';
}
