import 'package:flutter/material.dart';

class LoginModel  extends ChangeNotifier{
  bool _isLoading = false;

  bool get getLoadingData => _isLoading;

  set setLoadingData (bool data){
    _isLoading = data;
    notifyListeners();
  }
}