import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

//import  'package:flutter/src/widgets/text.dart';

QuizBrain quizBrain =QuizBrain();
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BRAIN QUIZ',
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/quiz.jpg"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Quizler App',
              textAlign: TextAlign.center,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper=[];
  void checkAnswer(userPickedAnswer){
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if(quizBrain.isFinished()==true){

        Alert(

          context: context,

          title: 'Finished!',

          desc: 'You\'ve reached the end of the quiz.',

        ).show();
        final player = AudioCache();
        player.play('note3.wav');
        quizBrain.reset();
        scorekeeper=[];


      }
      else {
        if (userPickedAnswer == correctAnswer) {
          scorekeeper.add(Icon(Icons.check, color: Colors.green,),);
          final player = AudioCache();
          player.play('note1.wav');
        }
        else {
          scorekeeper.add(Icon(Icons.close, color: Colors.red,),);
          final player = AudioCache();
          player.play('note2.wav');
        }
        quizBrain.nextQuestion();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      crossAxisAlignment:CrossAxisAlignment.stretch,

      children :<Widget> [

        Expanded(
          flex:5,
          child:Container(
            color: Colors.yellowAccent,
            width: 200,
            height: 80,
            padding:EdgeInsets.all(10.0),
            child: Center(
              child:Text(
                quizBrain.getQuestionText()!=null?quizBrain.getQuestionText():'Default Value',
                textAlign:TextAlign.center,
                style:TextStyle(
                  fontSize:30.0,
                  color:Colors.black,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child:Padding(
            padding:EdgeInsets.all(10.0),
            child:FlatButton(
                textColor:Colors.white,
                color:Colors.green,
                child:Text(
                  'True',
                  style:TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                onPressed:() {
                  checkAnswer(true);
                }
            ),
          ),
        ),
        Expanded(
          child:Padding(
            padding:EdgeInsets.all(10.0),
            child:FlatButton(
                textColor:Colors.white,
                color:Colors.red,
                child:Text(
                  'False',
                  style:TextStyle(
                    fontSize:30.0,
                  ),
                ),
                onPressed:() {
                  checkAnswer(false);
                }
            ),
          ),
        ),
        Row(
          children :scorekeeper,
        ),
      ],
    );
  }
}