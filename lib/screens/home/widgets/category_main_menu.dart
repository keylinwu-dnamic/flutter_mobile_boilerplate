import 'package:auto_route/auto_route.dart';
import 'package:boilerplate/router/router.gr.dart';
import 'package:boilerplate/screens/home/cocktail_menu.dart';
import 'package:boilerplate/screens/home/home_provider.dart';
import 'package:boilerplate/styles/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryMainMenu extends ConsumerStatefulWidget {
  const CategoryMainMenu({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoryMainMenu> createState() => _CategoryMainMenuState();
}

class _CategoryMainMenuState extends ConsumerState<CategoryMainMenu> {
  @override
  Widget build(BuildContext context) {
    final gridTile = ref
        .read(homeViewModelProvider.notifier)
        .cocktailMenuTiles
        .map((tile) => _buildGridTile(withName: tile.name, path: tile.path))
        .toList();

    return Center(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(Spacing.spacingMD),
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: gridTile,
      ),
    );
  }

  // add required String routeName
  Widget _buildGridTile(
      {required String withName, required PageRouteInfo path}) {
    void goTo() {
      context.router.push(path);
    }

    return GridTile(
      child: TextButton(
        onPressed: () {
          goTo();
        },
        child: Container(
          padding: const EdgeInsets.all(Spacing.spacingXS),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amberAccent, width: 5),
            color: Colors.amber.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
              child: Text(
            withName,
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}
