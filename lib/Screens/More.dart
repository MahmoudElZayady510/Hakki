import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/tomo.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('الإعدادات', style: TextStyle(color: Colors.blue[900]),),
                )
              ],
            ),
            backgroundColor: Colors.blue[100],
          ),
          body: ListView(
            children: ListTile.divideTiles( //         <-- ListTile.divideTiles
                color: Color(0xff5EC9EF),
                context: context,
                tiles: [
                  ListTile(
                    trailing: Icon(Icons.arrow_back_ios_new, color: Color(0xff5EC9EF),),
                    title: Text('معلومات الحساب',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_back_ios_new, color: Color(0xff5EC9EF),),
                    title: Text('قيم التطبيق',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_back_ios_new, color: Color(0xff5EC9EF),),
                    title: Text('معلومات عنا',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: Text('0.0.1',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                    title: Text('الإصدار الحالي',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){},
                      child: Text('تسجيل الخروج',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff5EC9EF),
                        ),
                      ),)
                ]
            ).toList(),
          ),
        ));
  }
}
