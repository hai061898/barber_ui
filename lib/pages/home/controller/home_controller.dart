import 'dart:async';

import 'package:barber/data/models/auth_model.dart';
import 'package:barber/data/models/company_model.dart';
import 'package:barber/data/models/schedule_model.dart';
import 'package:barber/data/repository/company_repository.dart';
import 'package:barber/data/repository/schedule_repository.dart';
import 'package:barber/routes/routes_page.dart';
import 'package:barber/widgets/navigation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  final box = GetStorage('barberapp');
  final scheduleRepo = Get.find<SchedulesRepository>();
  final companyRepo = Get.find<CompanyRepository>();

  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text('Home'), Colors.deepPurpleAccent),
    NavigationItem(Icon(Icons.search), Text('Search'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.person_outline), Text('Preson'), Colors.teal),
  ];

  RxList<Schedule> listSchedules = <Schedule>[].obs;

  Rx<LatLng> center = LatLng(-30.034399, -51.212597).obs;
  Completer<GoogleMapController> gmapController = Completer();
  LatLng? lastMapPosition;
  Position? currentLocation;
  Set<Marker> markers = {};

  RxList<Company> listCompanies = <Company>[].obs;

  Auth? auth;

  @override
  void inInit() {
    super.onInit();
    auth = Auth.fromJson(box.read('auth'));
    getUserLocation();
    super.onInit();
  }

  void loadData() async {
    await scheduleRepo.getAll().then((value) {
      listSchedules.assignAll(value);
      if (value.length > 0)
        change(value, status: RxStatus.success());
      else
        change(null, status: RxStatus.empty());
    }, onError: (err) {
      change(null, status: RxStatus.error('erorro no schedule.'));
    });
     rebuildMarkers();
    print('loadData');

  }

  void onMapCreated(GoogleMapController controller) {
    gmapController.complete(controller);
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    center.value = LatLng(currentLocation!.latitude, currentLocation!.longitude);
    print('center $center');
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void loadMarkers() {
    print('load');
    if (listCompanies.length > 0) {
      listCompanies.forEach((e) {
        markers.add(
          Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(
                double.tryParse(e.latitude),
                double.tryParse(e.longitude),
              ),
              
              icon: BitmapDescriptor.defaultMarker,
              onTap: () {
                Get.defaultDialog(
                  title: "${e.name}",
                  content: Text("Telefone: ${e.phone ?? '...'}\nLink: ${e.socialLink ?? '...'}"),
                  actions: [
                    TextButton(
                      style: TextButton.styleFrom(  
                        primary: Get.theme.primaryColor,
                      ),
                      onPressed: () {
                        Get.back();
                        openCompany(e);
                      },
                      child: Text("Abrir"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary:Colors.red,
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                                              
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancelar"),
                    ),
                  ],
                );
              }),
        );
      });
    }
  }
   void rebuildMarkers() async {
    listCompanies.assignAll(await companyRepo.getAll());
    loadMarkers();
  }


   void openCompany(Company company) async {
    // var result = await Get.toNamed(RoutesPage.COMPANY, arguments: company);
    // if(result != null){
    //   selectedIndex.value = 0;
    //   loadData();
    // }
  }

  void choice(int index) {
    selectedIndex.value = index;
  }

   void logout() {
    box.erase();
    // Get.offAllNamed(RoutesPage.LOGIN);
  }
}
