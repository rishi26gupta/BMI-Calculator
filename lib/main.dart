import 'package:bmi_app/Splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI calculation',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 10, 49, 116)),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

   String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 var wtcontroller = TextEditingController();
 var ftcontroller = TextEditingController();
 var inchcontroller = TextEditingController();

 var result = "";
 var bgcolor = Color.fromARGB(255, 204, 222, 244);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body:Container(
        color: bgcolor,
        child: Center(
          child: Container(
            //color: Color.fromARGB(255, 245, 218, 214),
            width:300,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(
                  fontSize: 22,
                 fontWeight: FontWeight.w400),
                 ),
          
                 SizedBox(
                  height:22
                 ),
                 TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your weight here '),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                 ),
                 SizedBox(
                  height:20
                 ),
                 TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your height in feet here '),
                    prefixIcon: Icon(Icons.height_outlined),
                  ),
                  keyboardType: TextInputType.number,
                 ),
                
                 SizedBox(
                  height:20
                 ),
                 TextField(
                  controller: inchcontroller,
                  decoration: InputDecoration(
                    label: Text('eneter your height in inch here'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                 ),
                  
                  SizedBox(
                    height:23
                  ),
      
                 ElevatedButton(onPressed: (){
                     var wt = wtcontroller.text.toString();
                     var ft = ftcontroller.text.toString();
                     var inch = inchcontroller.text.toString();
      
                     if(wt!="" && ft!="" && inch!="" ){
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinch = int.parse(inch);
      
                          var tinch = (ift*12) + iinch;
      
                          var tcm = tinch*2.54;
      
                          var tm = tcm/100;
      
                          var bmi = iwt/(tm*tm);

                          var msg ="";

                          
                          
                          

                          if(bmi>25){
                               msg = "You are overweight!!!!";
                               bgcolor = Colors.orange.shade200;
                          }
                          else if(bmi<18){
                                    msg = "You are underweight!!!!";
                               bgcolor = Colors.red.shade200;
                          }else{
                               msg = "You are healthy";
                               bgcolor = Colors.green.shade200;
                          }
      
                          setState(() {
                            result = " $msg \n Your BMI is : ${bmi.toStringAsFixed(3)}";
                          });
      
                     }else{
                       setState(() {
                         result="please fill all the required blanks !!";
                         bgcolor = Color.fromARGB(255, 204, 222, 244);
                       });
                     }
                 }, child: Text('Calculate')),
                           
                      SizedBox(
                        height: 16
                      ),
                  Text(result, style: TextStyle(fontSize: 18)),
      
              ],
            ),
          ),
        ),
      ),
     
    );
  }
}
