part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class Search extends SearchEvent {
  String? query;

  Search({this.query});
  @override
  List<Object> get props => [];
}
