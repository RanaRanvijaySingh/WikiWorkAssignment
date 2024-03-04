import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wiki_work_assignment/data/models/ui_models/album_ui_model.dart';
import 'package:wiki_work_assignment/main.dart';
import 'package:wiki_work_assignment/presentation/home/home_bloc.dart';
import 'package:wiki_work_assignment/resources/app_strings.dart';
import 'package:wiki_work_assignment/resources/dimensions.dart';

import '../../routing/app_routes.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final _bloc = getIt<HomeBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressAddNewAlbum,
        child: const Icon(Icons.add),
      ),
      body: Stack(children: [
        StreamBuilder<List<AlbumUiModel>>(
          stream: _bloc.albumStream,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<AlbumUiModel>> snapshot,
          ) {
            if (snapshot.hasData) {
              return _buildListView(snapshot);
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(AppStrings.unableToLoadAlbums),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        // StreamBuilder<bool>(
        //     stream: _bloc.progressStream,
        //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        //       if (snapshot.hasData) {
        //         return Container();
        //       } else {
        //         return const Center(child: CircularProgressIndicator());
        //       }
        //     }),
      ]),
    );
  }

  ListView _buildListView(AsyncSnapshot<List<AlbumUiModel>> snapshot) {
    var data = snapshot.data;
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: data!.length,
      itemBuilder: (BuildContext context, int index) {
        final item = data[index];
        return _listItem(item, data, index);
      },
    );
  }

  Dismissible _listItem(AlbumUiModel item, List<AlbumUiModel> data, int index) {
    return Dismissible(
      key: Key("${item.id}"),
      onDismissed: (direction) {
        //  Make the api call to remove the data¬
        // on success remove the item from the list
        _bloc.delete(item);
      },
      background: Container(color: Colors.red),
      child: InkWell(
        onTap: () {
          _onAlbumClick(item.id);
        },
        child: ListTile(
          title: Row(
            children: [
              Expanded(child: Text("${item.title}")),
              const SizedBox(width: AppDimensions.spaceMedium),
              Text("${item.id}"),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(AppStrings.home),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _logout,
        )
      ],
    );
  }

  _onPressAddNewAlbum() {
    _bloc.addNewAlbum();
  }

  _onAlbumClick(int? id) {
    if (id != null) {
      context.router.push(GalleryRoute(albumId: id));
    }
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  void _logout() {}

  void showMessage(String message) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}
