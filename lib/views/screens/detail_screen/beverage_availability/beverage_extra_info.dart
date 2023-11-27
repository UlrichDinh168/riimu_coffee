import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riimu_coffee/models/available_items.dart';

class BeverageExtraInfo extends StatelessWidget {
  const BeverageExtraInfo({
    super.key,
    required this.availableItem,
  });

  final AvailableItem availableItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$availableItem.title available',
          style: GoogleFonts.rubik(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              //
              child: Image(image: NetworkImage(availableItem.imageUrl)),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(16.0), // Add padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      availableItem.title,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      availableItem.description,
                      style: const TextStyle(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          itemSize: 20,
                          initialRating: availableItem.score,
                          minRating: 1,
                          ignoreGestures: true,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Text(
                          ' ${availableItem.score}  ratings',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
