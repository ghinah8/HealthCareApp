import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/view/Ambulance/Amblance_controller/Ambulance_controller.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/custom_searchbar.dart';
import 'package:latlong2/latlong.dart';

import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});

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
                      MarkerLayer(markers: [
                        Marker(
                            point: LatLng(36.211310, 37.111459),
                            child: Icon(
                              Icons.location_on,
                              color: Mycolor.redcolor,
                              size: 40,
                            ))
                      ])
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
                                    blurStyle: BlurStyle.outer)
                              ],
                              color: Mycolor.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Confirm your address',
                                style: FontStyles.confirmyouraddress,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Mycolor.redcolor,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Flat No. 50, Mahalaxmi Shop, Upkaar, 36, Barpokhar (E), Siwan, Bihar, Pincode-880212',
                                      style: FontStyles.address,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines:
                                          4, // تحديد الحد الأقصى لعدد الأسطر
                                      softWrap: true, // لتكسر النص بشكل صحيح
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              ButtonCustom(
                                  textbutton: 'Confirm Location',
                                  colorbutton: Mycolor.lightblue,
                                  hieght: 60,
                                  width: 250,
                                  textstyel: FontStyles.buy,
                                  onpressed: () {})
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }));
  }
}
