import 'package:flutter/material.dart';
import 'package:simple_gallery/const.dart';
import 'package:simple_gallery/data/models.dart';

typedef UserTapListener = void Function(User user);

class UserCard extends StatelessWidget {
  final User _user;
  UserTapListener? _onTapListener;

  UserCard(this._user, {Key? key, UserTapListener? onTapListener}) : super(key: key) {
    _onTapListener = onTapListener;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(Dimens.marginDefault),
        child: Text(_user.name,
            textAlign: TextAlign.start
        ),
      ),
      onTap: () {
        _onTapListener?.call(_user);
      },
    );
  }
}
