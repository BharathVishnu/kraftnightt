import 'package:get/get.dart';
import 'package:kraftnightt/home/models/itenary.dart';

class homecontroller extends GetxController {
  var tabIndex = 0;
  var selected = ''.obs;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
    var isselected1 = false.obs;
  }

  var selecteditems = <Itinerary>[].obs;
  void filterItems(List<Itinerary> itineraries) {
    print(itineraries);
    if (selected.toLowerCase() == 'all') {
      selecteditems.value = itineraries;
      print(selecteditems);
      print("yees");
    } else {
      for (Itinerary itinerary in itineraries) {
        if (itinerary.type?.toUpperCase() == selected.toUpperCase()) {
          print(selecteditems);
          selecteditems.add(itinerary);
          print(selecteditems);
        }
      }
    }
  }
}
