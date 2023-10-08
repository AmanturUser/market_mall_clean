import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_entity.dart';
import '../bloc/product_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>()..add(LoadProductEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadedProductState) {
            final List<ProductModel> products = state.products;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: products.length,
                itemBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Flexible(
                          child: Image.network(products[index].image!,loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },),
                        ),
                        Text(products[index].title!),
                      ],
                    ),

                  );
                });
          }
          if(state is ErrorProductState){
            print(state.error);
            return Center(child: Text(state.error.toString()));
          }
          return Container();
        },
      ),
    );
  }
}
