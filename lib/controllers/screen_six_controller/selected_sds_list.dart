import 'package:get/get.dart';
import 'package:savvy/models/sdgs_models/sdgs_list.dart';

class SdgsListController extends GetxController {
  List<SdgsList> selectedSds = [];

  void addSdgs(SdgsList item) {
    selectedSds.add(item);
  }

  void removeSds(SdgsList item) {
    selectedSds.remove(item);
  }

  List<SdgsList> getSelectedSdgs() {
    return selectedSds;
  }
}
