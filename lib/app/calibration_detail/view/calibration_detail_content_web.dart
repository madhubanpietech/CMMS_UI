import 'package:cmms/app/calibration_detail/calibration_detail_controller.dart';
import 'package:cmms/app/home/home.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_textField.dart';

class CalibrationDetailContentWeb extends GetView<CalibrationDetailController> {
  CalibrationDetailContentWeb({super.key});

  ///
  var controller = Get.find<CalibrationDetailController>();
  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: Text(" / CALIBRATION LIST",
                    style: Styles.greyMediumLight12),
              ),
              Text(
                " / CALIBRATION VIEW",
                style: Styles.greyMediumLight12,
              ),
            ],
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Obx(
              () => Container(
                margin: EdgeInsets.all(20),
                child: Card(
                  color: Color.fromARGB(255, 245, 248, 250),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Calibration Details",
                          style: Styles.blackBold16,
                        ),
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Equipment Name:",
                                  style: Styles.blackBold15,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.8,
                                  child: LoginCustomTextfield(),

                                  // DropdownWidget(
                                  //   dropdownList: controller.inventoryNameList,
                                  //   isValueSelected:
                                  //       controller.isInventorySelected.value,
                                  //   selectedValue: controller.selectedInventory.value,
                                  //   onValueChanged: controller.onValueChanged,
                                  // ),
                                ),
                                Dimens.boxWidth10,
                                Text(
                                  "Equipment Category:",
                                  style: Styles.blackBold15,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.8,
                                  child:
                                      // DropdownWidget(
                                      //   dropdownList: controller.inventoryNameList,
                                      //   isValueSelected:
                                      //       controller.isInventorySelected.value,
                                      //   selectedValue: controller.selectedInventory.value,
                                      //   onValueChanged: controller.onValueChanged,
                                      // ),

                                      LoginCustomTextfield(),
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Serial No.:",
                                  style: Styles.blackBold15,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.8,
                                  child: LoginCustomTextfield(),
                                ),
                                Dimens.boxWidth10,
                                Text(
                                  "Last Calibration Date:",
                                  style: Styles.blackBold15,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.8,
                                  child: LoginCustomTextfield(
                                    textController: controller
                                        .lastCalibrationDateController,
                                    ontap: () {
                                      _selectDate(context, 1);
                                    },
                                    widget: Icon(
                                      Icons.calendar_month,
                                      color: ColorValues.greyLightColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            Row(
                              children: [
                                Text(
                                  "Vender Name:",
                                  style: Styles.blackBold15,
                                ),
                                Dimens.boxWidth10,
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.8,
                                  child: LoginCustomTextfield(),
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomRichText(title: "Calibration Done Date"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.8,
                                  child: LoginCustomTextfield(
                                    textController: controller
                                        .calibrationDaneDateController,
                                    ontap: () {
                                      _selectDate(context, 2);
                                    },
                                    widget: Icon(
                                      Icons.calendar_month,
                                      color: ColorValues.greyLightColor,
                                    ),
                                  ),
                                ),
                                Dimens.boxWidth10,
                                CustomRichText(title: "Recieved date:"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.8,
                                  child: LoginCustomTextfield(
                                    textController:
                                        controller.recievedDateController,
                                    ontap: () {
                                      _selectDate(context, 3);
                                    },
                                    widget: Icon(
                                      Icons.calendar_month,
                                      color: ColorValues.greyLightColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            Row(
                              children: [
                                Text(
                                  "Calibration Certificates:",
                                  style: Styles.blackBold15,
                                ),
                                Dimens.boxWidth10,
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 6,
                                  child: LoginCustomTextfield(),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: CustomElevatedButton(
                                    text: "Choose Files",
                                    onPressed: () {},
                                    backgroundColor:
                                        ColorValues.appDarkBlueColor,
                                    textColor: ColorValues.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            _tabledata(),
                            Dimens.boxHeight10,
                            Row(
                              children: [
                                Text(
                                  "Any Damages:",
                                  style: Styles.blackBold15,
                                ),
                                Dimens.boxWidth10,
                                Transform.scale(
                                  scale: .8,
                                  child: Switch.adaptive(
                                      activeColor: ColorValues.appGreenColor,
                                      value: controller.isToggleOn.value,
                                      onChanged: (value) {
                                        controller.toggle();
                                      }),
                                ),
                              ],
                            ),
                            Text(
                              "Equipment Image:",
                              style: Styles.blackBold15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 200,
                              child: Files(),
                            ),
                            Dimens.boxHeight60,
                            Row(
                              children: [
                                Text(
                                  "Remarks:",
                                  style: Styles.blackBold15,
                                ),
                                Dimens.boxWidth10,
                                Container(
                                  width: (Get.width * .5),
                                  decoration: BoxDecoration(
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
                                    color: ColorValues.whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        fillColor: ColorValues.whiteColor,
                                        filled: true,
                                        contentPadding: Dimens.edgeInsets05_10,
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight60,
                            Container(
                              margin: EdgeInsets.only(bottom: 40, top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 35,
                                    width: (Get.width * .2) - 90,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.redColor,
                                      text: "Cancel",
                                      onPressed: () {},
                                    ),
                                  ),
                                  Dimens.boxWidth20,
                                  Container(
                                    height: 35,
                                    width: (Get.width * .2) - 90,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appGreenColor,
                                      text: "Submit",
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
      controller.lastCalibrationDateController.text =
          date.toString().substring(0, 10);
    } else if (type == 2) {
      controller.calibrationDaneDateController.text =
          date.toString().substring(0, 10);
    } else {
      controller.recievedDateController.text = date.toString().substring(0, 10);
    }
  }

  _tabledata() {
    return Container(
      height: 200,
      width: Get.width,
      margin: Dimens.edgeInsets16,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 227, 224, 224),
          width: 1,
        ),
      ),
      child: ScrollableTableView(
        columns: [
          "#",
          "Name",
          "Upload Progess",
          "Document Category",
          "Status",
          "Remove",
        ].map((column) {
          return TableViewColumn(
            minWidth: Get.width * 0.12,
            label: column,
          );
        }).toList(),
        rows: [
          [
            "1",
            "Test.png",
            "20.00",
            "sdvf",
            "sfv",
            "remove",
          ],
          [
            "1",
            "Test.png",
            "20.00",
            "sdvf",
            "sfv",
            "remove",
          ],
        ].map((record) {
          return TableViewRow(
            height: 60,
            cells: record.map((value) {
              if (value == 'remove')
                return TableViewCell(
                  child: Icon(Icons.delete),
                );
              return TableViewCell(
                child: Text(value),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
