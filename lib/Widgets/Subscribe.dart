import 'package:flutter/material.dart';
import 'package:noraynapp/Constant/constant.dart';
import 'package:provider/provider.dart';
import 'package:noraynapp/Service/Data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Subscribe extends StatelessWidget {
  Widget build(BuildContext context) {
    final _db = Provider.of<Data>(context);
    final coller = Firestore.instance;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2.0, 2.0), //(x,y)
              blurRadius: 5.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'أود التواصل عبر ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      Provider.of<Data>(context, listen: false)
                          .setContect('email');
                    },
                    child: 
                        Text(
                          'البريد',
                          style: TextStyle(
                            // fontSize: 20,
                            color: Provider.of<Data>(context).email
                                ? Colors.white
                                : Color(0xFF663e60),
                          ),
                        ),
                    backgroundColor: Provider.of<Data>(context).email
                        ? Color(0xFF663e60)
                        : Colors.white,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Provider.of<Data>(context, listen: false)
                          .setContect('phone');
                    },
                    child: Text(
                      'الواتساب',
                      style: TextStyle(
                        // fontSize: 20,
                        color: Provider.of<Data>(context).phone
                            ? Colors.white
                            : Color(0xFF663e60),
                      ),
                    ),
                    backgroundColor: Provider.of<Data>(context).phone
                        ? Color(0xFF663e60)
                        : Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFiled(_db.email ? 'noraynladies@gmil.com' : '0504246246',
                  (value) {
                _db.setcommunication(value);
              }),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'المعلومات الشخصية',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      Provider.of<Data>(context, listen: false)
                          .setGender('woman');
                    },
                    child: Text(
                      'أنثى',
                      style: TextStyle(
                        color: Provider.of<Data>(context).woman
                            ? Colors.white
                            : Color(0xFF663e60),
                      ),
                    ),
                    backgroundColor: Provider.of<Data>(context).woman
                        ? Color(0xFF663e60)
                        : Colors.white,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Provider.of<Data>(context, listen: false)
                          .setGender('man');
                    },
                    child: Text(
                      'ذكر',
                      style: TextStyle(
                        color: Provider.of<Data>(context).man
                            ? Colors.white
                            : Color(0xFF663e60),
                      ),
                    ),
                    backgroundColor: Provider.of<Data>(context).man
                        ? Color(0xFF663e60)
                        : Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFiled('الاسم', (value) {
                _db.setname(value);
              }),
              SizedBox(
                height: 10,
              ),
              TextFiled('المنطقة', (value) {
                _db.setlive(value);
              }),
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
                  coller.collection('test1').add({
                    'communication': _db.communication,
                    'name': _db.name,
                    'live': _db.live,
                    'man': _db.man,
                    'woman': _db.woman,
                    'email': _db.email,
                    'phone': _db.phone,
                  });

                  // coller.collection('test1').add({'ok': Contect});
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFiled extends StatelessWidget {
  TextFiled(this.name, this.onTap);
  String name;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: false,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
        onChanged: onTap,
        keyboardType: TextInputType.emailAddress,
        decoration: kTextDecoration.copyWith(hintText: name));
  }
}
