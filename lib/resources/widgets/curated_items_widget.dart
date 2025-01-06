import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/app.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CuratedItems extends StatelessWidget {
  final AppModel eCommerceItems;
  final Size size;
  const CuratedItems({
    super.key,
    required this.eCommerceItems,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.color.fbackgroundColor2,
            image: DecorationImage(
              image: AssetImage(eCommerceItems.image),
              fit: BoxFit.cover,
            ),
          ),
          height: 180,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black26,
                  child: Icon(Icons.favorite_border,
                      color: Colors.white, size: 18),
                )),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              'H&M',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black26),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 17,
            ),
            Text(
              eCommerceItems.rating.toString(),
            ),
            Text(
              '(${eCommerceItems.review.toString()})',
              style: TextStyle(color: Colors.black26),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.5,
          child: Text(
            eCommerceItems.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: 16, height: 1.5, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            Text(
              '\$${eCommerceItems.price.toString()}.00',
              style: TextStyle(
                fontSize: 16,
                color: Colors.pink,
                height: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            if (eCommerceItems.isChecked == true)
              Text(
                '\$${eCommerceItems.price! + 10}.00',
                style: TextStyle(
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black26,
                ),
              ),
          ],
        )
      ],
    );
  }
}
