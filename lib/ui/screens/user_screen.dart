import 'package:flutter/material.dart';
import 'package:simple_gallery/const.dart';
import 'package:simple_gallery/data/api.dart';
import 'package:simple_gallery/ui/widgets/loading_container.dart';

import '../../data/models.dart';

class UserScreen extends StatefulWidget {
  final num userId;

  const UserScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {
  bool _isLoading = false;
  User? _user;

  @override
  void initState() {
    _loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(_user?.name ?? "",
            style: Styles.textHeaderStyle.copyWith(
              color: MyColors.onPrimary
            ),
          ),
        ),
        body: LoadingContainer(
          isLoading: _isLoading,
          child: Column(), // TODO
        ),
      );

  Future _loadUser() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final data = await Api.getUser(widget.userId);
      _user = data;
    } catch(error) {
      print(error.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
