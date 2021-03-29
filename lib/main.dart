import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentIndex = 0;
  String result = "";
  double height = 0;
  double weight = 0;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title:Text(
        " BMI Calculator",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          elevation: 30.0,
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   radioButton("MAN", Colors.blue, 0),
                   radioButton("WOMAN", Colors.pink, 1),
                ]
               ),
               SizedBox(height: 20,),
               Text(
                   "Your Height in cm : ",
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(height: 10,),
               TextField(
                 keyboardType: TextInputType.number,
                 controller: heightController,
                 textAlign: TextAlign.center,
                 decoration: InputDecoration(
                   hintText: "Your Height in cm ",
                   filled: true,
                   fillColor: Colors.grey[200],
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide.none,
                   )
                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 width: double.infinity,
                 child: Text(
                   "Your Weight in kg : ",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
               SizedBox(height: 10,),
               TextField(
                 keyboardType: TextInputType.number,
                 controller: weightController,
                 textAlign: TextAlign.center,
                 decoration: InputDecoration(
                     hintText: "Your Weight in km ",
                     filled: true,
                     fillColor: Colors.grey[200],
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide.none,
                     )
                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 width: double.infinity,
                 height: 50,
                 child: FlatButton(
                   onPressed: (){
                     setState(() {
                       height  = double.parse(heightController.value.text);
                       weight = double.parse(weightController.value.text);
                     });
                     calculateBmi(height, weight);
                     },
                   color: Colors.lightBlue,
                   child: Text("Calculate",
                     style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),
                   ),
                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 width: double.infinity,
                 child: Text(
                   "Your BMI is: ",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 24,
                   ),
                 ),
               ),
               SizedBox(height: 30,),
               Container(
                 width: double.infinity,
                 child: Text(
                   "$result",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize:40,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi (double height, double weight){
    double finalResult = weight / (height*height/10000);
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index){
   setState(() {
     currentIndex = index;
   });
  }

  Widget radioButton(String value,Color color,int index){
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        height: 70,
        child: FlatButton(
          color: currentIndex == index ? color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: (){
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentIndex == index ? Colors.white : color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
    );
  }
}


