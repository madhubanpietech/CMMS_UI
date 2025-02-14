import 'package:cmms/app/add_user/add_user_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../navigators/app_pages.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/dropdown.dart';

class AddUserContentWeb extends GetView<AddUserController> {
  AddUserContentWeb({Key? key}) : super(key: key);
  final AddUserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    ///
    Widget _rowItem(int? defaultValue, {required Function(bool) onCheck}) {
      return Checkbox(
          value: defaultValue == 1 ? true : false,
          checkColor: Colors.white,
          activeColor: ColorValues.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
              width: 1.0,
              color: ColorValues.blackColor,
            ),
          ),
          onChanged: (val) {
            controller.isChecked.value = val!;
            onCheck(val);
          });
    }

    return Obx(
      () => Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 227, 224, 224),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: ColorValues.greyLightColor,
                  ),
                  Text(
                    "DASHBOARD",
                    style: Styles.greyLight14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" / SETTING", style: Styles.greyMediumLight12),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(" / USER LIST",
                          style: Styles.greyMediumLight12)),
                  Text(" / ADD USER", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  //   margin: Dimens.edgeInsets20,
                  color: Color.fromARGB(255, 245, 248, 250),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              "Add User ",
                              style: Styles.blackBold16,
                            ),
                            Spacer(),
                            ActionButton(
                              icon: Icons.menu,
                              label: "User List",
                              onPressed: () {
                                controller.userId = 0;

                                Get.offNamed(Routes.userList);
                              },
                              color: ColorValues.greenlightColor,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Container(
                        margin: Dimens.edgeInsets20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 210,
                              child: Stack(
                                children: [
                                  controller.selectedImagePath.value.isNotEmpty
                                      ? GestureDetector(
                                          onTap: () => controller
                                              .getImage(ImageSource.gallery),
                                          child: Container(
                                            height: controller.thumbnailSize,
                                            width: controller.thumbnailSize,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.memory(
                                                controller
                                                    .selectedImageBytes.value,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: controller.thumbnailSize,
                                          width: controller.thumbnailSize,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 195, 192, 192),
                                            border: Border.all(
                                              color:
                                                  ColorValues.appLightGreyColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.image,
                                                size: 70,
                                                color: Color.fromARGB(
                                                    255, 215, 192, 141),
                                              ),
                                              Dimens.boxHeight10,
                                              Text("Upload Photo",
                                                  style:
                                                      Styles.greyMediumLight12)
                                            ],
                                          ),
                                        ),
                                  Positioned(
                                    top: 150,
                                    left: 100,
                                    right: 0,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          controller
                                              .getImage(ImageSource.gallery);
                                          // controller.pickFiles();
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            color: ColorValues.appDarkBlueColor,
                                            border: Border.all(
                                              color:
                                                  ColorValues.appDarkBlueColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 40,
                                              color: ColorValues.whiteColor,
                                            ), //Circ
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //     margin: Dimens.edgeInsets30_0_0_0,
                            //     child:
                            Dimens.boxWidth30,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    CustomRichText(title: 'Login ID: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield(
                                          ishint: 'Enter Email ID',
                                          textController:
                                              controller.loginIdCtrlr,
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Password: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield(
                                          ishint: 'Enter Password',
                                          textController:
                                              controller.passwordCtrlr,
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Last Name: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield(
                                          ishint: 'Enter Last Name',
                                          textController:
                                              controller.lastNameCtrlr,
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Gender: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: const Offset(
                                              5.0,
                                              5.0,
                                            ),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                          ),
                                          BoxShadow(
                                            color: ColorValues.whiteColor,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: controller.gender.value,
                                          onChanged: (value) =>
                                              controller.updateGender(value!),
                                          items: <String>[
                                            'Select Gender',
                                            'Male',
                                            'Female',
                                            'Other'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  value,
                                                  style: Styles.black15,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Mobile Number: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield(
                                          ishint: 'Enter Mobile Number',
                                          textController:
                                              controller.mobileNoCtrlr,
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Country: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.countryList,
                                        isValueSelected:
                                            controller.isSelectedCountry.value,
                                        selectedValue:
                                            controller.selectedCountry.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'City: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.cityList,
                                        isValueSelected:
                                            controller.isSelectedCity.value,
                                        selectedValue:
                                            controller.selectedCity.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Role: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.roleList,
                                        isValueSelected:
                                            controller.isSelectedRole.value,
                                        selectedValue:
                                            controller.selectedRole.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    CustomRichText(title: 'Secandory E-mail: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: Expanded(
                                          child: LoginCustomTextfield(
                                            ishint: 'Enter Email ID',
                                            textController:
                                                controller.secandoryIdCtrlr,
                                          ),
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'First Name: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield(
                                          ishint: 'Enter First Name',
                                          textController:
                                              controller.firstNameCtrlr,
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Date of Birth: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield(
                                          ishint: 'Enter Birth Date',
                                          textController: controller.dobCtrlr,
                                          ontap: () {
                                            _selectDate(context, 1);
                                          },
                                          widget: Icon(
                                            Icons.calendar_month,
                                            color: ColorValues.greyLightColor,
                                          ),
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Date of Joining: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield(
                                          ishint: 'Enter Date of Joining',
                                          textController:
                                              controller.joingdateCtrlr,
                                          ontap: () {
                                            _selectDate(context, 2);
                                          },
                                          widget: Icon(
                                            Icons.calendar_month,
                                            color: ColorValues.greyLightColor,
                                          ),
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Landline: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield(
                                          ishint: 'Enter Landline Number',
                                          textController:
                                              controller.landlineCtrlr,
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'State: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.stateList,
                                        isValueSelected:
                                            controller.isSelectedState.value,
                                        selectedValue:
                                            controller.selectedState.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(children: [
                                  CustomRichText(title: 'Zip Code: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: const Offset(
                                              5.0,
                                              5.0,
                                            ),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                          ),
                                          BoxShadow(
                                            color: ColorValues.whiteColor,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Enter Zip Code',
                                        textController: controller.zipcodeCtrlr,
                                      )),
                                ]),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Blood Group: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.bloodList,
                                        isValueSelected:
                                            controller.isSelectedBlood.value,
                                        selectedValue:
                                            controller.selectedBlood.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        // width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          children: [
                            Wrap(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: DefaultTabController(
                                        length: 3,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40)),
                                                color: Color.fromARGB(
                                                    255, 245, 248, 250),
                                              ),
                                              child: TabBar(
                                                labelPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                labelColor: Colors.black,
                                                indicator: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  40),
                                                          topRight:
                                                              Radius.circular(
                                                                  40)),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: const Offset(
                                                        1.0,
                                                        1.0,
                                                      ),
                                                      blurRadius: 5.0,
                                                    ),
                                                    BoxShadow(
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                ),
                                                unselectedLabelColor:
                                                    Colors.black,
                                                tabs: [
                                                  Tab(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons
                                                            .analytics_outlined),
                                                        Dimens.boxWidth5,
                                                        Text('Plant Access'),
                                                      ],
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons
                                                            .account_tree_outlined),
                                                        Dimens.boxWidth5,
                                                        Text(
                                                          'Access Level',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons
                                                            .notifications),
                                                        Dimens.boxWidth5,
                                                        Text(
                                                          'Notification',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: Get.height + 50,

                                              //  height: 500,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40)),
                                                color: Color.fromARGB(
                                                    255, 245, 248, 250),
                                              ),
                                              child: TabBarView(children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        color: ColorValues
                                                            .whiteColor),
                                                    child: Column(
                                                      children: [Text('1 Tab')],
                                                    )),
                                                Column(
                                                  children: [
                                                    Container(
                                                        color: ColorValues
                                                            .whiteColor,
                                                        child: Container(
                                                            height:
                                                                Get.height - 30,
                                                            margin: Dimens
                                                                .edgeInsets15,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: ColorValues
                                                                    .lightGreyColorWithOpacity35,
                                                                width: 1,
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: ColorValues
                                                                      .appBlueBackgroundColor,
                                                                  spreadRadius:
                                                                      2,
                                                                  blurRadius: 5,
                                                                  offset:
                                                                      Offset(
                                                                          0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            child: controller
                                                                        .accesslevel
                                                                        .length >
                                                                    0
                                                                ? ScrollableTableView(
                                                                    columns: [
                                                                      "Module Name",
                                                                      "Add",
                                                                      "Edit",
                                                                      "Delete",
                                                                      "View",
                                                                      "Issue",
                                                                      "Approve",
                                                                      "Self View"
                                                                    ].map(
                                                                        (column) {
                                                                      return TableViewColumn(
                                                                        label:
                                                                            column,
                                                                        // width:
                                                                        //     115, // Set the width of the column to 100

                                                                        minWidth:
                                                                            Get.width *
                                                                                0.085,
                                                                      );
                                                                    }).toList(),
                                                                    rows: true
                                                                        ? controller
                                                                            .accesslevel
                                                                            .map((getAccesslevelDetails) =>
                                                                                TableViewRow(height: 90, cells: [
                                                                                  TableViewCell(
                                                                                    child: Obx(() {
                                                                                      return Row(
                                                                                        children: [
                                                                                          Checkbox(
                                                                                              value: controller.isCheckedmodule.value,
                                                                                              checkColor: Colors.white,
                                                                                              activeColor: ColorValues.blackColor,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                                              ),
                                                                                              side: MaterialStateBorderSide.resolveWith(
                                                                                                (states) => BorderSide(
                                                                                                  width: 1.0,
                                                                                                  color: ColorValues.blackColor,
                                                                                                ),
                                                                                              ),
                                                                                              onChanged: (val) {
                                                                                                controller.accesslevel.firstWhere((e) => e?.feature_name == getAccesslevelDetails?.feature_name);
                                                                                                controller.isCheckedmodule.value = val!;

                                                                                                controller.update();
                                                                                              }),
                                                                                          Dimens.boxWidth5,
                                                                                          Expanded(child: Text("${getAccesslevelDetails?.feature_name}"))
                                                                                        ],
                                                                                      );
                                                                                    }),
                                                                                  ),
                                                                                  TableViewCell(
                                                                                    child: Obx(() {
                                                                                      return _rowItem(getAccesslevelDetails?.add.value, onCheck: (val) {
                                                                                        getAccesslevelDetails?.add.value = val == true ? 1 : 0;
                                                                                      });
                                                                                    }),
                                                                                  ),
                                                                                  TableViewCell(
                                                                                    child: Obx(() {
                                                                                      return _rowItem(getAccesslevelDetails?.edit.value, onCheck: (val) {
                                                                                        getAccesslevelDetails?.edit.value = val == true ? 1 : 0;
                                                                                      });
                                                                                    }),
                                                                                  ),
                                                                                  TableViewCell(child: Obx(() {
                                                                                    return _rowItem(getAccesslevelDetails?.delete.value, onCheck: (val) {
                                                                                      getAccesslevelDetails?.delete.value = val == true ? 1 : 0;
                                                                                    });
                                                                                  })),
                                                                                  TableViewCell(child: Obx(() {
                                                                                    return _rowItem(getAccesslevelDetails?.view.value, onCheck: (val) {
                                                                                      getAccesslevelDetails?.view.value = val == true ? 1 : 0;
                                                                                    });
                                                                                  })),
                                                                                  TableViewCell(child: Obx(() {
                                                                                    return _rowItem(getAccesslevelDetails?.issue.value, onCheck: (val) {
                                                                                      getAccesslevelDetails?.issue.value = val == true ? 1 : 0;
                                                                                    });
                                                                                  })),
                                                                                  TableViewCell(child: Obx(() {
                                                                                    return _rowItem(getAccesslevelDetails?.approve.value, onCheck: (val) {
                                                                                      getAccesslevelDetails?.approve.value = val == true ? 1 : 0;
                                                                                    });
                                                                                  })),
                                                                                  TableViewCell(child: Obx(() {
                                                                                    return _rowItem(getAccesslevelDetails?.selfView.value, onCheck: (val) {
                                                                                      getAccesslevelDetails?.selfView.value = val == true ? 1 : 0;
                                                                                    });
                                                                                  })),
                                                                                ]))
                                                                            .toList()
                                                                        : [],
                                                                  )
                                                                : Container())),
                                                  ],
                                                ),
                                                Container(
                                                    decoration: BoxDecoration(
                                                        color: ColorValues
                                                            .whiteColor),
                                                    child: Column(
                                                      children: [Text('3 Tab')],
                                                    )),
                                              ]),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.userId == null
                                ? Container(
                                    height: 35,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.greenColor,
                                      text: 'Submit',
                                      onPressed: () {
                                        controller.addUser();
                                        //  controller.saveAccessLevel();
                                      },
                                    ),
                                  )
                                : Container(
                                    height: 35,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appDarkBlueColor,
                                      text: 'Update',
                                      onPressed: () {
                                        controller.updateUser().then((value) {
                                          if (value == true) {
                                            controller.userId = 0;
                                            controller.saveAccessLevel();
                                          }
                                        });
                                        //  controller.saveAccessLevel();
                                      },
                                    ),
                                  ),
                            Dimens.boxWidth20,
                            Container(
                              height: 35,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.redColor,
                                text: "Cancel",
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, int type) async {
    DateTime today = DateTime.now();
    var date = await showDatePicker(
      context: context,
      cancelText: "Clear",
      confirmText: "Ok",
      initialDate: DateTime(today.year - 18, today.month, today.day),
      firstDate: DateTime(1900),
      lastDate: DateTime(today.year - 18, today.month, today.day),
    );
    if (type == 1) {
      controller.dobCtrlr.text = date.toString().substring(0, 10);
    } else {
      controller.joingdateCtrlr.text = date.toString().substring(0, 10);
    }
  }
}
