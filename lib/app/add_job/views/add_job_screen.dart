import 'package:cmms/app/add_job/views/mobile/add_job_content_mobile.dart';
import 'package:cmms/app/add_job/views/web/add_job_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../add_job_controller.dart';
import '../../widgets/dropdown.dart';

class AddJobScreen extends GetView<AddJobController> {
  AddJobScreen({Key? key}) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Job'),
        centerTitle: true,
      ),
      body:
          //
          Row(children: [
        (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? Dimens.box0
            :
            //
            HomeDrawer(),

        /// CONTENT
        Obx(
          () => //
              Expanded(
            child: Container(
              height: double.infinity,
              margin: Dimens.edgeInsets10_0_10_0,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  //
                  children: [
                    /// SELECT PLANT DropDown
                    Row(
                        //
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Select Plant:',
                            ),
                          ),
                          Expanded(
                            child: DropdownWidget(
                              dropdownList: controller.facilityList,
                              isValueSelected:
                                  controller.isFacilitySelected.value,
                              selectedValue: controller.selectedFacility.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ]),
                    Dimens.boxHeight20,

                    /// CARD
                    Container(
                      child: Expanded(
                        child: Card(
                          color: ColorValues.appLightGreyColor,
                          elevation: 20,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding: Dimens.edgeInsets10,
                              child: (() {
                                if (Responsive.isMobile(context)) {
                                  return //
                                      AddJobContentMobile();
                                } //
                                else if (Responsive.isDesktop(context)) {
                                  return //
                                      AddJobContentWeb();
                                }
                              }())
                              //
                              ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );

    ///build ends
  }

  /// class ends
}
