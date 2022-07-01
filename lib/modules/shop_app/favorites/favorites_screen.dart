import 'package:App/layout/shop_app/cubit/cubit.dart';
import 'package:App/layout/shop_app/cubit/state.dart';
import 'package:App/models/shop_app/fav_model.dart';
import 'package:App/shared/components/components.dart';
import 'package:App/shared/style/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        },
      builder: (context, state) => ConditionalBuilder(
        condition: state is! ShopLoadingGetFavoritesState,
        builder:(context)=> ListView.separated(
          itemBuilder: (context, index) => buildListProduct(ShopCubit.get(context).favoritesModel.data.data[index].product,context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: ShopCubit.get(context).favoritesModel.data.data.length,
        ),
        fallback: (context)=> Center(child: CircularProgressIndicator()),
      ),
    );
  }


}
