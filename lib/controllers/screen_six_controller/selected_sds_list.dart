import 'package:get/get.dart';

import '../../models/sdgs_models/update_sdgs_list.dart';

class SdgsListController extends GetxController {
  List<UpdatedSdgsList> selectedSds = [];

  void addSdgs(UpdatedSdgsList item) {
    selectedSds.add(item);
  }

  void removeSds(UpdatedSdgsList item) {
    selectedSds.remove(item);
  }

  List<UpdatedSdgsList> getSelectedSdgs() {
    return selectedSds;
  }
}
