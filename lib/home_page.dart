import 'package:calculator/components/my_button.dart';
import 'package:calculator/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/calculator_controller.dart';
import 'package:calculator/history_page.dart';
import 'package:calculator/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorController calculatorController = Get.put(CalculatorController());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(
                                () => calculatorController.outputValue.value ==
                                        0.0
                                    ? SizedBox()
                                    : Text(
                                        calculatorController.outputValue
                                            .toString(),
                                        style: TextStyle(
                                            color: buttonColor,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w800),
                                      ),
                              )
                            ]),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                calculatorController.inputValue.value,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    color: whiteColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 42),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                      onPressed: () {
                                        Get.to(() => ProfilePage());
                                      },
                                      icon: Icon(
                                        Icons.person,
                                        color: lableColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                      onPressed: () {
                                        Get.to(() => HistoryPage());
                                      },
                                      icon: Icon(
                                        Icons.history,
                                        color: lableColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: IconButton(
                                  onPressed: () {
                                    if (calculatorController
                                        .inputValue.value.isNotEmpty) {
                                      calculatorController.inputValue.value =
                                          calculatorController.inputValue.value
                                              .substring(
                                                  0,
                                                  calculatorController
                                                          .inputValue
                                                          .value
                                                          .length -
                                                      1);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.backspace,
                                    color: lableColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                MyButton(
                                  btnName: "C",
                                  isFunction: true,
                                ),
                                MyButton(
                                  btnName: "-/+",
                                  isFunction: true,
                                ),
                                MyButton(
                                  btnName: "%",
                                  isFunction: true,
                                ),
                                MyButton(
                                  btnName: "/",
                                  isFunction: true,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                MyButton(
                                  btnName: "7",
                                ),
                                MyButton(
                                  btnName: "8",
                                ),
                                MyButton(
                                  btnName: "9",
                                ),
                                MyButton(
                                  btnName: "x",
                                  isFunction: true,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                MyButton(
                                  btnName: "4",
                                ),
                                MyButton(
                                  btnName: "5",
                                ),
                                MyButton(
                                  btnName: "6",
                                ),
                                MyButton(
                                  btnName: "-",
                                  isFunction: true,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                MyButton(
                                  btnName: "1",
                                ),
                                MyButton(
                                  btnName: "2",
                                ),
                                MyButton(
                                  btnName: "3",
                                ),
                                MyButton(
                                  btnName: "+",
                                  isFunction: true,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                MyButton(
                                  btnName: "0",
                                ),
                                MyButton(
                                  btnName: ".",
                                ),
                                MyButton(
                                  btnName: "00",
                                ),
                                MyButton(
                                  btnName: "=",
                                  isFunction: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
