import 'package:class_sample/model/model.dart';
import 'package:class_sample/viewmodel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentListScreen extends StatelessWidget {
  StudentListScreen({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    Provider.of<PostViewModel>(context, listen: false).fetchPosts();
    return Scaffold(
      body: Center(
        child: Consumer<PostViewModel>(
          builder: (context, data, _) {
            List<PostsModel> list = data.posts2;

            return RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () async {
                return Provider.of<PostViewModel>(context, listen: false)
                    .fetchPosts();
              },
              child: (data.posts2.isEmpty)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        var studentItem = list[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/c',
                              arguments: 'Hello from HomePage',
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 5,
                              color: Colors.white.withOpacity(0.5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(studentItem.title.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                          Text(studentItem.body.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14)),
                                          Text(
                                            studentItem.id.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            studentItem.userId.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: list.isNotEmpty ? list.length : 0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show refresh indicator programmatically on button tap.
          _refreshIndicatorKey.currentState?.show();
        },
        icon: const Icon(Icons.refresh),
        label: const Text('Show Indicator'),
      ),
    );
  }
}
