import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/models/model.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _PostHeader(post: post),
              const SizedBox(
                height: 4.0,
              ),
              Text(post.caption),
              post.imageUrl != null
                  ? const SizedBox.shrink()
                  : const SizedBox(
                      height: 6.0,
                    ),
            ],
          ),
        ),
        post.imageUrl != null
            ? CachedNetworkImage(imageUrl: post.imageUrl)
            : const SizedBox.shrink(),
      ]),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text('${post.timeAgo} . '),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            icon: const Icon(Icons.more_horiz), onPressed: () => print('More'))
      ],
    );
  }
}
