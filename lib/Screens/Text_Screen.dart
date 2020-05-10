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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Column(
            children: <Widget>[
              Expanded(
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
                    SizedBox(
                      height: 10,
                    ),
                    TextFiled(
                      name: 'البريد الالكتروني',
                      setvalue: (String value) {
                        _db.setemail(value);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFiled(
                      name: 'رقم الجوال',
                      setvalue: (String value) {
                        _db.setphone(value);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                        _firestor.collection('suggestion').add({
                          'name': _db.name,
                          'benefiting': _db.benefiting,
                          'employee': _db.employee,
                          'visitor': _db.visitor,
                          'email': _db.email,
                          'other': _db.other,
                          'phone': _db.phone,
                          'suggestion': _db.suggestion,
                          'complaint': _db.complaint,
                          'remarking': _db.remarking,
                          'text': _db.text,
                        });
                        // z.collection('test1').add({'ok': Contect});
                      },
                    ),
                  ],
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
  TextFiled({this.name, this.setvalue});
  String name;
  Function setvalue;
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: false,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
        onChanged: setvalue,
        keyboardType: TextInputType.emailAddress,
        decoration: kTextDecoration.copyWith(hintText: name));
  }
}
