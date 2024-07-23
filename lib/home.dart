import 'dart:math';
import 'package:bmi_/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

bool isMale = true;
double heightval = 170.0;
int weight = 70;
int age = 20;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Body Math Index",
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m1Expanded(context, 'male'),
                      SizedBox(
                        width: 10,
                      ),
                      m1Expanded(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Height',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                heightval.toStringAsFixed(1),
                                style: const TextStyle(
                                    fontSize: 55,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              const Text(
                                'CM',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Slider(
                              min: 90,
                              max: 220,
                              value: heightval,
                              onChanged: (newValue) =>
                                  setState(() => heightval = newValue))
                        ],
                      ),
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m2Expanded(context, 'weight'),
                      const SizedBox(
                        width: 10,
                      ),
                      m2Expanded(context, 'age'),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  var result = weight / pow(heightval / 100, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Result(isMale: isMale, age: age, result: result),
                      ));
                },
                child: Container(
                  color: Colors.teal,
                  height: MediaQuery.of(context).size.height / 16,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "Calculate",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (isMale && type == 'male') || (!isMale && type == 'female')
              ? Colors.teal
              : Colors.blueGrey,
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              type == 'male' ? isMale = true : isMale = false;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String text) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text == 'weight' ? 'Weight' : 'Age',
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              text == 'weight' ? '$weight' : '$age',
              style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: text == 'weight' ? 'weight--' : 'age--',
                  onPressed: () {
                    setState(() {
                      text == 'weight' ? weight-- : age--;
                    });
                  },
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: text == 'weight' ? 'weight++' : 'age++',
                  onPressed: () {
                    setState(() {
                      text == 'weight' ? weight++ : age++;
                    });
                  },
                  child: const Icon(Icons.add),
                  mini: true,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
