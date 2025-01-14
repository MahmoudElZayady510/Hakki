import 'package:flutter/material.dart';

import '../Widgets/MainBookList.dart';

class Recommended extends StatefulWidget {
  const Recommended({super.key});

  @override
  State<Recommended> createState() => _Recommended();
}

class _Recommended extends State<Recommended> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Start the loading process
    _startLoading();
  }

  void _startLoading() {
    // Simulate a delay for the loading indicator
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('الموصي به لك',
              style: TextStyle(color: Colors.blue[900]),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.blue[100],
        flexibleSpace: Align(
          alignment: Alignment.bottomLeft ,
          child: Padding(padding: EdgeInsets.fromLTRB(40,4,4,4),
            //EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/tomo.png'),
              radius: 25,
            ),
          ) ,),
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          :
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:ColorFiltered(
                  child: Image.asset('assets/liberary.jpg', scale: 1.8,),
                  colorFilter: ColorFilter.mode(Colors.blueAccent, BlendMode.modulate),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(child: MainBooksList(favorites: false,bookNum: 4, rating: 4,imgScale: 1.95,),
                onTap: (){
                  Navigator.pushNamed(context, 'bookDetails01');
                },
              ),
              SizedBox(height: 20,),
              GestureDetector(child: MainBooksList(favorites: false,bookNum: 5, rating: 4,imgScale: 1.6,),
                onTap: (){
                  Navigator.pushNamed(context, 'bookDetails02');
                },
              ),
              SizedBox(height: 20,),
              GestureDetector(child: MainBooksList(favorites: false,bookNum: 3, rating: 3,imgScale: 1.6),
                onTap: (){
                  Navigator.pushNamed(context, 'bookDetails');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
