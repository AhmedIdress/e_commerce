import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HorizontalCheckoutState extends StatelessWidget {
  HorizontalCheckoutState({Key? key, required this.currentState})
      : super(key: key);
  int currentState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 34,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 2,
                        color: currentState >= 1 ? primaryColor : Colors.grey,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 2,
                        color: currentState >= 2 ? primaryColor : Colors.grey,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          currentState == 0 ? primaryColor : Colors.grey,
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: const CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 8,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor:
                          currentState == 1 ? primaryColor : Colors.grey,
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: currentState >= 1
                            ? const CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 8,
                              )
                            : const SizedBox(
                                height: 1,
                                width: 1,
                              ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor:
                          currentState == 2 ? primaryColor : Colors.grey,
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: currentState >= 2
                            ? const CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 8,
                              )
                            : const SizedBox(
                                height: 1,
                                width: 1,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomText(text: 'Delivery', size: 14),
            CustomText(text: 'Address', size: 14),
            CustomText(text: 'Summary', size: 14),
          ],
        ),
      ],
    );
  }
}

class VerticalCheckoutState extends StatelessWidget {
  VerticalCheckoutState({Key? key, required this.currentState})
      : super(key: key);
  int currentState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(
                        text: '20/18',
                        size: 14,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: '10:00 AM',
                        size: 14,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(
                        text: '20/18',
                        size: 14,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: '10:00 AM',
                        size: 14,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(
                        text: '21/18',
                        size: 14,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: '10:00 AM',
                        size: 14,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(
                        text: '',
                        size: 14,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: '',
                        size: 14,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(
                        text: '',
                        size: 14,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: '',
                        size: 14,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: double.infinity,
                width: 34,
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 2,
                            height: constraints.maxHeight * .23,
                            color:
                                currentState >= 1 ? primaryColor : Colors.grey,
                          ),
                          Container(
                            width: 2,
                            height: constraints.maxHeight * .23,
                            color:
                                currentState >= 2 ? primaryColor : Colors.grey,
                          ),
                          Container(
                            width: 2,
                            height: constraints.maxHeight * .23,
                            color:
                                currentState >= 3 ? primaryColor : Colors.grey,
                          ),
                          Container(
                            width: 2,
                            height: constraints.maxHeight * .23,
                            color:
                                currentState >= 4 ? primaryColor : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              currentState == 0 ? primaryColor : Colors.grey,
                          radius: 17,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: const CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 8,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor:
                              currentState == 1 ? primaryColor : Colors.grey,
                          radius: 17,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: currentState >= 1
                                ? const CircleAvatar(
                                    backgroundColor: primaryColor,
                                    radius: 8,
                                  )
                                : const SizedBox(
                                    height: 1,
                                    width: 1,
                                  ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor:
                              currentState == 2 ? primaryColor : Colors.grey,
                          radius: 17,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: currentState >= 2
                                ? const CircleAvatar(
                                    backgroundColor: primaryColor,
                                    radius: 8,
                                  )
                                : const SizedBox(
                                    height: 1,
                                    width: 1,
                                  ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor:
                              currentState == 3 ? primaryColor : Colors.grey,
                          radius: 17,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: currentState >= 3
                                ? const CircleAvatar(
                                    backgroundColor: primaryColor,
                                    radius: 8,
                                  )
                                : const SizedBox(
                                    height: 1,
                                    width: 1,
                                  ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor:
                              currentState == 4 ? primaryColor : Colors.grey,
                          radius: 17,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: currentState >= 4
                                ? const CircleAvatar(
                                    backgroundColor: primaryColor,
                                    radius: 8,
                                  )
                                : const SizedBox(
                                    height: 1,
                                    width: 1,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxHeight * .05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(text: 'Order Signed', size: 18),
                      CustomText(text: 'Lagos State, Nigeria', size: 14),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(text: 'Order Processed', size: 18),
                      CustomText(text: 'Lagos State, Nigeria', size: 14),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(text: 'Shipped', size: 18),
                      CustomText(text: 'Lagos State, Nigeria', size: 14),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(text: 'Out for delivery', size: 18),
                      CustomText(text: 'Edo State, Nigeria', size: 14),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      CustomText(text: 'Delivered', size: 18),
                      CustomText(text: 'Edo State, Nigeria', size: 14),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
