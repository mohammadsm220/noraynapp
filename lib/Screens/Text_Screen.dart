import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noraynapp/Widgets/DropDpwnMenu.dart';
import 'package:noraynapp/Widgets/NavigationBar.dart';
import 'package:noraynapp/Constant/constant.dart';
import 'package:provider/provider.dart';
import 'package:noraynapp/Service/Suggestions.dart';


class TextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _db = Provider.of<Suggestions>(context);
    var _firestor = Firestore.instance;
    return Scaffold(
      appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.white,
          title: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'images/home.png',
                fit: BoxFit.contain,
              ),
            ),
          )),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'رأيك يهمنا',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFiled(
                      name: 'الاسم',
                      setvalue: (String value) {
                        _db.setname(value);
                      },
                      controller: _db.controllerName,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CheckBox(
                      onTap: (bool value) {
                        _db.setbenefiting(value);
                      },
                      text: 'مستفيدة',
                      setvalue: _db.benefiting,
                    ),
                    CheckBox(
                      onTap: (bool value) {
                        _db.setemployee(value);
                      },
                      text: 'موظفة',
                      setvalue: _db.employee,
                    ),
                    CheckBox(
                      onTap: (bool value) {
                        _db.setvisitor(value);
                      },
                      text: 'زائرة/ زائر',
                      setvalue: _db.visitor,
                    ),
                    CheckBox(
                      onTap: (bool value) {
                        _db.setother(value);
                      },
                      text: 'أخراى',
                      setvalue: _db.other,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 3.0,
                        bottom: 15.0,
                      ),
                      child: TextFiled(
                        name: 'أخرى',
                        edit: _db.other,
                        setvalue: (value) {
                          _db.setotherString(value);
                        },
                        controller: _db.controllerOther,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFiled(
                      name: 'البريد الالكتروني',
                      setvalue: (String value) {
                        _db.setemail(value);
                      },
                      controller: _db.controllerEmail,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFiled(
                      name: 'رقم الجوال',
                      setvalue: (String value) {
                        _db.setphone(value);
                      },
                      controller: _db.controllerPhone,
                    ),
                    SizedBox(
                      height: 15,
                    ),

                       Text('الشكوى او الاقتراح لـ',textAlign: TextAlign.start,style: TextStyle(fontSize:20),),
                    DropDpwnMenu(),
                    SizedBox(
                      height: 10,
                    ),
                    CheckBox(
                      onTap: (bool value) {
                        _db.setsuggestion(value);
                      },
                      text: 'إقتراح',
                      setvalue: _db.suggestion,
                    ),
                    CheckBox(
                      onTap: (bool value) {
                        _db.setcomplaint(value);
                      },
                      text: 'شكوى',
                      setvalue: _db.complaint,
                    ),
                    CheckBox(
                      onTap: (bool value) {
                        _db.setremarking(value);
                      },
                      text: 'ملاحظة',
                      setvalue: _db.remarking,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      // hack textfield height
                      padding: EdgeInsets.only(bottom: 40.0),
                      child: TextField(
                        controller: _db.controllerText,
                        onChanged: (value) => _db.settext(value),
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: "النص",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Color(0xFF663e60),
                      child: Text(
                        'أرسال',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_db.seand()) {
                          _firestor.collection('suggestion').add(
                            {
                              'name': _db.name,
                              'benefiting': _db.benefiting,
                              'employee': _db.employee,
                              'visitor': _db.visitor,
                              'email': _db.email,
                              'other': _db.other,
                              'phone': _db.phone,
                              'TO':_db.drobValue,
                              'suggestion': _db.suggestion,
                              'complaint': _db.complaint,
                              'remarking': _db.remarking,
                              'text': _db.text,
                            },
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('تم أرسال طلبك'),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        _db.controllerEmail.clear();
                                        _db.controllerName.clear();
                                        _db.controllerOther.clear();
                                        _db.controllerPhone.clear();
                                        _db.controllerText.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text('موافق'),
                                    ),
                                  ],
                                );
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('عفواً'),
                                  content:
                                      Text('يجب أكمال جميع الخانات المطلوبة'),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('موافق'),
                                    ),
                                  ],
                                );
                              });
                        }
                        // z.collection('test1').add({'ok': Contect});
                      },
                    ),
                  ],
                ),
              ),
            ),
            // TextField(),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: NavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBox extends StatelessWidget {
  CheckBox({this.onTap, this.text, this.setvalue});
  Function onTap;
  String text;
  bool setvalue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          checkColor: Colors.white,
          activeColor: Color(0xFF663e60),
          onChanged: onTap,
          value: setvalue,
        ),
        Text(text),
      ],
    );
  }
}

class TextFiled extends StatelessWidget {
  TextFiled({this.name, this.setvalue, this.edit = true,@required this.controller});
  String name;
  Function setvalue;
  bool edit;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: edit,
      obscureText: false,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
      onChanged: setvalue,
      keyboardType: TextInputType.emailAddress,
      decoration: kTextDecoration.copyWith(hintText: name),
    );
  }
}
