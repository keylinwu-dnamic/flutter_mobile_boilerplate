import 'package:boilerplate/styles/colors.dart';
import 'package:boilerplate/styles/size.dart';
import 'package:boilerplate/styles/spacing.dart';
import 'package:flutter/material.dart';

class ListCocktail extends StatelessWidget {
  final List<dynamic> list;

  ListCocktail({required this.list});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (_, index) {
            final String name = list[index].name;
            return Container(
              padding: const EdgeInsets.all(Spacing.spacingXS),
              margin: const EdgeInsets.all(Spacing.spacingXS),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.local_bar_outlined,
                    size: Sizes.sizeXXL,
                  ),
                  const SizedBox(
                    height: Sizes.sizeXXL,
                    child: VerticalDivider(
                      color: CocktailColors.divider,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: Spacing.spacingMD),
                    child: Text(name),
                  ),
                ],
              ),
            );
          }),
    );
  }
}