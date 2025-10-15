import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const MyHomePage(title: 'tera BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result="";
  var bgcolor=Colors.grey.shade100;
  var msg="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('BMI'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.orange.shade200,
            Colors.red.shade200,
            Colors.purple.shade200,
          ])
        ),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your weight(in kg)'),
                      prefixIcon:Icon(Icons.line_weight),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text('Enter your height(in feet)'),
                      prefixIcon:Icon(Icons.height),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Enter your height(in inch)'),
                      prefixIcon:Icon(Icons.line_weight),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var it = inController.text.toString();
                  if(wt!="" && ft!="" && it!=""){
                    var iwt=int.parse(wt);
                    var ift=int.parse(ft);
                    var iit=int.parse(it);

                    var tInch=(ift*12)+iit;
                    var tcm=tInch*2.54;
                    var tm= tcm/100;
                    var bmi=iwt/(tm*tm);
                    if(bmi>25){
                      msg="you're overweight!!";
                      bgcolor= Colors.yellow.shade400;
                    }else if(bmi<18){
                      msg="you're underweight!!";
                      bgcolor= Colors.red.shade400;
                    }else{
                      msg="you're fit!!";
                      bgcolor= Colors.green.shade400;
                    }

                    result="$msg \nyour body mass index is ${bmi.toStringAsFixed(2)}";
                    setState(() {

                    });
                  } else{
                    setState(() {
                      result = "please fill all the required detail!!";
                    });
                  }
                }, child:Text('calculate')),
                SizedBox(
                  height: 15,
                ),
                Text(result,style:TextStyle(fontSize: 20))
              ],

            ),
          ),
        ),
      )
    );
  }
}
