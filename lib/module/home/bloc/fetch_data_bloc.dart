import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mt_ecom_app/service/remote/api_service.dart';
import 'package:mt_ecom_app/core/model/product.dart';

part 'fetch_data_event.dart';

part 'fetch_data_state.dart';

class FetchDataBloc extends Bloc<FetchDataEvent, FetchDataState> {
  FetchDataBloc() : super(Initial()) {
    on<StartFetchEvent>((event, emit) async {
      emit(FetchingData());
      List<Product> productList = await getDataCall();
      if (productList.isEmpty) {
        emit(FetchDataFailed());
      } else {
        emit(FetchDataSuccess(productList: productList));
      }
    });
  }
}
