import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  bool _emailOn;
  bool _phoneOn;
  bool _man;
  bool _woman;
  String _name;
  String _live;
  String _communication;
  Map<int, String> _navigater = {
    0: 'HomeScreen',
    1: 'TextScreen',
    2: 'NoeaynScreen',
    3: 'SalesScreen',
    4:'ActivitesScreen',
  };
  int _numPage = 0;
  
   Data() {
    _emailOn = true;
    _phoneOn=false;
    _woman = true;
    _man=false;
  }
  String get name => _name;
  String get live => _live;
  String get communication => _communication;
  int get numPage => _numPage;
  bool get email => _emailOn;
  bool get phone => _phoneOn;

   String setPage(int value) {
    _numPage = value;
    return _navigater[_numPage];
  }

  void setname (String value){
    _name = value;
    notifyListeners();
  }
  void setlive (String value){
    _live = value;
    notifyListeners();
  }
  void setcommunication (String value){
    _communication = value;
    notifyListeners();
  }

  void setContect(String way) {
    if(way == 'email'){
      _emailOn=true;
      _phoneOn = false;
    }
    else if(way=='phone' ){
      _emailOn=false;
      _phoneOn = true;
    }
    notifyListeners();
  }

  bool get man => _man;

  bool get woman => _woman;

  void setGender(String gender) {
    if(gender == 'woman'){
      _woman=true;
      _man = false;
    }
    else if(gender=='man' ){
      _woman=false;
      _man = true;
    }
    notifyListeners();
  }
  
  
}
