part of 'fetch_data_bloc.dart';

abstract class FetchDataEvent extends Equatable {
  const FetchDataEvent();
}

class StartFetchEvent extends FetchDataEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}