import 'package:flutter/material.dart';
import 'dart:async';
class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}
final String ans1 ='هذا الملف يتحدث عن نهاية الديمقراطية للكاتب جان-ماري غيهينو.  يتناول الملف تأثير الأحداث السياسية على الديمقراطية  والتحولات السياسية في العالم.';
final String ans2 =' الفكرة الرئيسية للكتاب تتناول نهاية الديمقراطية وتحليل العوامل التي قد تؤدي إلى انهيار النظام الديمقراطي. يمكنك العثور على تفاصيل أكثر حول هذا الموضوع في صفحة 19 من الملف.';
final String ans3 ='الصفحات المتاحة لدي لا تحتوي على معلومات مباشرة حول كيفية ارتباط المطلب القومي في بلدان العالم الثالث بالديمقراطية والتنمية. ومع ذلك، يمكن القول بأن المطلب القومي في بلدان العالم الثالث يمكن أن يكون عاملاً مهماً في تشكيل السياسات الديمقراطية وتعزيز التنمية. يمكن أن يكون للمطالب القومية تأثير كبير على الاستقرار السياسي والاقتصادي، وبالتالي يمكن أن يؤثر على عمليات اتخاذ القرار وتنفيذ السياسات التنموية.';
//final String ans4 ='لصفحات المتاحة لدي لا تحتوي على معلومات مباشرة حول كيفية ارتباط المطلب القومي في بلدان العالم الثالث بالديمقراطية والتنمية. ومع ذلك، يمكن القول بأن المطلب القومي في بلدان العالم الثالث يمكن أن يكون عاملاً مهماً في تشكيل السياسات الديمقراطية وتعزيز التنمية. يمكن أن يكون للمطالب القومية تأثير كبير على الاستقرار السياسي والاقتصادي، وبالتالي يمكن أن يؤثر على عمليات اتخاذ القرار وتنفيذ السياسات التنموية.';
class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final List<String> answers = [ans1, ans2, ans3, ];
  int answerIndex = 0;
  final Duration _delay = Duration(seconds: 3);

  void _sendMessage() {
    setState(() {
      _messages.add({"text": _controller.text, "isUser": true});
      _controller.clear();
    });

    Timer(_delay, () {
      setState(() {
        _messages.add({"text": answers[answerIndex], "isUser": false});
        answerIndex = (answerIndex + 1) % answers.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('تحدث مع كتابك',
              style: TextStyle(color: Colors.blue[900]),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: _messages[index]["isUser"]
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: _messages[index]["isUser"]
                            ? Colors.blue[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(_messages[index]["text"]),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: Row(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'أكتب سؤالك',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}