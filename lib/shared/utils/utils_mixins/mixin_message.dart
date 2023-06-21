import 'package:flutter/material.dart';

mixin MessageMixin<T extends ChangeNotifier> on ChangeNotifier {
  String _errorMessage = '';
  String _successMessage = '';

  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setSuccessMessage(String message) {
    _successMessage = message;
    notifyListeners();
  }
}
