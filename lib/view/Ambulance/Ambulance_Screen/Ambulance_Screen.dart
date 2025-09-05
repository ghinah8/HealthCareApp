import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/modle/createAmbulanceorder.dart';
import 'package:healthcare/service/link.dart';
import 'package:healthcare/view/Ambulance/Amblance_controller/Ambulance_controller.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/custom_searchbar.dart';
import 'package:latlong2/latlong.dart';

import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';

class AmbulanceScreen extends StatelessWidget {
  AmbulanceScreen({super.key});
  final AmbulanceController controller = Get.put(AmbulanceController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 48.0),
            child: Text(
              'Ambulance',
              style: FontStyles.pharmacy,
            ),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
      body: GetBuilder(
        init: AmbulanceController(),
        builder: (controller) {
          return Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(36.211310, 37.111459),
                  initialZoom: 13,
                  maxZoom: 18,
                  minZoom: 10,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(36.211310, 37.111459),
                        child: Icon(
                          Icons.location_on,
                          color: Mycolor.redcolor,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 12),
                    child: CustomSearchBar(
                      backgroundcolor: Mycolor.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 20),
                    child: Container(
                      width: 390,
                      height: 250,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Mycolor.grey.withAlpha(120),
                            blurRadius: 300,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                        color: Mycolor.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Confirm your address',
                            style: FontStyles.confirmyouraddress,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Mycolor.redcolor,
                                size: 40,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Flat No. 50, Mahalaxmi Shop, Upkaar, 36, Barpokhar (E), Siwan, Bihar, Pincode-880212',
                                  style: FontStyles.address,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          ButtonCustom(
                            textbutton: 'Confirm Location',
                            colorbutton: Mycolor.lightblue,
                            hieght: 60,
                            width: 250,
                            textstyel: FontStyles.buy,
                            onpressed: () {
                              Get.dialog(
                                Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: SizedBox(
                                    height: 400,
                                    width: 300,
                                    child: GetBuilder<AmbulanceController>(
                                      builder: (controller) {
                                        if (controller.isLoading) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }

                                        if (controller.ambulanceCar.isEmpty) {
                                          return const Center(
                                            child:
                                                Text("No ambulances available"),
                                          );
                                        }

                                        return Column(
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: controller
                                                    .ambulanceCar.length,
                                                itemBuilder: (context, index) {
                                                  final ambulance = controller
                                                      .ambulanceCar[index];
                                                  final isSelected = controller
                                                          .selectedAmbulance ==
                                                      ambulance;

                                                  return GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .selectAmbulance(
                                                              ambulance);
                                                    },
                                                    child: Card(
                                                      color: isSelected
                                                          ? Colors.blue.shade100
                                                          : Colors.white,
                                                      child: ListTile(
                                                        leading: Image.network(
                                                          AppLink.fixImageUrl(
                                                              ambulance.image),
                                                          width: 50,
                                                          height: 50,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        title: Text(
                                                          ambulance.name,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text.rich(
                                                              TextSpan(
                                                                children: [
                                                                  const TextSpan(
                                                                      text:
                                                                          "Phone Number: "),
                                                                  TextSpan(
                                                                    text: ambulance
                                                                        .phoneNumber,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text.rich(
                                                              TextSpan(
                                                                children: [
                                                                  const TextSpan(
                                                                      text:
                                                                          "Car Model: "),
                                                                  TextSpan(
                                                                    text: ambulance
                                                                        .name,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text.rich(
                                                              TextSpan(
                                                                children: [
                                                                  const TextSpan(
                                                                      text:
                                                                          "Price: "),
                                                                  TextSpan(
                                                                    text:
                                                                        "${ambulance.price}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, top: 8),
                                              child: ButtonCustom(
                                                textbutton: 'Ok',
                                                colorbutton: Mycolor.lightblue,
                                                hieght: 40,
                                                width: 60,
                                                textstyel: FontStyles.buy,
                                                onpressed: () {
                                                  if (controller
                                                          .selectedAmbulance !=
                                                      null) {
                                                    final now = DateTime.now();

                                                    // تنسيق الوقت على شكل HH:mm
                                                    final startHour =
                                                        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
                                                    final end = now.add(
                                                        const Duration(
                                                            minutes: 5));
                                                    final endHour =
                                                        "${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}";

                                                    final order =
                                                        CreateAmbulanceOrder(
                                                      ambulance: controller
                                                          .selectedAmbulance!
                                                          .id,
                                                      address: "Aleppo, Syria",
                                                      startHour: startHour,
                                                      endHour: endHour,
                                                    );

                                                    controller
                                                        .createAmbulanceOrder(
                                                            order);

                                                    // ⬅️ سكر الديالوغ بعد الضغط
                                                    Get.back();
                                                  } else {
                                                    Get.snackbar("Error",
                                                        "Please select an ambulance first");
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class information extends StatelessWidget {
  information({
    required this.text,
    required this.info,
    required this.iconcolor,
    required this.icon,
  });

  final String text;
  final String info;
  final Color iconcolor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconcolor),
        const SizedBox(width: 5),
        Text('$text : ', style: FontStyles.information),
        Text(info, style: FontStyles.information),
      ],
    );
  }
}
