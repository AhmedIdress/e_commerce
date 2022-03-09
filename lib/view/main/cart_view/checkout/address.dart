import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/checkout_view_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder:(controller)=> Expanded(
        child: Form(
          key: controller.formState,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 420,
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
                    onSaved: (value) {
                      controller.address['street1']=value!;
                    },
                    validator: (value) {
                      if(value==null)
                        {
                          return 'can\'t be null';
                        }else if(value=='21, Alex Davidson Avenue')
                          {
                            return 'enter your street 1';
                          }
                    },
                    text: 'Street 1',
                    keyboardType: TextInputType.text,
                    initialValue: '21, Alex Davidson Avenue',
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      controller.address['street2']=value!;
                    },
                    validator: (value) {
                      if(value==null)
                      {
                        return 'can\'t be null';
                      }else if(value=='Opposite Omegatron, Vicent Quarters')
                      {
                        return 'enter your street 2';
                      }
                    },
                    text: 'Street 2',
                    keyboardType: TextInputType.text,
                    initialValue: 'Opposite Omegatron, Vicent Quarters',
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      controller.address['city']=value!;
                    },
                    validator: (value) {
                      if(value==null)
                      {
                        return 'can\'t be null';
                      }else if(value=='Victoria Island')
                      {
                        return 'enter your city';
                      }
                    },
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
                          onSaved: (value) {
                            controller.address['state']=value!;
                          },
                          validator: (value) {
                            if(value==null)
                            {
                              return 'can\'t be null';
                            }else if(value=='Lagos State')
                            {
                              return 'enter your state';
                            }
                          },
                          text: 'State',
                          keyboardType: TextInputType.text,
                          initialValue: 'Lagos State',
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.42,
                        child: CustomTextFormField(
                          onSaved: (value) {
                            controller.address['country']=value!;
                          },
                          validator: (value) {
                            if(value==null)
                            {
                              return 'can\'t be null';
                            }else if(value=='Nigeria')
                            {
                              return 'enter your country';
                            }
                          },
                          text: 'Country',
                          keyboardType: TextInputType.text,
                          initialValue: 'Nigeria',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
