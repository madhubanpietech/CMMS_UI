import 'package:clipboard/clipboard.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_swich_toggle.dart';
import '../../widgets/dropdown.dart';
import '../preventive_list_controller.dart';

class PreventiveChecklistListContentWeb
    extends GetView<PreventiveListController> {
  PreventiveChecklistListContentWeb({Key? key}) : super(key: key);
  final PreventiveListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
                    child: Text(" / PREVENTIVE MAINTENANCE",
                        style: Styles.greyMediumLight12),
                  ),
                  Text(" / CREATE CHECKLIST NUMBER",
                      style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.add == 0)
                              .length >
                          0
                      ? Container(
                          width: (Get.width * .3),
                          margin: EdgeInsets.only(left: 30, top: 30),
                          height: Get.height / 1.5,
                          child: Card(
                            color: Color.fromARGB(255, 251, 252, 253),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                // Text(
                                //     '${varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10, top: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Create Checklist",
                                          style: Styles.blackBold16,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Visibility(
                                          visible: controller.isSuccess.value,
                                          child: Center(
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  controller.selectedItem ==
                                                          null
                                                      ? "CheckList added Successfully in the List."
                                                      : "CheckList updated Successfully in the List.",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 24, 243, 123)),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRichText(title: 'CheckList:'),
                                            SizedBox(
                                              width: 70,
                                            ),
                                            Expanded(
                                              child: Container(
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      30,
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
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: LoginCustomTextfield(
                                                    textController: controller
                                                        .checklistNumberCtrlr,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRichText(
                                                title: 'Equipment Category: '),
                                            Expanded(
                                              child: Container(
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .2) -
                                                    35,
                                                child: DropdownWidget(
                                                  controller: controller,
                                                  dropdownList: controller
                                                      .equipmentCategoryList,
                                                  isValueSelected: controller
                                                      .isSelectedequipment
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedequipment.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRichText(
                                                title: 'Frequency: '),
                                            SizedBox(
                                              width: 64,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .2) -
                                                    30,
                                                child: DropdownWidget(
                                                  controller: controller,
                                                  dropdownList:
                                                      controller.frequencyList,
                                                  isValueSelected: controller
                                                      .isSelectedfrequency
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedfrequency.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Manpower: ",
                                              style: Styles.blackBold16,
                                            ),
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Expanded(
                                              child: Container(
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
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      30,
                                                  child: LoginCustomTextfield(
                                                    textController: controller
                                                        .manpowerCtrlr,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Duration(in Min.): ",
                                              style: Styles.blackBold16,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Container(
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
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      45,
                                                  child: LoginCustomTextfield(
                                                    textController: controller
                                                        .durationCtrlr,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ]),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 40,
                                        width: (Get.width * .1),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appRedColor,
                                            onPressed: () {},
                                            text: 'Cancel')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        width: (Get.width * .2) - 70,
                                        child: controller.selectedItem == null
                                            ? CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .createChecklistNumber()
                                                      .then((value) {
                                                    print("value,$value");
                                                    if (value == true)
                                                      controller
                                                          .issuccessCreatechecklist();
                                                  });
                                                },
                                                text: 'Create CheckList')
                                            : CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .updateChecklistNumber(
                                                          controller
                                                              .selectedItem?.id)
                                                      .then((value) {
                                                    print("value,$value");
                                                    if (value == true)
                                                      controller
                                                          .issuccessCreatechecklist();
                                                  });
                                                },
                                                text: 'Update')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.view == 0)
                              .length >
                          0
                      ? Expanded(
                          child: Container(
                            width: Get.width * 7,
                            margin: EdgeInsets.only(left: 10, top: 30),
                            height: Get.height,
                            child: Card(
                              color: Color.fromARGB(255, 251, 252, 253),
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
                                      "Check List",
                                      style: Styles.blackBold16,
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
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {
                                              FlutterClipboard.copy(controller
                                                      .preventiveCheckList![0]
                                                      .toString())
                                                  .then((value) {
                                                print("copy data");
                                              });
                                            },
                                            text: 'Copy'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'Excel'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'PDF'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'columnVisibility'.tr,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  controller.preventiveCheckList!.isEmpty
                                      ? Expanded(
                                          child: ScrollableTableView(
                                            columns: [
                                              "Checklist Id",
                                              "Checklist ",
                                              "Active Status ",
                                              "Category ",
                                              "Frequency ",
                                              "PM Manpower",
                                              "PM Duration(in Min.)",
                                              "Action",
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.16,
                                              );
                                            }).toList(),
                                            rows: [
                                              ...List.generate(
                                                controller.preventiveCheckList
                                                        ?.length ??
                                                    0,
                                                (index) {
                                                  return [
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
                                          ),
                                        )
                                      : Expanded(
                                          child: ScrollableTableView(
                                            paginationController:
                                                controller.paginationController,
                                            columns: [
                                              "Checklist Id",
                                              "Checklist",
                                              "Active Status ",
                                              "Category ",
                                              "Frequency ",
                                              "PM Manpower",
                                              "PM Duration(in Min.)",
                                              "Action"
                                            ].map((column) {
                                              return TableViewColumn(
                                                minWidth: Get.width * 0.12,
                                                label: column,
                                              );
                                            }).toList(),
                                            rows: //
                                                [
                                              ...List.generate(
                                                controller.preventiveCheckList
                                                        ?.length ??
                                                    0,
                                                (index) {
                                                  var preventiveCheckListModelListDetails =
                                                      controller
                                                              .preventiveCheckList?[
                                                          index];
                                                  return [
                                                    '${preventiveCheckListModelListDetails?.id}',

                                                    '${preventiveCheckListModelListDetails?.checklist_number}',
                                                    "No", //'${preventiveCheckListModelListDetails?.status ?? ''}',
                                                    '${preventiveCheckListModelListDetails?.category_name}',
                                                    '${preventiveCheckListModelListDetails?.frequency_name}',
                                                    '${preventiveCheckListModelListDetails?.manPower}',
                                                    '${preventiveCheckListModelListDetails?.duration}',
                                                    "Action"
                                                  ];
                                                },
                                              ),
                                            ].map((_preventiveCheckList) {
                                              return TableViewRow(
                                                  height: 60,
                                                  cells: _preventiveCheckList
                                                      .map((value) {
                                                    return TableViewCell(
                                                        child: (value == 'No')
                                                            ? CustomSwitchTroggle(
                                                                value: value ==
                                                                        'No'
                                                                    ? true
                                                                    : false,
                                                                onChanged:
                                                                    (value) {},
                                                              )
                                                            : (value ==
                                                                    "Action")
                                                                ? Wrap(
                                                                    children: [
                                                                        varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 0).length >
                                                                                0
                                                                            ? TableActionButton(
                                                                                color: ColorValues.appLightBlueColor,
                                                                                icon: Icons.edit,
                                                                                label: 'Edit',
                                                                                onPress: () {
                                                                                  controller.selectedItem = controller.preventiveCheckList!.firstWhere((element) => "${element?.id}" == _preventiveCheckList[0]);

                                                                                  controller.checklistNumberCtrlr.text = controller.selectedItem?.checklist_number ?? '';
                                                                                  controller.durationCtrlr.text = "${controller.selectedItem?.duration}";
                                                                                  controller.manpowerCtrlr.text = "${controller.selectedItem?.manPower}";
                                                                                  controller.selectedfrequency.value = controller.selectedItem?.frequency_name ?? "";
                                                                                  controller.selectedequipment.value = controller.selectedItem?.category_name ?? "";
                                                                                  controller.selectedEquipmentId = controller.selectedItem?.category_id ?? 0;
                                                                                  controller.selectedfrequencyId = controller.selectedItem?.frequency_id ?? 0;
                                                                                },
                                                                              )
                                                                            : Container(),
                                                                        varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.delete == 0).length >
                                                                                0
                                                                            ? TableActionButton(
                                                                                color: ColorValues.appRedColor,
                                                                                icon: Icons.delete,
                                                                                label: 'Delete',
                                                                                onPress: () {
                                                                                  print(_preventiveCheckList[0]);
                                                                                  controller.isDeleteDialog(checklist_id: _preventiveCheckList[0], checklist: _preventiveCheckList[1]);
                                                                                },
                                                                              )
                                                                            : Container()
                                                                      ])
                                                                : Text(
                                                                    value,
                                                                  ));
                                                  }).toList());
                                            }).toList(),
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: ValueListenableBuilder(
                                        valueListenable:
                                            controller.paginationController,
                                        builder: (context, value, child) {
                                          return Row(children: [
                                            Text(
                                                "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                                            Row(children: [
                                              IconButton(
                                                onPressed: controller
                                                            .paginationController
                                                            .currentPage <=
                                                        1
                                                    ? null
                                                    : () {
                                                        controller
                                                            .paginationController
                                                            .previous();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  color: controller
                                                              .paginationController
                                                              .currentPage <=
                                                          1
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: controller
                                                            .paginationController
                                                            .currentPage >=
                                                        controller
                                                            .paginationController
                                                            .pageCount
                                                    ? null
                                                    : () {
                                                        controller
                                                            .paginationController
                                                            .next();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: controller
                                                              .paginationController
                                                              .currentPage >=
                                                          controller
                                                              .paginationController
                                                              .pageCount
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
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
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
