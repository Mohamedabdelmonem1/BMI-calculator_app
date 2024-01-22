import 'dart:math';
import 'package:bmi_calculator_app/pages/result_page.dart';
import 'package:flutter/material.dart';
import '../component/custom_data.dart';
import '../component/custom_gender.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? isMale;
  double height = 150;
  int age = 20;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CustomGender(
                      color: isMale == true ? Colors.blue : Colors.grey[400],
                      icon: Icons.male,
                      text: "Male",
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CustomGender(
                      color: isMale == false ? Colors.blue : Colors.grey[400],
                      icon: Icons.female,
                      text: "Female",
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[400]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${height.round()}",
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Cm",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          max: 220,
                          min: 80,
                          onChanged: (val) {
                            setState(() {
                              height = val;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CustomData(
                      onPressed1: () {
                        setState(() {
                          age = age + 1;
                        });
                      },
                      icon1: Icons.add,
                      num: "$age",
                      text: "AGE",
                      onPressed2: () {
                        setState(() {
                          age = age - 1;
                        });
                      },
                      icon2: Icons.remove,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CustomData(
                      onPressed1: () {
                        setState(() {
                          weight = weight + 1;
                        });
                      },
                      icon1: Icons.add,
                      num: "$weight",
                      text: "WEIGHT",
                      onPressed2: () {
                        setState(() {
                          weight = weight - 1;
                        });
                      },
                      icon2: Icons.remove,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15,
                bottom: 15,
              ),
              child: Container(
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: () {
                    var result = weight / pow(height / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          result: result.round(),
                          age: age,
                          gender: isMale!,
                        ),
                      ),
                    );
                  },
                  child: const Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
