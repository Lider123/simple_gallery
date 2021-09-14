import 'package:flutter/material.dart';
import 'package:simple_gallery/const.dart';
import 'package:simple_gallery/data/models.dart';

typedef AlbumTapListener = void Function(Album album);

class AlbumCard extends StatelessWidget {
  final Album _album;
  AlbumTapListener? _onTapListener;

  AlbumCard(this._album, {Key? key, AlbumTapListener? onTapListener}) : super(key: key) {
    _onTapListener = onTapListener;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
            padding: const EdgeInsets.all(Dimens.marginDefault),
            child: Center(
              child: Text(_album.title,
                style: Styles.textHeaderStyle,
                textAlign: TextAlign.center,
              )
            )
        )
      ),
      onTap: () {
        _onTapListener?.call(_album);
      },
    );
  }
}
