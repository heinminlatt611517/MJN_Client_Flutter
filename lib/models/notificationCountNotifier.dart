import 'package:flutter/foundation.dart';

class NotificationCountNotifier extends ChangeNotifier {
  bool _counter = false;

  bool get count => _counter;

  void notify() {
    _counter = true;
    notifyListeners();
  }

  void unNotify() {
    _counter = false;
    notifyListeners();
  }
}