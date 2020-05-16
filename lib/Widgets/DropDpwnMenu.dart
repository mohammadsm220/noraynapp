import 'package:flutter/material.dart';
import 'package:noraynapp/Service/Suggestions.dart';
import 'package:provider/provider.dart';

class DropDpwnMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _db = Provider.of<Suggestions>(context,listen: false);
    return DropdownButton(
      isExpanded: true,
      value: _db.value,
      items: [
        DropdownMenuItem(
          value: 1,
          child: Text(
            'مدرسة الفتاة "الفترة الصباحية"',
          ),
          onTap: ()=>_db.setvalue(1,'مدرسة الفتاة "الفترة الصباحية"'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text(
            'مدرسة الفتاة "الفترة المسائية"',
          ),
          onTap: ()=>_db.setvalue(2,'مدرسة الفتاة "الفترة المسائية"'),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text(
            'روضة أجيال النخبة',
          ),
          onTap: ()=>_db.setvalue(3,'روضة أجيال النخبة'),
        ),
        DropdownMenuItem(
          value: 4,
          child: Text(
            'حضانة نون',
          ),
          onTap: ()=>_db.setvalue(4,'حضانة نون'),
        ),
        DropdownMenuItem(
          value: 5,
          child: Text(
            'وحدة الإعلام',
          ),
          onTap: ()=>_db.setvalue(5, 'وحدة الإعلام'),
        ),
        DropdownMenuItem(
          value: 6,
          child: Text(
            'وحدة الخدمات المساندة',
          ),
          onTap: ()=>_db.setvalue(6,'وحدة الخدمات المساندة'),
        ),
        DropdownMenuItem(
          value: 7,
          child: Text(
            'وحدة الإدارة المالية',
          ),
          onTap: ()=>_db.setvalue(7, 'وحدة الإدارة المالية'),
        ),
        DropdownMenuItem(
          value: 8,
          child: Text(
            'وحدة التقنية',
          ),
          onTap: ()=>_db.setvalue(8, 'وحدة التقنية'),
        ),
        DropdownMenuItem(
          value: 9,
          child: Text(
            'وحدة الموارد البشرية',
          ),
          onTap: ()=>_db.setvalue(9,'وحدة الموارد البشرية'),
        ),
        DropdownMenuItem(
          value: 10,
          child: Text(
            'مساعد المدير',
          ),
          onTap: ()=>_db.setvalue(10,'مساعد المدير'),
        ),
        DropdownMenuItem(
          value: 11,
          child: Text(
            'المدير التنفذي',
          ),
          onTap: ()=>_db.setvalue(11,'المدير التنفذي'),
        ),
        DropdownMenuItem(
          value: 12,
          child: Text(
            'وحدة علاقات الشركاء',
          ),
          onTap: ()=>_db.setvalue(12, 'وحدة علاقات الشركاء'),
        ),
        DropdownMenuItem(
          value: 13,
          child: Text(
            'وحدة العلاقات العامة',
          ),
          onTap: ()=>_db.setvalue(13,'وحدة العلاقات العامة'),
        ),
        DropdownMenuItem(
          value: 14,
          child: Text(
            'الإستقبال',
          ),
          onTap: ()=>_db.setvalue(14,'الإستقبال'),
        ),
        DropdownMenuItem(
          value: 15,
          child: Text(
            'الأمن',
          ),
          onTap: ()=>_db.setvalue(15,'الأمن'),
        ),
        DropdownMenuItem(
          value: 16,
          child: Text(
            'الكافتريا',
          ),
          onTap: ()=>_db.setvalue(16,'الكافتريا'),
        ),
        DropdownMenuItem(
          value: 17,
          child: Text(
            'Spark Hup',
          ),
          onTap: ()=>_db.setvalue(17,'Spark Hup'),
        ),
        DropdownMenuItem(
          value: 18,
          child: Text(
            'التأجير',
          ),
          onTap: ()=>_db.setvalue(18,'التأجير'),
        ),
        DropdownMenuItem(
          value: 19,
          child: Text(
            'العاملات',
          ),
          onTap: ()=>_db.setvalue(19,'العاملات'),
        ),
      ],
      onChanged: (value) {
        // _db.setvalue(value,'ds');
      },
    );
  }
}
