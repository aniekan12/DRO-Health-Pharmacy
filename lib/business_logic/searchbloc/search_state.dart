part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  List<Suggestions>? suggestions;

  SearchLoaded({this.suggestions});
  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  @override
  List<Object> get props => [];
}
