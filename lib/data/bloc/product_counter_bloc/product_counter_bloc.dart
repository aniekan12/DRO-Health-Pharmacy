import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_counter_event.dart';
part 'product_counter_state.dart';

class ProductCounterBloc
    extends Bloc<ProductCounterEvent, ProductCounterState> {
  ProductCounterBloc() : super(ProductCounterInitial(0));

  @override
  Stream<ProductCounterState> mapEventToState(
      ProductCounterEvent event) async* {
    if (event is IncrementProductEvent) {
      yield ProductAdded(counter: state.counter! - 1);
    } else {
      yield ProductRemoved(counter: state.counter! + 1);
    }
  }
}
