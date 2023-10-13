import 'package:riimu_coffee/models/filter_coffee.dart';

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
        amount: 100,
        remain: 20,
        desc: '5 normal cups',
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
        amount: 100,
        remain: 20,
        desc: 'espressos',
      ),
      DescriptionItem(
        category: Category.bean,
        amount: 100,
        remain: 90,
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
        amount: 30,
        remain: 10,
        desc: 'teas',
      ),
      DescriptionItem(
        category: Category.degree,
        degree: 80,
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
        degree: 4,
        desc: 'degree C',
      ),
      DescriptionItem(
        category: Category.coke,
        amount: 100,
        remain: 20,
        desc: 'left',
      ),
      DescriptionItem(
        category: Category.beer,
        amount: 100,
        remain: 20,
        desc: 'left',
      ),
      DescriptionItem(
        category: Category.cider,
        amount: 100,
        remain: 20,
        desc: 'left',
      ),
      DescriptionItem(
        category: Category.heiniken,
        amount: 100,
        remain: 20,
        desc: 'left',
      ),
      DescriptionItem(
        category: Category.sting,
        amount: 100,
        remain: 20,
        desc: 'left',
      ),
    ]),
  ),
];
