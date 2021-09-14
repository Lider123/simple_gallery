import 'package:flutter/material.dart';
import 'package:simple_gallery/const.dart';
import 'package:simple_gallery/data/models.dart';

typedef PostTapListener = void Function(Post post);

class PostCard extends StatelessWidget {
  final Post _post;
  PostTapListener? _onTapListener;

  PostCard(this._post, {Key? key, PostTapListener? onTapListener}) : super(key: key) {
    _onTapListener = onTapListener;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: const EdgeInsets.only(
                      top: Dimens.marginDefault,
                      left: Dimens.marginDefault,
                      right: Dimens.marginDefault
                  ),
                  child: Text(_post.title,
                    style: Styles.textHeaderStyle,
                    textAlign: TextAlign.start,
                  )
              ),
              Container(
                padding: const EdgeInsets.all(Dimens.marginDefault),
                child: Text(_post.body,
                    textAlign: TextAlign.justify
                ),
              )
            ]
        ),
        onTap: () {
          _onTapListener?.call(_post);
        },
      ),
    );
  }
}
