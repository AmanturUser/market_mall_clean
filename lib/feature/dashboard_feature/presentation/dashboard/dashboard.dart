import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_mall_flutter_bloc/feature/dashBoard_feature/presentation/widgets/category_card.dart';
import 'package:market_mall_flutter_bloc/feature/dashboard_feature/presentation/widgets/slide_widget.dart';
import '../../../../core/style/app_colors.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/product_card.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardBloc=BlocProvider.of<DashboardBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/logo.png'))),
        ),
        centerTitle: true,
        // elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 26),
          CarouselSlider(
            items: [CardForSlide(),CardForSlide(),CardForSlide()],
            options: CarouselOptions(
              pageSnapping: true,
              onPageChanged: (index, reason) {
              },
              height: 160,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
            ),
          ),
          const SizedBox(height: 8),
          const ListTile(
            leading: Text(
              'Категории',
              style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            ),
            trailing: Text(
              'Всё',
              style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12),
            ),
          ),
          BlocBuilder<DashboardBloc, DashboardState>(
            bloc: dashboardBloc..add(GetCategoriesEvent()),
            builder: (context, state) {
              if (state is LoadingDashboardState) {
                return const Center(child: CircularProgressIndicator());
              }
              if(state is LoadedCategoriesState){
                final path=state.categories.data;
                return Container(
                  padding: const EdgeInsets.only(left: 14),
                  height: 110,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, _) => const SizedBox(width: 0),
                    itemCount: path!.length,
                    itemBuilder: (context, index) =>
                        Category(path[index].id.toString(),
                            path[index].name!, path[index]
                                .path!),
                  ),
                );
              }
              if(state is ErrorDashboardState){
                return Center(child: Text(state.error.toString()),);
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 47),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xFFEBEBEB),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.red1),
                        child: const Center(
                          child: Text(
                            'Рекомендуемые',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: Text(
                            'Новые',
                            style: TextStyle(
                                color: Colors.black ,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
              height: 20
          ),
          /*BlocBuilder<DashboardBloc, DashboardState>(
            bloc: dashboardBloc..add(GetProductsEvent()),
            builder: (context, state) {
              if (state is LoadingDashboardState) {
                return Center(child: CircularProgressIndicator());
              }
              if(state is LoadedGet1ProductsState){
                final productsPath=state.getProducts.data;
                return Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Wrap(
                      runSpacing: 20,
                      spacing: 10,
                      // scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 0; i < productsPath!.length; i++)
                          ProductCard(productsPath![i].images!
                              .length > 0
                              ? productsPath![i].images![0]
                              : null, 3, productsPath![i].description!,
                              productsPath![i].price.toString(),
                              ((productsPath![i].id!).toString()),
                              ''),
                      ]
                  ),
                );
              }
              return Text(
                'Products not found'
              );
            },
          ),*/
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
