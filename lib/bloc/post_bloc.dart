import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Events
abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPosts extends PostEvent {}

// States
abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<dynamic> posts;

  PostLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostError extends PostState {}
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({super.initialState});



  @override
  PostState get initialState => PostInitial();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPosts) {
      yield PostLoading();
      try {
        final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
        final jsonData = json.decode(response.body);
        yield PostLoaded(jsonData);
      } catch (_) {
        yield PostError();
      }
    }
  }
}

// class PostBloc extends Cubit<List<PostsModel>> {
//   PostBloc() : super([]);
//
//   Future<void> fetchPosts() async {
//     try {
//       List<PostsModel> fetchedPosts = await ApiService.fetchPosts();
//       emit(fetchedPosts);
//     } catch (e) {
//       // Handle error
//       print(e);
//     }
//   }
// }