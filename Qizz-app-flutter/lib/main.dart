import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: QuizHome(),
    );
  }
}

class QuizHome extends StatefulWidget {
  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Thủ đô của Việt Nam là gì?',
      'answers': [
        {'text': 'Hà Nội', 'score': 1},
        {'text': 'TP. Hồ Chí Minh', 'score': 0},
        {'text': 'Đà Nẵng', 'score': 0},
        {'text': 'Cần Thơ', 'score': 0},
      ],
    },
    {
      'questionText': 'Nước nào có diện tích lớn nhất thế giới?',
      'answers': [
        {'text': 'Trung Quốc', 'score': 0},
        {'text': 'Nga', 'score': 1},
        {'text': 'Hoa Kỳ', 'score': 0},
        {'text': 'Canada', 'score': 0},
      ],
    },
    {
      'questionText': 'Ai là người viết Tuyên ngôn Độc lập của Việt Nam?',
      'answers': [
        {'text': 'Hồ Chí Minh', 'score': 1},
        {'text': 'Phan Bội Châu', 'score': 0},
        {'text': 'Võ Nguyên Giáp', 'score': 0},
        {'text': 'Nguyễn Ái Quốc', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              question: _questions[_questionIndex]['questionText'] as String,
              answers: _questions[_questionIndex]['answers'] as List<Map<String, Object>>,
              answerQuestion: _answerQuestion,
            )
          : Result(_totalScore, _resetQuiz),
    );
  }
}

class Quiz extends StatelessWidget {
  final String question;
  final List<Map<String, Object>> answers;
  final Function answerQuestion;

  Quiz({
    required this.question,
    required this.answers,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          question,
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ...answers.map((answer) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              onPressed: () => answerQuestion(answer['score']),
              child: Text(answer['text'] as String),
            ),
          );
        }).toList(),
      ],
    );
  }
}

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Quiz Hoàn Thành!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            'Điểm của bạn: $totalScore',
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetQuiz,
            child: Text('Làm lại quiz'),
          ),
        ],
      ),
    );
  }
}
