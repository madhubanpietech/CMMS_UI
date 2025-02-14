import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/utils.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/table_action_button.dart';
import '../calibration_list_controller.dart';

class CalibrationListContentWeb extends GetView<CalibrationListController> {
  CalibrationListContentWeb({super.key});

  ///
  var controller = Get.find<CalibrationListController>();
  List<String> filterdata = ["SetUp", "Close", "cpmplete", "pending"];
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
            ],
          ),
        ),
        Flexible(
          child: Obx(
            () => Container(
              width: Get.width * 7,
              margin: EdgeInsets.only(left: 10, top: 30),
              height: Get.height,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Calibration List",
                            style: Styles.blackBold16,
                          ),
                          GestureDetector(
                            onTap: () {
                              _filterDialog();
                            },
                            child: Icon(
                              Icons.filter_alt_rounded,
                              color: ColorValues.lightGreyTextColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorValues.greyLightColour,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                              backgroundColor: ColorValues.appLightBlueColor,
                              onPressed: () {},
                              text: 'Copy'),
                        ),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                              backgroundColor: ColorValues.appLightBlueColor,
                              onPressed: () {},
                              text: 'Excel'),
                        ),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                              backgroundColor: ColorValues.appLightBlueColor,
                              onPressed: () {},
                              text: 'PDF'),
                        ),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'columnVisibility'.tr,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 200,
                          height: 40,
                          margin: Dimens.edgeInsets0_0_16_0,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                              ),
                              contentPadding: Dimens.edgeInsets10_0_0_0,
                              hintText: 'search'.tr,
                              hintStyle: Styles.grey12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        margin: Dimens.edgeInsets15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorValues.appBlueBackgroundColor,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: controller.calibrationList!.isEmpty
                            ? ScrollableTableView(
                                columns: [
                                  "Equipment Category",
                                  "Equipment Name",
                                  "Serial No.",
                                  "Calibration Certificates",
                                  "Installation date",
                                  "Last Calibration date",
                                  "Next Due Date",
                                  "Calibration Frequency",
                                  "Status",
                                  "Action",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.16,
                                  );
                                }).toList(),
                                rows: [
                                  ...List.generate(
                                    controller.calibrationList?.length ?? 0,
                                    (index) {
                                      return [
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                      ];
                                    },
                                  ),
                                ].map((record) {
                                  return TableViewRow(
                                    height: 60,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              )
                            : ScrollableTableView(
                                paginationController:
                                    controller.paginationController,
                                columns: [
                                  "Equipment Category",
                                  "Equipment Name",
                                  "Serial No.",
                                  "Calibration Certificates",
                                  "Installation date",
                                  "Last Calibration date",
                                  "Next Due Date",
                                  "Calibration Frequency",
                                  "Status",
                                  "Action",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.15,
                                  );
                                }).toList(),
                                rows: [
                                  ...List.generate(
                                    controller.calibrationList?.length ?? 0,
                                    (index) {
                                      var calibrationListListDetails =
                                          controller.calibrationList?[index];
                                      return [
                                        '${calibrationListListDetails?.category_name}',
                                        '${calibrationListListDetails?.asset_name}',
                                        '123566',
                                        "calibration_certificate",
                                        'Installation Date',
                                        '${calibrationListListDetails?.last_calibration_date}',
                                        "Next deu date",
                                        'Day',
                                        '${calibrationListListDetails?.calibration_status}',
                                        "Action"
                                      ];
                                    },
                                  ),
                                ].map((record) {
                                  return TableViewRow(
                                    height: 100,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: (value == "Action")
                                            ? Wrap(children: [
                                                TableActionButton(
                                                  color: ColorValues
                                                      .lightGreenColor,
                                                  label: 'Start Calibration',
                                                  onPress: () {
                                                    startCalibration(
                                                        equipmentName:
                                                            record[1],
                                                        previousDate: record[5],
                                                        nextDate: "04-04-2023");
                                                  },
                                                ),
                                                TableActionButton(
                                                  color: ColorValues
                                                      .appDarkBlueColor,
                                                  icon: Icons
                                                      .remove_red_eye_outlined,
                                                  label: 'View',
                                                  onPress: () {
                                                    Get.toNamed(Routes
                                                        .calibrationDetail);
                                                  },
                                                ),
                                                TableActionButton(
                                                  color:
                                                      ColorValues.appRedColor,
                                                  icon: Icons.delete,
                                                  label: 'Delete',
                                                  onPress: () {},
                                                ),
                                                TableActionButton(
                                                  color: ColorValues
                                                      .appLightBlueColor,
                                                  icon: Icons
                                                      .access_time_filled_outlined,
                                                  label: 'History',
                                                  onPress: () {
                                                    controller
                                                        .calibrationHistory();
                                                  },
                                                ),
                                                TableActionButton(
                                                  color:
                                                      ColorValues.appRedColor,
                                                  icon: Icons.close,
                                                  label: 'Reject',
                                                  onPress: () {},
                                                ),
                                                // TableActionButton(
                                                //   color: ColorValues.appRedColor,
                                                //   icon: Icons.close,
                                                //   label: 'Completed',
                                                //   onPress: () {},
                                                // ),
                                                TableActionButton(
                                                  color: ColorValues
                                                      .lightGreenColor,
                                                  icon: Icons.check,
                                                  label: 'Approve',
                                                  onPress: () {},
                                                ),
                                              ])
                                            : (value == "Status")
                                                ? Container(
                                                    padding: Dimens
                                                        .edgeInsets8_2_8_2,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 213, 46, 40),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Text(
                                                      "Overdue",
                                                      style: Styles.white13
                                                          .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                    ))
                                                : (value ==
                                                        "calibration_certificate")
                                                    ? TableActionButton(
                                                        color: ColorValues
                                                            .appDarkBlueColor,
                                                        icon: Icons
                                                            .remove_red_eye_outlined,
                                                        label: 'View',
                                                        onPress: () {},
                                                      )
                                                    : Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ValueListenableBuilder(
                          valueListenable: controller.paginationController,
                          builder: (context, value, child) {
                            return Row(children: [
                              Text(
                                  "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                              Row(children: [
                                IconButton(
                                  onPressed: controller.paginationController
                                              .currentPage <=
                                          1
                                      ? null
                                      : () {
                                          controller.paginationController
                                              .previous();
                                        },
                                  iconSize: 20,
                                  splashRadius: 20,
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: controller.paginationController
                                                .currentPage <=
                                            1
                                        ? Colors.black26
                                        : Theme.of(context).primaryColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: controller.paginationController
                                              .currentPage >=
                                          controller
                                              .paginationController.pageCount
                                      ? null
                                      : () {
                                          controller.paginationController
                                              .next();
                                        },
                                  iconSize: 20,
                                  splashRadius: 20,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: controller.paginationController
                                                .currentPage >=
                                            controller
                                                .paginationController.pageCount
                                        ? Colors.black26
                                        : Theme.of(context).primaryColor,
                                  ),
                                ),
                              ]),
                            ]);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void startCalibration(
      {required String equipmentName,
      required String previousDate,
      required String nextDate}) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Row(
            children: [
              Text(
                'Asset Calibration',
                textAlign: TextAlign.center,
                style: Styles.blackBold20,
              ),
              Text(
                ': ${equipmentName}',
                textAlign: TextAlign.center,
                style: Styles.black18,
              ),
            ],
          ),
        ],
      ),
      content: Builder(builder: (context) {
        var height = Get.height;
        String preDate = Utility.getFormatedDate(previousDate);
        controller.previousDateController.text = preDate;
        controller.nextDueDateController.text = nextDate;

        return Obx(
          () => Container(
            margin: Dimens.edgeInsets15,
            padding: Dimens.edgeInsets25,
            height: height / 2.3,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorValues.appBlueBackgroundColor,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorValues.appBlueBackgroundColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Previous Calibration"),
                          Text("                         Date:"),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: const Offset(
                                  2.0,
                                  3.0,
                                ),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: Get.width / 5,
                          child: LoginCustomTextfield(
                            textController: controller.previousDateController,
                            ontap: () {
                              _selectDate(context, 1);
                            },
                            widget: Icon(
                              Icons.calendar_month,
                              color: ColorValues.greyLightColor,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Due Date For Next"),
                          Text("             Calibration:"),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: const Offset(
                                  2.0,
                                  3.0,
                                ),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: Get.width / 5,
                          child: LoginCustomTextfield(
                            textController: controller.nextDueDateController,
                            ontap: () {
                              _selectDate(context, 2);
                            },
                            widget: Icon(
                              Icons.calendar_month,
                              color: ColorValues.greyLightColor,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vender Name :"),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                2.0,
                                3.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          color: ColorValues.whiteColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: Get.width / 5,
                        child: DropdownWidget(
                          dropdownList: controller.venderNameList,
                          isValueSelected:
                              controller.isVenderNameSelected.value,
                          selectedValue: controller.selectedVender.value,
                          onValueChanged: controller.onValueChanged,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomElevatedButton(
                          text: "Cancel",
                          onPressed: () {
                            Get.back();
                          },
                          backgroundColor: ColorValues.appRedColor,
                          textColor: ColorValues.whiteColor,
                        ),
                        Dimens.boxWidth10,
                        CustomElevatedButton(
                          text: "Start",
                          onPressed: () {},
                          backgroundColor: ColorValues.appGreenColor,
                          textColor: ColorValues.whiteColor,
                        ),
                        Dimens.boxWidth10,
                      ]),
                ]),
          ),
        );
      }),
      actions: [],
    ));
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
      controller.previousDateController.text = date.toString().substring(0, 10);
    } else {
      controller.nextDueDateController.text = date.toString().substring(0, 10);
    }
  }
}

_filterDialog() {
  return Get.dialog(
    Stack(
      children: [
        Positioned(
          right: 1,
          top: 170,
          child: Container(
            width: Get.width / 2.5,
            //  margin: EdgeInsets.all(10),
            child: AlertDialog(
              // insetPadding: Dimens.edgeInsets10_0_10_0,
              contentPadding: EdgeInsets.only(bottom: 30),
              backgroundColor: ColorValues.appBlueBackgroundColor,
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(),
                      Text(
                        "Filter",
                        style: Styles.blackBold16,
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: ColorValues.lightGreyColor,
                  ),
                  Wrap(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        _filterText("Rejected"),
                        _filterText("Complete"),
                        _filterText("Waiting for Approval"),
                        _filterText("Approved to dispatch"),
                        _filterText("Waiting for final Approval"),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

_filterText(String text) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
    child: Padding(
      padding: const EdgeInsets.all(7.0),
      child: Text(text),
    ),
  );
}
