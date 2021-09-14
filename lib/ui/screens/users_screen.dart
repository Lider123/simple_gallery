import 'package:flutter/material.dart';
import 'package:simple_gallery/const.dart';
import 'package:simple_gallery/data/api.dart';
import 'package:simple_gallery/data/models.dart';
import 'package:simple_gallery/ui/widgets/loading_container.dart';
import 'package:simple_gallery/ui/widgets/user_card.dart';

class UsersScreen extends StatefulWidget {

  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UsersScreenState();
}

class UsersScreenState extends State<UsersScreen> {
  bool _isLoading = false;
  final List<User> _users = [];

  @override
  void initState() {
    _loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        isLoading: _isLoading,
        child: ListView.builder(
          itemCount: 2 * _users.length,
          itemBuilder: (context, i) {
            if (i.isOdd) {
              return const Divider();
            }

            final index = i ~/ 2;
            return UserCard(_users[index],
                onTapListener: _onUserTap
            );
          },
          padding: const EdgeInsets.only(
              left: Dimens.marginDefault,
              right: Dimens.marginDefault
          ),
        ),
      ),
    );
  }

  Future _loadUsers() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final data = await Api.getUsers();
      _users.clear();
      _users.addAll(data);
    } catch (error) {
      print(error.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onUserTap(User user) {
    // TODO
    var message = SnackBar(
      content: Text("User ${user.username} tapped"),
    );
    ScaffoldMessenger.of(context).showSnackBar(message);
  }
}
