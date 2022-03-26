import 'package:bloc/bloc.dart';
import 'package:dro_health_phamarcy/data/models/suggestions.dart';
import 'package:dro_health_phamarcy/data/repository/search_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchDrugsRepository searchDrugsRepository;

  SearchState get initialState => SearchInitial();

  SearchBloc({required this.searchDrugsRepository}) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is Search) {
      yield SearchInitial();
      try {
        List<Suggestions> suggestions =
            await searchDrugsRepository.searchDrugs(event.query!);
        yield SearchLoaded(suggestions: suggestions);
      } catch (e) {
        yield SearchError();
      }
    }
  }
}
