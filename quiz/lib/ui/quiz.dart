import 'package:flutter/material.dart';
import 'package:quiz/model/question.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  int _currentquestionindex = 0;
  List questionbank = [
    Question.name("Is Tiger is our National Animal ?", true),
    Question.name("Jawaharlal nehru is our father of our Nation ", false),
    Question.name(" Is Hindi is our National Language ? ", false),
    Question.name("India is a Non Developed Country", true),
    Question.name(" Lotus is our National Flower", true),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nationality Quiz"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      // ignore: non_constant_identifier_names
      body: Builder(builder: (BuildContext context) {
        return Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/flag.jfif",
                  width: 175,
                  height: 190,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.white, style: BorderStyle.solid)),
                  height: 120,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionbank[_currentquestionindex].questionText,
                      style: TextStyle(fontSize: 16.9, color: Colors.white),
                    ),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                          onPressed: () => _prequestion(),
                          color: Colors.blueGrey.shade900,
                          child: Icon(Icons.arrow_back, color: Colors.white)),
                      RaisedButton(
                        onPressed: () => _checkAnswer(true, context),
                        color: Colors.blueGrey.shade900,
                        child:
                            Text("TRUE", style: TextStyle(color: Colors.white)),
                      ),
                      RaisedButton(
                        onPressed: () => _checkAnswer(false, context),
                        color: Colors.blueGrey.shade900,
                        child: Text("FALSE",
                            style: TextStyle(color: Colors.white)),
                      ),
                      RaisedButton(
                          onPressed: () => _nextquestion(),
                          color: Colors.blueGrey.shade900,
                          child:
                              Icon(Icons.arrow_forward, color: Colors.white)),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Center(
                    child: Text(
                  "Developed by Shafiudeen.M",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              Spacer()
            ],
          ),
        );
      }),
    );
  }

  _checkAnswer(bool userchoice, BuildContext context) {
    if (userchoice == questionbank[_currentquestionindex].iscorrect) {
      _nextquestion();
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Corrext"));
      Scaffold.of(context).showSnackBar(snackbar);
      // debugPrint("yes");
    } else {
      _nextquestion();
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("InCorrect"));
      Scaffold.of(context).showSnackBar(snackbar);
      debugPrint("nes");
    }
  }

  _nextquestion() {
    setState(() {
      _currentquestionindex = (_currentquestionindex + 1) % questionbank.length;
    });
  }

  _prequestion() {
    setState(() {
      _currentquestionindex = (_currentquestionindex - 1) % questionbank.length;
    });
  }
}
