import 'package:wiki_work_assignment/data/models/api_models/album_api_model.dart';
import 'package:wiki_work_assignment/data/models/ui_models/album_ui_model.dart';

/// Mapper responsibility is to format the api data and send UI friendly data.
class AlbumMapper {
  Future<List<AlbumUiModel>> getUiModel(List<AlbumApiModel>? apiModels) async {
    if (apiModels == null) return [];
    List<AlbumUiModel> uiModels = [];
    for (var element in apiModels) {
      String title = "NA";
      if (element.title != null && element.title!.isNotEmpty) {
        title = element.title!;
      }
      uiModels.add(AlbumUiModel(id: element.id, title: title));
    }
    return uiModels;
  }
}
