import 'package:wiki_work_assignment/data/models/api_models/photo_api_model.dart';
import 'package:wiki_work_assignment/data/models/ui_models/photo_ui_model.dart';

/// Mapper responsibility is to format the api data and send UI friendly data.
class PhotoMapper {
  Future<List<PhotoUiModel>> getUiModel(List<PhotoApiModel>? apiModels) async {
    if (apiModels == null) return [];
    List<PhotoUiModel> uiModels = [];
    for (var element in apiModels) {
      String title = "NA";
      if (element.title != null && element.title!.isNotEmpty) {
        title = element.title!;
      }
      uiModels.add(PhotoUiModel(thumbnailUrl: element.url, title: title));
    }
    return uiModels;
  }
}
