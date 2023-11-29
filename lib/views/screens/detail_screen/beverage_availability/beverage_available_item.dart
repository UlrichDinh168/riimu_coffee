import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:riimu_coffee/models/available_items.dart';

class BeverageAvailableItem extends StatelessWidget {
  const BeverageAvailableItem({
    super.key,
    required this.availableItem,
  });

  final AvailableItem availableItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            availableItem.imageUrl,
            height: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                availableItem.title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 255),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        availableItem.description,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: const Color.fromARGB(255, 0, 113, 21),
                            ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 237, 229, 55),
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${availableItem.score} - ${availableItem.numberOfRatings} rating',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
