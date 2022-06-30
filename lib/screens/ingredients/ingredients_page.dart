import 'package:boilerplate/screens/ingredients/ingredients_provider.dart';
import 'package:boilerplate/styles/colors.dart';
import 'package:boilerplate/widgets/circular_progress.dart';
import 'package:boilerplate/widgets/item_cocktail.dart';
import 'package:boilerplate/widgets/list_cocktail.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IngredientsPage extends ConsumerStatefulWidget {
  const IngredientsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<IngredientsPage> createState() => _IngredientsPageState();
}

class _IngredientsPageState extends ConsumerState<IngredientsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(ingredientsViewModelProvider.notifier).getIngredients();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CocktailColors.background,
      appBar: AppBar(
        title: Text(AppStrings.current.ingredients),
      ),
      body: Column(
        children: [
          _IngredientsConsumer(),
        ],
      ),
    );
  }
}

class _IngredientsConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ingredientsViewModelProvider);

    return state.when(
      loading: () => const CircularProgress(),
      success: (ingredients) {
        final ingredientsItems = ingredients
            .map(
              (ingredient) => CocktailItem(name: ingredient.name),
            )
            .toList();
        return ListCocktail(list: ingredientsItems);
      },
      failure: (error) => Text(error),
    );
  }
}