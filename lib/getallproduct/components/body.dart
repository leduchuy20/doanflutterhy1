import 'package:doan_flutter/getallproduct/components/itemcart.dart';
import 'package:doan_flutter/image_card.dart';
import 'package:doan_flutter/models/product.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              SizedBox(width: 20),
              ImageCard(cardImg: "assets/images/spa1.png"),
              SizedBox(width: 20),
              ImageCard(cardImg: "assets/images/spa2.png"),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => ItemCart(
                product: products[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
