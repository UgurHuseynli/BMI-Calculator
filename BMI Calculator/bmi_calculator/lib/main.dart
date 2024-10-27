import 'dart:math';

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
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
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
  double heightValue = 100;
  bool maleIsSelected = false;
  bool femaleIsSelected = false;
  int weightValue = 50;
  int ageValue = 20;
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1C2135),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF24263B),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            /* Male Card Container */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /* Male Button Container */
                SizedBox(
                  width: screenSize.width * 0.4,
                  height: screenSize.height * 0.2,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: selectedIndex == 0
                            ? const Color(0xFF24263B)
                            : const Color(0xFF333244),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.male,
                          size: 120,
                          color: Colors.white,
                        ),
                        Text(
                          'Male',
                          style:
                              TextStyle(color: Color(0xFF8B8C9E), fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),

                /* Female Button Container */
                SizedBox(
                  width: screenSize.width * 0.4,
                  height: screenSize.height * 0.2,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: selectedIndex == 1
                            ? const Color(0xFF24263B)
                            : const Color(0xFF333244),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.female,
                          size: 120,
                          color: Colors.white,
                        ),
                        Text(
                          'Female',
                          style:
                              TextStyle(color: Color(0xFF8B8C9E), fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            /* Height Container */
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF333244),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        'Height',
                        style:
                            TextStyle(color: Color(0xFF8B8C9E), fontSize: 20),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${heightValue.toInt()}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                            const Text('cm',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                      Slider(
                        min: 100,
                        max: 200,
                        value: heightValue,
                        onChanged: (newValue) {
                          setState(() {
                            heightValue = newValue;
                          });
                        },
                        thumbColor: const Color(0xFF1C2135),
                        activeColor: const Color(0xFF1C2135),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /* Weight and Age Containers */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenSize.width * 0.4,
                    height: screenSize.height * 0.2,
                    decoration: BoxDecoration(
                        color: const Color(0xFF333244),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Text(
                          'Weight',
                          style:
                              TextStyle(color: Color(0xFF8B8C9E), fontSize: 20),
                        ),
                        Text(
                          '$weightValue',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (weightValue > 0) {
                                    weightValue = weightValue - 1;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: const Color(0xFF8B8C9E)),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weightValue = weightValue + 1;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: const Color(0xFF8B8C9E)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.4,
                    height: screenSize.height * 0.2,
                    decoration: BoxDecoration(
                        color: const Color(0xFF333244),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Text(
                          'Age',
                          style:
                              TextStyle(color: Color(0xFF8B8C9E), fontSize: 20),
                        ),
                        Text(
                          '$ageValue',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (ageValue > 0) {
                                    ageValue = ageValue - 1;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: const Color(0xFF8B8C9E)),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ageValue = ageValue + 1;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: const Color(0xFF8B8C9E)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: screenSize.width,
                  height: screenSize.height * 0.08,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(weightValue: weightValue, heightValue: heightValue.toInt())));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: const Color(0xFF333244),
                    ),
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white, fontSize: 25),
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

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.weightValue, required this.heightValue});

  final int weightValue;
  final int heightValue;

  String calculateBMI() {
    var bmi = weightValue / pow(heightValue/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String bmiLevel() {
    if (double.parse(calculateBMI()) < 18.5) {
      return 'Underweight';
    }
    else if (double.parse(calculateBMI()) >= 18.5 && double.parse(calculateBMI()) <= 24.9) {
      return 'Normal';
    }
    else if (double.parse(calculateBMI()) >= 25 && double.parse(calculateBMI()) <= 29.9) {
      return 'Overweight';
    }
    return 'Obese';
  }

  String resultText() {
    if (bmiLevel() == 'Underweight') {
      return 'You are on the leaner side. Consider a nutrition boost with calorie-dense, nutritious foods to support your energy and health!';
    }
    else if (bmiLevel() == 'Normal') {
      return 'Well done! Your BMI is in a healthy range. Keep up your balanced lifestyle to maintain your wellness';
    }
    else if (bmiLevel() == 'Overweight') {
      return 'You are in the upper range. Small, sustainable changes in diet and activity can make a meaningful difference!';
    }
    return 'Your BMI indicates you are in a higher range. Taking small steps towards healthier choices can set you on a great path to improved well-being!';
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1C2135),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color(0xFF24263B),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Text(
              'Your Result',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: screenSize.width * 0.8,
            height: screenSize.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF333244),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Column(
                children: [
                  Text(
                    bmiLevel(),
                    style: const TextStyle(
                        color: Color(0xFF21BF73),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    calculateBMI(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      'You have a ${bmiLevel().toLowerCase()} body weight, \n ${resultText()}.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFF8B8C9E), fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.height * 0.08,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: const Color(0xFF333244),
                  ),
                  child: const Text(
                    'Calculate again',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
