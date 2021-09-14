import 'package:flutter/material.dart';
import 'package:simple_gallery/const.dart';
import 'package:simple_gallery/data/api.dart';
import 'package:simple_gallery/data/models.dart';
import 'package:simple_gallery/ui/widgets/loading_container.dart';
import 'package:simple_gallery/ui/widgets/post_card.dart';

class FeedScreen extends StatefulWidget {

  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FeedScreenState();
}

class FeedScreenState extends State<FeedScreen> {
  bool _isLoading = false;
  final List<Post> _posts = [];

  @override
  void initState() {
    _loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        isLoading: _isLoading,
        child: ListView.builder(
          itemCount: 2 * _posts.length,
          itemBuilder: (context, i) {
            if (i.isOdd) {
              return const SizedBox(
                height: Dimens.marginDefault,
              );
            }

            final index = i ~/ 2;
            return PostCard(_posts[index],
                onTapListener: _onPostTap
            );
          },
          padding: const EdgeInsets.only(
            top: Dimens.marginDefault,
            left: Dimens.marginDefault,
            right: Dimens.marginDefault
          ),
        ),
      ),
    );
  }

  Future _loadPosts() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final data = await Api.getPosts();
      _posts.clear();
      _posts.addAll(data);
    } catch (error) {
      print(error.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onPostTap(Post post) {
    // TODO
    var message = SnackBar(
      content: Text("Post ${post.title} tapped"),
    );
    ScaffoldMessenger.of(context).showSnackBar(message);
  }
}
