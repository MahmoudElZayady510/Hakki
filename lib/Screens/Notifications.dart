import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('الإشعارات', style: TextStyle(color: Colors.blue[900],),),
            )
          ],
        ),

      ),
      body: ListView(
    padding: EdgeInsets.all(8.0),
    children: [
    NotificationCard(
    icon: Icons.book,
    title: 'تمت إضافة كتاب مغامرات جديد!',
    description: 'كتاب "يونتوبيا" للكاتب أحمد خالد توفيق الآن أصبح متوفر على "صفحة"',
    time: 'منذ 5 دقائق',
    ),
    NotificationCard(
    icon: Icons.history_edu,
    title: 'تمت إضافة كتاب تاريخي جديد!',
    description: 'كتاب "تاريخ" للكاتب سوسين بدر الآن أصبح متوفر على "صفحة"',
    time: 'منذ 5 دقائق',
    ),
    NotificationCard(
    icon: Icons.book,
    title: 'تمت إضافة كتاب مغامرات جديد!',
    description: 'كتاب "يونتوبيا" للكاتب أحمد خالد توفيق الآن أصبح متوفر على "صفحة"',
    time: 'منذ 5 دقائق',
    ),
    NotificationCard(
    icon: Icons.history_edu,
    title: 'تمت إضافة كتاب تاريخي جديد!',
    description: 'كتاب "تاريخ" للكاتب سوسين بدر الآن أصبح متوفر على "صفحة"',
    time: 'منذ 5 دقائق',
    ),

    ],
    ),);
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String time;

  NotificationCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
  });
  Color clr = new Color(0xff2E4374);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(icon, size: 40.0, color: clr,),
              SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: clr
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      description,
                      style: TextStyle(
                        color: clr,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      time,
                      style: TextStyle(
                        color: clr,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
