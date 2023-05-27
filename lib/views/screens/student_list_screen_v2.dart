// import 'package:class_sample/model/model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../bloc/post_bloc.dart';
//
// class StudentListScreenV2 extends StatelessWidget {
//   StudentListScreenV2({super.key});
//
//   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//       GlobalKey<RefreshIndicatorState>();
//
//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<PostBloc>(context).fetchPosts();
//     return Scaffold(
//       body: Center(
//         child: BlocConsumer<PostBloc, List<PostsModel>>(
//           listener: (context, state) {},
//           builder: (context, postList) {
//             List<PostsModel> list = postList;
//
//             return RefreshIndicator(
//               key: _refreshIndicatorKey,
//               onRefresh: () async {
//                 return BlocProvider.of<PostBloc>(context).fetchPosts();
//               },
//               child: (list.isEmpty)
//                   ? const Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : ListView.builder(
//                       itemBuilder: (BuildContext context, int index) {
//                         var studentItem = list[index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               '/c',
//                               arguments: 'Hello from HomePage',
//                             );
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Card(
//                               elevation: 5,
//                               color: Colors.white.withOpacity(0.5),
//                               child: Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 200,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           Text(studentItem.title.toString(),
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 18)),
//                                           Text(studentItem.body.toString(),
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.normal,
//                                                   fontSize: 14)),
//                                           Text(
//                                             studentItem.id.toString(),
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.normal,
//                                                 fontSize: 16),
//                                           ),
//                                           Text(
//                                             studentItem.userId.toString(),
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 20),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       itemCount: list.isNotEmpty ? list.length : 0),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           // Show refresh indicator programmatically on button tap.
//           _refreshIndicatorKey.currentState?.show();
//         },
//         icon: const Icon(Icons.refresh),
//         label: const Text('Show Indicator'),
//       ),
//     );
//   }
// }
