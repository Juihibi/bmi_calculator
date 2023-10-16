import 'package:bmi_calculator/widgets/text_slidered.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = 135.00;
  double _weight = 58.00;
  int _bmi = 0;
  String _condition = 'Select data';

  /*void handleSliderChange(double value) {
    setState(() {
      if (value == _height) {
        _height = value;
      } else if (value == _weight) {
        _weight == value;
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffa9327b),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                // text BMI
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                //text Calculator
                Text(
                  'Calculator',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                //Bmi calcul
                Container(
                  child: Text(
                    '$_bmi',
                    style: TextStyle(
                        fontSize: 42,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.bottomRight,
                ),

                //text condition

                Row(
                  children: [
                    Text(
                      'Condition: ',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),

                    //value condition text
                    Text(
                      '$_condition',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          //  text choose data
          Text(
            'Choose data',
            style: TextStyle(
              fontSize: 32,
              color: Color(0xffa9327b),
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30.0),

          //height and height value
          TextSlidered(
            title: 'Height: ',
            value: _height,
            onChanged: (double value) {
              setState(() {
                _height = value; // Update _height when the slider changes
              });
            },
            label: '${_height.toStringAsFixed(0)}',
          ),

          const SizedBox(height: 20),

          //weight and weight value
          TextSlidered(
            title: 'Weight: ',
            value: _weight,
            onChanged: (double value) {
              setState(() {
                _weight = value; // Update _height when the slider changes
              });
            },
            label: '${_weight.toStringAsFixed(0)}',
            isweight: true,
          ),
          const SizedBox(height: 60.0),

          //  calculate button
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffa9327b),
            ),
            child: Center(
              child: TextButton(
                child: Text('Calculate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () {
                  setState(() {
                    //18.5-25 Healthy    25-30 Overweight     >30 Obesity
                    _bmi = (_weight / ((_height / 100) * (_height / 100)))
                        .round()
                        .toInt();

                    if (18.5 <= _bmi && _bmi <= 25) {
                      _condition = 'Healthy';
                    } else if (25 < _bmi && _bmi <= 30) {
                      _condition = 'Overweight';
                    } else if (30 < _bmi) {
                      _condition = 'Obesity';
                    } else {
                      _condition = 'Underweight';
                    }
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
