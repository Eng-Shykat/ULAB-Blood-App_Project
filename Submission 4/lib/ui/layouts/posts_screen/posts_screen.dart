import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/data/model/post_data_model.dart';
import 'package:ulab_blood_bank/res/colors/app_colors.dart';
import 'package:ulab_blood_bank/res/dimens/common_sizing.dart';
import 'package:ulab_blood_bank/ui/components/single_post_card.dart';

import '../../../repository/posts_repository.dart';
import '../post_details_screen/post_details_screen.dart';

class PostsScreen extends ConsumerStatefulWidget {
  const PostsScreen({super.key});

  @override
  ConsumerState<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends ConsumerState<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    final postsRepository = ref.watch(postsRepositoryProvider);

    Widget buildBody(QuerySnapshot<PostDataModel> postDataModels) {
      List<PostDataModel> posts =
          postDataModels.docs.map((e) => e.data()).toList();

      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                const Text(
                  "REQUESTS",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            /*SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.colorSecondaryBlack,
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.water_drop,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Post A Blood Request",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            verticalGap16,*/
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailsScreen(
                            postDataModel: posts[index],
                          ),
                        ),
                      );
                    },
                    child: SinglePostCard(
                      // imageUrl: posts[index].imageUrl,
                      bloodGroup: posts[index].bloodGroup,
                      postType: posts[index].urgency,
                      userName: posts[index].userName,
                      location: posts[index].location,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    }

    Widget buildLoading() => const Center(
          child: CircularProgressIndicator(),
        );

    Widget buildError(e, s) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Something went wrong'),
            verticalGap8,
            ElevatedButton(
              onPressed: () {},
              child: Text("Retry"),
            ),
          ],
        ),
      );
    }

    return postsRepository.when(
      data: buildBody,
      loading: buildLoading,
      error: buildError,
    );
  }
}
