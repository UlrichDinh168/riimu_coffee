import 'package:riimu_coffee/models/beverage_item.dart';
import 'package:riimu_coffee/models/beverage.dart';

final List<Beverage> beverages = [
  Beverage(
    title: 'Filter coffee',
    types: ['Arabica'],
    material: 'Coffees',
    themeImage: 'coffee',
    salespersons: [
      Salesperson(name: 'Anastasia', status: 'Filter is the thing'),
    ],
    description: Description(
      properties: [
        DescriptionItem(
          category: Category.info,
          desc: 'Kaffa Roastery - Herra Korppi',
        ),
        DescriptionItem(
          category: Category.cup,
          total: 100,
          remain: 20,
          desc: 'cups',
        ),
        DescriptionItem(
          category: Category.time,
          desc: 'Brewed 30 minutes ago',
        ),
      ],
    ),
    beverageItem: [
      BeverageSingleItem(
        title: 'Herra Coffee',
        description:
            '25% Colombia, San Lorenzo (arabica) 50%,Brazil, Fazenda Pinhal (arabica) 25% Guatemala, La Bolsa (arabica)',
        rating: 120,
        star: 3,
        image: 'bean_1',
      ),
      BeverageSingleItem(
          title: 'Lempeä voima',
          description:
              '50% Brasilia, Fazenda Pinhal (arabica) 35% Nicaragua, El Progreso (arabica) 15% Peru, Taza Limpia (arabica)',
          rating: 2,
          star: 4.5,
          image: 'bean_2')
    ],
  ),
  Beverage(
      title: 'Espresso',
      material: 'Beans',
      themeImage: 'beans',
      types: ['Arabica', 'Robusto'],
      salespersons: [
        Salesperson(name: 'Sebastian', status: 'Espressoking'),
      ],
      description: Description(properties: [
        DescriptionItem(
          category: Category.water,
          total: 100,
          remain: 20,
          desc: 'espressos',
        ),
        DescriptionItem(
          category: Category.bean,
          total: 100,
          remain: 90,
          desc: 'espressos',
        ),
        DescriptionItem(
          category: Category.clean,
          desc: 'Cleaned April 28th',
        ),
      ]),
      beverageItem: [
        BeverageSingleItem(
            title: 'Herra Coffee',
            description:
                '25% Colombia, San Lorenzo (arabica) 50%,Brazil, Fazenda Pinhal (arabica) 25% Guatemala, La Bolsa (arabica)',
            rating: 12,
            star: 4.5,
            image: 'bean_1'),
        BeverageSingleItem(
            title: 'Herra Coffee',
            description:
                '50% Brasilia, Fazenda Pinhal (arabica) 35% Nicaragua, El Progreso (arabica) 15% Peru, Taza Limpia (arabica)',
            rating: 12,
            star: 4.5,
            image: 'bean_2')
      ]),
  Beverage(
      title: 'Tea',
      material: 'Teas',
      themeImage: 'tea',
      types: ['White', 'Black', 'Oolong', 'White', 'Yellow'],
      salespersons: [
        Salesperson(name: 'Mirjan', status: 'Tea connoisseur'),
        Salesperson(name: 'Duong'),
      ],
      description: Description(properties: [
        DescriptionItem(
          category: Category.water,
          total: 100,
          remain: 10,
          desc: 'teas',
        ),
        DescriptionItem(
          category: Category.degree,
          degree: 80,
          desc: 'degree C',
        ),
      ]),
      beverageItem: [
        BeverageSingleItem(
            title: 'Indian Chai',
            description:
                'Musta tee, mate, kookosrouhe ja luontainen aromi (kardemumma, vanilja, kookos,  mustapippuri, chili)',
            rating: 102,
            star: 0.5,
            image: 'tea_1'),
        BeverageSingleItem(
            title: 'Herra Coffee',
            description:
                'Vihreä mate 88%, ananaspalat 4%, ruusun terälehdet 4%, inkivääri 2%, ginseng-juuri 1%  ginseng-öljy 1%.',
            rating: 120,
            star: 1,
            image: 'tea_2'),
        BeverageSingleItem(
            title: 'Herra Coffee',
            description:
                'Musta tee, sitruunapalat, kookospalat,  sitruuna-, passion- ja omena aromi.',
            rating: 12,
            star: 3.5,
            image: 'tea_3')
      ]),
  Beverage(
      title: 'Cold beverages',
      material: 'Teas',
      themeImage: 'beverages',
      types: ['Beer', 'Cider', 'Coke', 'Sting'],
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
          total: 100,
          remain: 10,
          desc: 'left',
        ),
        DescriptionItem(
          category: Category.beer,
          total: 100,
          remain: 90,
          desc: 'left',
        ),
        DescriptionItem(
          category: Category.cider,
          total: 100,
          remain: 20,
          desc: 'left',
        ),
        DescriptionItem(
          category: Category.heiniken,
          total: 100,
          remain: 50,
          desc: 'left',
        ),
        DescriptionItem(
          category: Category.sting,
          total: 100,
          remain: 35,
          desc: 'left',
        ),
      ]),
      beverageItem: [
        BeverageSingleItem(
            title: 'Herra Coffee',
            description:
                'Vesi, hiilidioksidi, väri (E150d), happamuuden säätöaineet (E338, E331), makeutusaineet  (aspartaami, asesulfaami K)',
            rating: 102,
            star: 4.5,
            image: 'drink_1'),
        BeverageSingleItem(
            title: 'Herra Coffee',
            description:
                'Vesi, hiilidioksidi, magnesiumsulfaatti,  kaliumbikarbonaatti, kalsiumkloridi,  kaliumsitraatti.',
            rating: 2,
            star: 3.5,
            image: 'drink_2'),
        BeverageSingleItem(
            title: 'Herra Coffee',
            description: '5.5 % Vermont-tyylinen IPA',
            rating: 54,
            star: 4,
            image: 'drink_3'),
        BeverageSingleItem(
            title: 'Herra Coffee',
            description:
                '8.0 % Puolikuiva, kellertävä, hapokas, vihero menainen, kevyen yrttinen, hunajainen,  hennon paahteinen',
            rating: 22,
            star: 2.5,
            image: 'drink_4'),
      ]),
];
