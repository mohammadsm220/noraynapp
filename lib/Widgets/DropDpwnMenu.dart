import 'package:flutter/material.dart';

class DropDpwnMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: "1",
          child: Text(
            "الاول",
          ),
        ),
        DropdownMenuItem(
          value: "2",
          child: Text(
            "الثاني",
          ),
        ),
        DropdownMenuItem(
          value: "3",
          child: Text(
            "الثالث",
          ),
        ),
        DropdownMenuItem(
          value: "4",
          child: Text(
            "الرابع",
          ),
        ),
        DropdownMenuItem(
          value: "5",
          child: Text(
            "الخامس",
          ),
        ),
      ],
      onChanged: (value) {},
    );
  }
}