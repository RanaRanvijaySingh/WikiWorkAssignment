import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:wiki_work_assignment/presentation/gallery/gallery_bloc.dart';
import 'package:wiki_work_assignment/resources/app_strings.dart';

import '../../data/models/ui_models/photo_ui_model.dart';
import '../../main.dart';

@RoutePage()
class GalleryScreen extends StatefulWidget {
  final int albumId;

  const GalleryScreen({super.key, required this.albumId});

  @override
  State<StatefulWidget> createState() => _GalleryState(albumId);
}

class _GalleryState extends State<GalleryScreen> {
  final _bloc = getIt<GalleryBloc>();
  final int albumId;

  _GalleryState(this.albumId);

  @override
  void initState() {
    super.initState();
    _bloc.fetchPhotos(albumId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.gallery),
        leading: const BackButton(color: Colors.black),
      ),
      body: StreamBuilder<List<PhotoUiModel>>(
        stream: _bloc.photoStream,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<PhotoUiModel>> snapshot,
        ) {
          if (snapshot.hasData) {
            return _buildListView(snapshot);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(AppStrings.unableToLoadPhotos),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  GridView _buildListView(AsyncSnapshot<List<PhotoUiModel>> snapshot) {
    var data = snapshot.data;
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        data!.length,
        (int index) {
          final item = data[index];
          return FadeInImage.assetNetwork(
            placeholder: 'assets/place_holder.png',
            image: item.thumbnailUrl!,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
