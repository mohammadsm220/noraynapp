import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Suggestions extends ChangeNotifier {
  bool _benefiting;
  bool _employee;
  bool _visitor;
  bool _other;
  bool _suggestion;
  bool _complaint;
  bool _remarking;
  String _name;
  String _jop;
  String _email;
  String _phone;
  String _text;

  Suggestions() {
    _benefiting = true;
    _employee=false;
    _visitor = false;
    _other=false;
    _suggestion = true;
    _complaint=false;
    _remarking = false;
  }


  bool get benefiting => _benefiting;
  bool get employee => _employee;
  bool get visitor => _visitor;
  bool get other => _other;
  bool get suggestion => _suggestion;
  bool get complaint => _complaint;
  bool get remarking => _remarking;

  String get name => _name;
  String get jop => _jop;
  String get email => _email;
  String get phone => _phone;
  String get text => _text;

  void setname (String value){
    _name = value;
    notifyListeners();
  }
  void setjop (String value){
    _jop = value;
    notifyListeners();
  }
  void setemail (String value){
    _email = value;
    notifyListeners();
  }
  void setphone (String value){
    _phone = value;
    notifyListeners();
  }
  void settext (String value){
    _text = value;
    notifyListeners();
  }


  void setbenefiting (bool value){
    if(!value)
    _benefiting = value;
    else{
      _benefiting = value;
      _employee=false;
      _visitor=false;
      _other=false;
    }

    notifyListeners();
  }
  void setemployee (bool value){
    if(!value)
    _employee = value;
    else{
      _employee = value;
      _benefiting=false;
      _visitor=false;
      _other=false;
    }
    notifyListeners();
  }
  void setvisitor (bool value){
    if(!value)
    _visitor = value;
    else{
      _visitor = value;
      _employee=false;
      _benefiting=false;
      _other=false;
    }
    notifyListeners();
  }
  void setother (bool value){
    if(!value)
    _other = value;
    else{
      _other = value;
      _employee=false;
      _visitor=false;
      _benefiting=false;
    }
    notifyListeners();
  }
  void setsuggestion (bool value){
    if(!value)
    _suggestion = value;
    else{
      _suggestion = value;
      _complaint=false;
      _remarking=false;
    }
    notifyListeners();
  }
  void setcomplaint (bool value){
    if(!value)
    _complaint = value;
    else{
      _complaint = value;
      _suggestion=false;
      _remarking=false;
    }
    notifyListeners();
  }
  void setremarking (bool value){
    if(!value)
    _remarking = value;
    else{
      _remarking = value;
      _complaint=false;
      _suggestion=false;
    }
    notifyListeners();
  }

}
