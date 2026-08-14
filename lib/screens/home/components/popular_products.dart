import 'package:flutter/material.dart';
import 'package:stylish/models/Product.dart';

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular",
            pressSeeAll: () {},
          ),
        ),
        SizedBox(
          height: 256,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: demo_product.length,
            itemBuilder: (context, index) => ProductCard(
              title: demo_product[index].title,
              image: demo_product[index].image,
              price: demo_product[index].price,
              bgColor: demo_product[index].bgColor,
              press: () {},
            ),
            separatorBuilder: (context, index) =>
                const SizedBox(width: defaultPadding),
          ),
        )
      ],
    );
  }
}
