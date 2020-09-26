
import 'question.dart';

class QuizBrain{
  int _questionNumber=0;
  List<Question> _questionBank=[
    Question('Prince Harry is taller than Prince William',false) ,
    Question('The star sign Aquarius is represented by a tiger',true),
    Question('Meryl Streep has won two Academy Awards',false),
    Question( 'Marrakesh is the capital of Morocco',false),
    Question( 'Idina Menzel sings \'let it go\' 20 times in \'Let It Go\' from Frozen',false),
    Question( 'Waterloo has the greatest number of tube platforms in London',true),
    Question( 'M&M stands for Mars and Moordale',false),
    Question( 'Gin is typically included in a Long Island Iced Tea',true),
    Question( 'The unicorn is the national animal of Scotland',true),
    Question( 'There are two parts of the body that can\'t heal themselves',false),
    Question( 'Howard Donald is the oldest member of Take That',true),
    Question( 'The Great Wall of China is longer than the distance between London and Beijing',true),
    Question( 'There are 219 episodes of Friends',false),
    Question( '\'A\' is the most common letter used in the English language',false),
    Question( 'A lion\'s roar can be heard up to eight kilometres away',true),
    Question( 'In Harry Potter, Draco Malfoy has no siblings',false),
    Question( 'Louis Walsh is older than Simon Cowell',true),
    Question( 'Monaco is the smallest country in the world',false),
    Question( '\'What Do You Mean\' was Justin Bieber\'s first UK number one single',true),
    Question( 'The river Seine in Paris is longer than the river Thames in London',true),
    Question( 'A cara cara navel is a type of orange',true),
    Question( 'There are five different blood groups',false),
    Question( 'Cinderella was the first Disney princess',false),
    Question( 'ASOS stands for As Seen On Screen',true),
    Question( 'The Battle Of Hastings took place in 1066',true),
    Question( 'H&M stands for Hennes & Mauritz',true),
    Question( 'Canis lupur is the scientific name for a wolf',false),
    Question( 'K is worth four points in Scrabble',false),
    Question( 'Alaska is the biggest American state in square miles',true),
    Question( 'Ariana Grande is 25 or under',false),
    Question( 'Australia is wider than the moon',true),
    Question( 'Queen Elizabeth II is currently the second longest reigning British monarch',false),
    Question( ' Madonna\'s real name is Madonna',true),
    Question( 'Serena Williams has one more singles tennis Grand Slam titles than sister Venus',true),
    Question( 'Alexander Fleming discovered penicillin',true),
  ];
  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1)
    {
      _questionNumber++;
    }

  }
  bool  isFinished(){
    if (_questionNumber==_questionBank.length-1){
      return true;
    }
    else
      return false;
  }
  int reset(){
    return _questionNumber=0;
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }



}