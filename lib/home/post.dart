import 'package:flutter/material.dart';

class PostProperties
{
  late int iLikeCount;
  late String sOwnerName;
  late int iOwnerId;
  late int iCommentCount;

  PostProperties(String ownerName, int ownerId)
  {
    iLikeCount = 0;
    sOwnerName = ownerName;
    iOwnerId = ownerId;
    iCommentCount = 0;
  }

  void updateLikeCount(int delta)
  {
    iLikeCount += delta;
  }

  void updateCommentCount(int delta)
  {
    iCommentCount += delta;
    print("updated comment count: $iCommentCount");
  }
}

class PostData
{
  late Image mImage;
  List<Post> mComments = [];

  // TODO: we're able to create post data without an image currently, for debugging purposes.
  PostData(Image? image)
  {
    if (image == null)
    {
      return;
    }

    mImage = image;
  }

  void setImage(Image newImage)
  {
    mImage = newImage;
  }

  void addComment(Post comment)
  {
    mComments.add(comment);
  }
}

// TODO: state information is stored in the widget itself, not the state widget for now. (to create and modify posts in list)
class Post extends StatefulWidget {
  
  const Post({super.key, required this.ownerName, required this.ownerId, this.postImage});

  final String ownerName;
  final int ownerId;
  final Image? postImage; // TODO: we can't edit the post's image later on this way, or even change the owner's name etc.

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {

  late PostProperties mProperties = createProperties(widget.ownerName, widget.ownerId);
  late PostData mData = createData(widget.postImage);

  PostProperties createProperties(String ownerName, int ownerId)
  {
    return PostProperties(ownerName, ownerId);
  }

  PostData createData(Image ?image)
  {  
    return PostData(image);
  }

  void addLike(int count)
  {
    setState(() {
      mProperties.updateLikeCount(count);
    });
  }

  void addComment(Post comment)
  {
    setState(() {
      mData.addComment(comment);
      mProperties.updateCommentCount(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("like: ${mProperties.iLikeCount}"),
        Text("comment: ${mProperties.iCommentCount}"),
        ElevatedButton(onPressed: () {addLike(1);}, child: const Text("like")),
        ElevatedButton(onPressed: () {addComment(const Post(ownerId: 0, ownerName: "commenter"));}, child: const Text("comment")),
      ],
    );
  }
}