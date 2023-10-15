import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BeverageItem extends StatelessWidget {
  const BeverageItem({
    Key? key,
    required this.selectedBeverage,
    // required this.showDetails,
  }) : super(key: key);

  final Beverage selectedBeverage;
  // final void Function(Beverage beverage) showDetails;

  @override
  Widget build(BuildContext context) {
    // print(selectedBeverage.id);
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(1, 1),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${selectedBeverage.material} available',
                  style: GoogleFonts.rubik(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                ...selectedBeverage.beverageItem.map((item) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/products/${item.image}.png',
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(
                              16.0), // Add padding as needed
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                item.description,
                                style: const TextStyle(fontSize: 13),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    itemSize: 20,
                                    initialRating: item.star,
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
                                    ' ${item.star} - ${item.rating} ratings',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
