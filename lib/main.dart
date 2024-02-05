import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variable to store the user's age
  int age = 0;
  var status = '';
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          leading: Icon(Icons.how_to_vote),
          backgroundColor: Colors.blueGrey[400],
          title: Text(
            'Voter Eligibility Checker',
            style: TextStyle(color: Colors.white, letterSpacing: 1),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 380,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _textController,
                    onChanged: (value) {
                      age = int.parse(value);
                    },
                    decoration: InputDecoration(

                      prefixIcon:Icon(Icons.emoji_people_rounded,color: Colors.black,),
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter your age',
                      border: OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(14)
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          _textController.clear ();
                        }, icon: Icon(Icons.clear),

                      ),

                    ),
                    keyboardType:TextInputType.numberWithOptions(),

                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Increment age and update the UI using setState
                  setState(() {
                    if (age >= 18 && age != 90) {
                      status = 'Congress: YOU ARE A VOTER! ';
                    } else if (age == 90) {
                      status = "Bonni!";
                    } else {
                      status = 'OOPS! YOU ARE UNDER AGE!';
                    };
                    // age >= 18 ? 'You are eligible to vote!' : 'You are under age to vote.';
                  });
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(Size(110, 28)), // Set width and height as needed
                  side: MaterialStatePropertyAll(BorderSide(width:1)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Change Colors.blue to your desired color
                ),
                child: Text('submit!',style: TextStyle(color: Colors.black,wordSpacing: 1,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20),
              Text(
                ' \n $status',
                // Display message based on age eligibility

                style: TextStyle(
                  color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
