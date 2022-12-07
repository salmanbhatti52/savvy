import 'dart:async';

import 'package:get/get.dart';

import '../../models/sdgs_models/update_sdgs_list.dart';

class SdgsListController extends GetxController {
  List<UpdatedSdgsList> selectedSds = [];
  List<String> sdgsColors = [];
  var isLoaded = false.obs;

  void isListLoaded() {
    // print('isLoaded is Called');
    Timer(
      const Duration(seconds: 3),
      () => isLoaded.value = true,
    );
    //isLoaded.value = true;
  }

  void addSdgs(UpdatedSdgsList item) {
    selectedSds.add(item);
  }

  void removeSds(UpdatedSdgsList item) {
    selectedSds.remove(item);
  }

  List<UpdatedSdgsList> getSelectedSdgs() {
    return selectedSds;
  }

  void getColors() {
    for (int i = 0; i <= selectedSds.length; i++) {
      sdgsColors.add(selectedSds[i].colorCode.toString());
    }
  }
}
