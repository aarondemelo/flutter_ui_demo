import 'package:bloc/bloc.dart';
import 'package:flutter_ui_demo/data/models/dto.dart';
import 'package:flutter_ui_demo/domain/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository _productRepository;

  ProductListBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductListInitial()) {
    on<ProductListIntialEvent>(_onInitialLoad);
    on<ProductListLoadEvent>(_onLoadProducts);
  }

  Future<void> _onInitialLoad(
      ProductListIntialEvent event, Emitter<ProductListState> emit) async {
    // We don't emit a loading state here because the stream will handle it
    // by first yielding the cached value.
    await for (final productResponse in _productRepository.getProducts()) {
      final products = productResponse.products;
      if (products?.isNotEmpty ?? false) {
        emit(ProductListLoaded(products ?? []));
      } else {
        emit(ProductListError('No products found.'));
      }
    }
  }

  Future<void> _onLoadProducts(
      ProductListLoadEvent event, Emitter<ProductListState> emit) async {
    // Emit loading state before starting the fetch, in case we need to
    // show a loading indicator even if we have cached data.
    emit(ProductListLoading());
    try {
      await for (final productResponse in _productRepository.getProducts()) {
        final products = productResponse.products;
        emit(ProductListLoaded(products ?? []));
      }
    } catch (e) {
      emit(ProductListError('Failed to load products: ${e.toString()}'));
    }
  }
}
