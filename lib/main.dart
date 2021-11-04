import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Input the numbers";

  // Function to sum two numbers
  void _sum() {
    setState(() {
      double first = double.parse(firstNumberController.text);
      double second = double.parse(secondNumberController.text);
      double result = first + second;

      _infoText = "Result: ${result.toStringAsPrecision(4)}";
    });
  }

  // Function to subtract the second number from the first number.
  void _subtract() {
    setState(() {
      double first = double.parse(firstNumberController.text);
      double second = double.parse(secondNumberController.text);
      double result = first - second;

      _infoText = "Result: ${result.toStringAsPrecision(4)}";
    });
  }

  // Function to multiply two numbers
  void _multiply() {
    setState(() {
      double first = double.parse(firstNumberController.text);
      double second = double.parse(secondNumberController.text);
      double result = first * second;

      _infoText = "Result: ${result.toStringAsPrecision(4)}";
    });
  }

  // Function to divide the first number by the second number
  void _divide() {
    setState(() {
      double first = double.parse(firstNumberController.text);
      double second = double.parse(secondNumberController.text);
      
      if (second == 0.0) {
        _infoText = "Division is undefined";
      } else {
        double result = first / second;

        _infoText = "Result: ${result.toStringAsPrecision(4)}";
      }
    });
  }

  // Function to reset the text fields
  void _resetFields() {
    firstNumberController.text = "";
    secondNumberController.text = "";
    setState(() {
      _infoText = "Input the numbers";
    });
  }


  @override
  Widget build(BuildContext context) {
    
    // Definiton of the buttonSection
    Color color = Theme.of(context).primaryColor;
    
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.add, 'Sum'),
        _buildButtonColumn(color, Icons.remove, 'Subtract'),
        _buildButtonColumn(color, Icons.close, 'Multiply'),
        _buildButtonColumn(color, Icons.compress, 'Division'),
        _buildButtonColumn(color, Icons.refresh, 'Refresh'),
      ],
    );

  // Materialize the app
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Calc"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              // Logotype 
              Icon(Icons.calculate, size: 120.0, color: Colors.blue),
              
              // Define the first field to input
              Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 10.0),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Number 1",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: firstNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Input the first value is empty!";
                  }
                },
              ),

              // Define the second field to input
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Number 2",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: secondNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Input the second value is empty!";
                  }
                },
              ),

              // Define the section of buttons
              Padding(
                padding: EdgeInsets.only(top: 150.0, bottom: 10.0),
              ),
              buttonSection,

              // Define section of result and another information
              Padding(
                padding: EdgeInsets.only(top: 150.0, bottom: 10.0),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: 50.0,
          child: RaisedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if(icon == Icons.add) {
                  _sum();
                } else if (icon == Icons.remove) {
                  _subtract();
                } else if (icon == Icons.close){
                  _multiply();
                } else if (icon == Icons.compress) {
                  _divide();
                } else if (icon == Icons.refresh){
                  _resetFields();
                }
              }
            },
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),  
            ),
          ),
        ),
      ],
    );
  }
}
