import 'package:cmms/app/app.dart';
// import 'package:cmms/app/preventive_maintanance/preventive.dart';
import 'package:cmms/breakdown_maintenance/breakdown_maintenance_controller.dart';
import 'package:cmms/new_permit/new_permit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../navigators/app_pages.dart';

class BreakdownMaintenanceScreen extends GetView<BreakdownMaintenanceController> {
  BreakdownMaintenanceScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;

    final double itemWidth = size.width / 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            SizedBox(height: 40,),
          if (Responsive.isMobile(context))
            Obx(
              () => Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    shadowColor: ColorValues.greyColor,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                           isExpanded: true,
                          value: controller.selectedFacility.value,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          elevation: 7,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? selectedValue) {
                            controller.isFacilitySelected.value = true;
                            controller.selectedFacility.value =
                                selectedValue ?? '';
                          },
                          items: controller.facilityList
                              .map<DropdownMenuItem<String>>((facility) {
                            return DropdownMenuItem<String>(
                              value: facility?.name ?? '',
                              child: Text(facility?.name ?? ''),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (Responsive.isDesktop(context))
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Breakdown Maintenance",
                style: TextStyle(
                    color: Color.fromARGB(255, 159, 156, 156),
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
            ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
            childAspectRatio: Responsive.isMobile(context)
                ? (itemWidth / itemHeight)
                : (itemWidth / itemHeightWeb),
            children: <Widget>[
              _priventiveList(
                  tittle: "Job List",
                  ontap: () {
                    controller.createChecklist();
                  }),
              _priventiveList(
                tittle: "New Permit",
                ontap: (){
                  controller.createNewPermit();
                }
                ),
              _priventiveList(
                tittle: "Permit List",
                ontap: (){
                  controller.newPermitList();
                }
                ),
              _priventiveList(tittle: "Job Card List"),
              // _priventiveList(tittle: "PM Schedule View"),
              // _priventiveList(tittle: "PM Report"),
              // _priventiveList(tittle: "PM Report"),
              // _priventiveList(tittle: "PM "),
            ],
          )
        ]),
      ),
    );
  }

  _priventiveList({required String tittle, Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 28, 187, 245),
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.all(9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                tittle,
                style: TextStyle(
                    color: ColorValues.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 245, 245),
                border: Border.all(
                  color: ColorValues.whiteColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.format_list_bulleted,
                size: 30,
                color: Color.fromARGB(255, 28, 187, 245),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
