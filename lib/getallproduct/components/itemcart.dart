import 'package:doan_flutter/models/product.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  final Product? product;
  final Function? press;
  const ItemCart({
    super.key,
    this.product,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          // child: Card(
          child: Container(
            padding: EdgeInsets.all(20),
            // height: 180,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   // color: Colors.black,
            //   // image: DecorationImage(
            //   //   image: Image.asset(product!.image).image,
            //   //   fit: BoxFit.cover,
            //   // ),
            // ),
            // color: Colors.black,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  // colorFilter: ColorFilter.mode(
                  //     Colors.black.withOpacity(0.4), BlendMode.darken),
                  image: AssetImage(product!.image),
                  fit: BoxFit.fill),
            ),
            // child: Image.asset(product!.image),
          ),
          // elevation: 0,
          // shape: RoundedRectangleBorder(
          //   side: BorderSide(
          //     color: Theme.of(context).colorScheme.surfaceVariant,
          //   ),
          //   borderRadius: const BorderRadius.all(Radius.circular(12)),
          // ),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            product!.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text("\$${product!.price}"),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
