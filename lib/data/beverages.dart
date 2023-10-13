import 'package:riimu_coffee/models/beverage_model.dart';

final List<Beverage> beverages = [
  Beverage(
    title: 'Filter coffee',
    types: ['Arabica'],
    salespersons: [
      Salesperson(name: 'Anatasia', status: 'Filter is the thing'),
    ],
    description: Description(properties: [
      DescriptionItem(
        category: Category.info,
        desc: 'Kaffa Roastery - Herra Korppi',
      ),
      DescriptionItem(
        category: Category.cup,
        total: 100.0,
        remain: 20.0,
        desc: 'cups',
      ),
      DescriptionItem(
        category: Category.time,
        desc: 'Brewed 30 minutes ago',
      ),
    ]),
  ),
  Beverage(
    title: 'Espresso',
    types: ['Arabica', 'Robusto'],
    salespersons: [
      Salesperson(name: 'Sebastian', status: 'Espressoking'),
    ],
    description: Description(properties: [
      DescriptionItem(
        category: Category.water,
        total: 100.0,
        remain: 20.0,
        desc: 'espressos',
      ),
      DescriptionItem(
        category: Category.bean,
        total: 100.0,
        remain: 90.0,
        desc: 'espressos',
      ),
      DescriptionItem(
        category: Category.clean,
        desc: 'Cleaned April 28th',
      ),
    ]),
  ),
  Beverage(
    title: 'Tea',
    types: ['white', 'black', 'oolong', 'white', 'yellow'],
    salespersons: [
      Salesperson(name: 'Mirjan', status: 'Tea connoisseur'),
    ],
    description: Description(properties: [
      DescriptionItem(
        category: Category.water,
        total: 100.0,
        remain: 10.0,
        desc: 'teas',
      ),
      DescriptionItem(
        category: Category.degree,
        degree: 80.0,
        desc: 'degree C',
      ),
    ]),
  ),
  Beverage(
    title: 'Cold beverages',
    types: ['beer', 'cider', 'coke', 'sting'],
    salespersons: [
      Salesperson(name: 'Goran', status: 'Fulltime filler'),
      Salesperson(name: 'Ville', status: 'Creditcard man'),
    ],
    description: Description(properties: [
      DescriptionItem(
        category: Category.degree,
        degree: 4.0,
        desc: 'degree C',
      ),
      DescriptionItem(
        category: Category.coke,
        total: 100.0,
        remain: 10.0,
        desc: 'left',
      ),
      DescriptionItem(
        category: Category.beer,
        total: 100.0,
        remain: 90.0,
        desc: 'left',
      ),
      DescriptionItem(
        category: Category.cider,
        total: 100.0,
        remain: 20.0,
        desc: 'left',
      ),
      DescriptionItem(
        category: Category.heiniken,
        total: 100.0,
        remain: 50.0,
        desc: 'left',
      ),
      DescriptionItem(
        category: Category.sting,
        total: 100.0,
        remain: 35.0,
        desc: 'left',
      ),
    ]),
  ),
];
