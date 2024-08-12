import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterModel extends ChangeNotifier{
  String _dropDownValue = "Male";

  String get getDropDownValue => _dropDownValue;

  set setDropDownValue(String value){
    _dropDownValue=value;
    notifyListeners();
  }

  DateTime? _selectedDate;

  DateTime? get getSelectedDate => _selectedDate;

  set setDate(DateTime? date){
    _selectedDate=date;
    notifyListeners();
  }

  XFile? _pickedImage;
  
  XFile? get getImage => _pickedImage;

  set setImage (XFile? image){
    _pickedImage = image;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading =>_isLoading;

  set setLoadingData (data){
    _isLoading = data;
    notifyListeners();
  }
}