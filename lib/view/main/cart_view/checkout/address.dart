import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.check_circle,color: primaryColor,),
              CustomText(
                  text: 'Billing address is the same as delivery address',
                  size: 14),
            ],
          ),
          CustomTextFormField(
            onSaved: (value) {},
            validator: (value) {},
            text: 'Street 1',
            keyboardType: TextInputType.text,
            initialValue: '21, Alex Davidson Avenue',
          ),
          CustomTextFormField(
            onSaved: (value) {},
            validator: (value) {},
            text: 'Street 2',
            keyboardType: TextInputType.text,
            initialValue: 'Opposite Omegatron, Vicent Quarters',
          ),
          CustomTextFormField(
            onSaved: (value) {},
            validator: (value) {},
            text: 'City',
            keyboardType: TextInputType.text,
            initialValue: 'Victoria Island',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*.42,
                child: CustomTextFormField(
                  onSaved: (value) {},
                  validator: (value) {},
                  text: 'State',
                  keyboardType: TextInputType.text,
                  initialValue: 'Lagos State',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*.42,
                child: CustomTextFormField(
                  onSaved: (value) {},
                  validator: (value) {},
                  text: 'Country',
                  keyboardType: TextInputType.text,
                  initialValue: 'Nigeria',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
