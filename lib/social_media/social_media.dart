import 'package:flutter/material.dart';
import 'post.dart';
import 'post_card.dart';
import 'create_post_sheet.dart';

class SocialMediaPage extends StatefulWidget {
  final String username;

  const SocialMediaPage({
    super.key,
    required this.username,
  });

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  final List<Post> posts = [];

  Future<void> openCreatePost() async {
    final Post? newPost = await showModalBottomSheet<Post>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return CreatePostSheet(
          username: widget.username,
        );
      },
    );

    if (!mounted || newPost == null) {
      return;
    }

    setState(() {
      posts.insert(0, newPost);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: openCreatePost,
        icon: const Icon(Icons.add),
        label: const Text('Create Post'),
      ),
      body: posts.isEmpty
          ? const Center(child: Text('No posts yet. Create one!'))
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(
                  key: ObjectKey(posts[index]),
                  post: posts[index],
                );
              },
            ),
    );
  }
}