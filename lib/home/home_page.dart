import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:market_mall_flutter_bloc/core/auto_route/auto_route.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ProductListRoute(),
        DashBoardRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              /*BottomNavigationBarItem(
                icon: Icon(Icons.event_note_outlined),
                label: 'ToDo',
              ),
              */
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Store',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'DashBoard',
              ),
            ],
          ),
        );
      },
    );
  }
}
