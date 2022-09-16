part of 'fetch_data_bloc.dart';

abstract class FetchDataState extends Equatable {
  const FetchDataState();
}

class Initial extends FetchDataState {
  @override
  List<Object> get props => [];
}

class FetchingData extends FetchDataState {
  @override
  List<Object> get props => [];
}

class FetchDataSuccess extends FetchDataState {
  final List<Product> productList;
  const FetchDataSuccess({required this.productList});

  @override
  List<Object> get props => [productList];
}

class FetchDataFailed extends FetchDataState {
  @override
  List<Object> get props => [];
}
