import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_demo/domain/product_repository.dart';
import 'package:get_it/get_it.dart';

import 'bloc/product_list_bloc.dart';


class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: BlocProvider(
        create: (context) => ProductListBloc(
          productRepository: GetIt.instance.get<ProductRepository>(),
        )..add(ProductListIntialEvent()), // Dispatch the initial event
        child: const ProductListConsumer(),
      ),
    );
  }
}

class ProductListConsumer extends StatelessWidget {
  const ProductListConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductListBloc, ProductListState>(
      listener: (context, state) {
        if (state is ProductListError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is ProductListInitial || state is ProductListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductListLoaded) {
          if (state.products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }
          return RefreshIndicator(
            onRefresh: () async {
              // Dispatch Load event on pull-to-refresh
              BlocProvider.of<ProductListBloc>(context).add(ProductListLoadEvent());
              // Add a small delay to allow the stream to emit
              await Future.delayed(const Duration(milliseconds: 500));
            },
            child: ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    title: Text(product.title ?? ''),
                    subtitle: Text('ID: ${product.id}'),
                    // You can add more product details here
                  ),
                );
              },
            ),
          );
        } else if (state is ProductListError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Allow retrying the load
                    BlocProvider.of<ProductListBloc>(context).add(ProductListLoadEvent());
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return const Center(child: Text('Unknown state'));
      },
    );
  }
}