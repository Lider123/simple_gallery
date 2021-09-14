import 'package:flutter/material.dart';
import 'package:simple_gallery/const.dart';
import 'package:simple_gallery/data/api.dart';
import 'package:simple_gallery/data/models.dart';
import 'package:simple_gallery/ui/widgets/album_card.dart';
import 'package:simple_gallery/ui/widgets/loading_container.dart';

class AlbumsScreen extends StatefulWidget {

  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  final List<Album> _albums = [];
  bool _isLoading = false;

  @override
  void initState() {
    _loadAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        isLoading: _isLoading,
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(Dimens.marginDefault),
          mainAxisSpacing: Dimens.marginDefault,
          crossAxisSpacing: Dimens.marginDefault,
          children: List.generate(_albums.length, (index) =>
              AlbumCard(_albums[index],
                onTapListener: _onAlbumTap,
              )
          ),
        ),
        /*child: ListView.builder(
            itemCount: 2 * _albums.length,
            itemBuilder: (context, i) {
              if (i.isOdd) return const SizedBox(height: Dimens.marginDefault);

              final index = i ~/ 2;
              return AlbumCard(_albums[index],
                onTapListener: _onAlbumTap,
              );
            },
          padding: const EdgeInsets.only(
            top: Dimens.marginDefault,
            left: Dimens.marginDefault,
            right: Dimens.marginDefault
          ),
        )*/
      )
    );
  }

  Future _loadAlbums() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final data = await Api.getAlbums();
      _albums.clear();
      _albums.addAll(data);
    } catch (error) {
      print(error.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onAlbumTap(Album album) {
    // TODO
    var message = SnackBar(
      content: Text("Album ${album.title} tapped"),
    );
    ScaffoldMessenger.of(context).showSnackBar(message);
  }
}