import 'package:flutter/material.dart';
import 'package:readify/Widgets/ContinueBookList.dart';
import 'package:readify/Widgets/MainBookList.dart';

class ContinueReading extends StatefulWidget {
  const ContinueReading({super.key});

  @override
  State<ContinueReading> createState() => _ContinueReading();
}

class _ContinueReading extends State<ContinueReading> {
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
            Text('أكمل القراءة',
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
              ContinueBookList(bookNum: 2, completed: 70, imgScale: 1.6, rating: 4,),
              SizedBox(height: 20,),
              ContinueBookList(bookNum: 1, completed: 50, imgScale: 1.6, rating: 4,),
              SizedBox(height: 20,),
              ContinueBookList(bookNum: 0, completed: 34, imgScale: 1.6, rating: 4,),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
