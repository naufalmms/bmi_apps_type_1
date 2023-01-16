import 'package:bmi_apps/calculate_page.dart';
import 'package:bmi_apps/constant.dart';
import 'package:bmi_apps/rumus_bmi.dart';
import 'package:bmi_apps/widget_card.dart';
import 'package:concentric_transition/page_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectGender = "Male";
  int height = 150;
  int weight = 37;
  int age = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator BMI"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: WidgetCard(
                    colour: selectGender == "Male"
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/mann.json',
                          fit: BoxFit.fitHeight,
                        ),
                        const Text(
                          "MALE",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    onPress: () {
                      setState(() {
                        selectGender = "Male";
                      });
                    },
                  ),
                ),
                Expanded(
                  child: WidgetCard(
                    colour: selectGender == "Female"
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/womenn.json',
                          fit: BoxFit.fitHeight,
                        ),
                        const Text(
                          "FEMALE",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    onPress: () {
                      setState(() {
                        selectGender = "Female";
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: WidgetCard(
              colour: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainerColor,
                      activeTrackColor: Colors.white,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                      trackHeight: 1,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 250,
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ),
                  const Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: WidgetCard(
                    colour: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: WidgetCard(
                    colour: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              RumusBmi rumusBmi = RumusBmi(height: height, weight: weight);
              Navigator.push(context, ConcentricPageRoute(builder: (ctx) {
                return CalculatePage(
                  bmiResult: rumusBmi.calculateBMI(),
                  result: rumusBmi.getResults(),
                  review: rumusBmi.getResults(),
                );
              }));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => CalculatePage(
              //       bmiResult: rumusBmi.calculateBMI(),
              //       result: rumusBmi.getResults(),
              //       review: rumusBmi.getResults(),
              //     ),
              //   ),
              // );
            },
            child: Container(
              width: double.infinity,
              height: kBottomContainerHeight,
              color: kBottomContainerColor,
              child: const Center(
                child: Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
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

class RoundButton extends StatelessWidget {
  final Icon icon;
  final Function onTap;

  const RoundButton({super.key, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      shape: const CircleBorder(),
      fillColor: kButtonColor,
      onPressed: () {
        onTap();
      },
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      elevation: 6,
    );
  }
}
