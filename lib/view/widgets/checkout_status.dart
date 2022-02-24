import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CheckoutStatus extends StatelessWidget {
  CheckoutStatus({Key? key,required this.currentState}) : super(key: key);
  int currentState;
  final Color outLineColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 34,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*.4,
                        height: 2,
                        color: currentState>=1?primaryColor: Colors.grey,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*.4,
                        height: 2,
                        color: currentState>=2?primaryColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: currentState==0? primaryColor: Colors.grey,
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: const CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 8,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: currentState==1? primaryColor: Colors.grey,
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: currentState>=1?const CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 8,
                        ):const SizedBox(height: 1,width: 1,),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: currentState==2? primaryColor: Colors.grey,
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: currentState>= 2? const CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 8,
                        ):const SizedBox(height: 1,width: 1,),
                      ),
                    ),
                  ],
                )
                ,
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
        const [
          CustomText(text: 'Delivery', size: 14),
          CustomText(text: 'Address', size: 14),
          CustomText(text: 'Summary', size: 14),
        ],),
      ],
    );
  }
}
