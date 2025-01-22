

// ignore_for_file: non_constant_identifier_names

import 'package:group_reservations/models_demo/goods_model.dart';



List <Good> get_goods (){
  return[


  Good(
    id: 1,
    name:'Gormahia T-Shirts - Black',
    subtitle: 'Sirkal',
    image_url: 'images/tshirts.jpeg',
    venue: 'Ds sports Kenya',
    start_date: '24-12-2024',
    end_date: '02-02-2025',
    description: 'The latests Gormahia T shirts for 2024 -25 season are now available at the DS house come grab yours today',
    sizes: [
      {
        'size':'S',
        'price_per_person': 2000,
        'max_number':10,
        'status':'Active'
      },
      {
        'size':'M',
        'price_per_person':3000,
        'max_number':20,
        'status':'Active'
      },
      {
        'size':'L',
        'price_per_person':4000,
        'max_number':20,
        'status':'Inactive'
      },
      {
        'size':'XL',
        'price_per_person':4500,
        'max_number':15,
        'status':'Active'
      }
    ], 

  ),
  
  
  Good(
    id: 2,
    name:'Gormahia T-shirts - Green',
    subtitle: 'sirkal',
    image_url: 'images/tshirt2.jpeg',
    venue: 'Nyayo statium',
    start_date: '24-12-2024',
    end_date: '13-02-2025',
    description: 'The latests Gormahia T shirts for 2024 -25 season are now available at the DS house come grab yours today',
    sizes: [
      {
        'size':'S',
        'price_per_person': 2000,
        'max_number':10,
        'status':'Active'
      },
      {
        'size':'M',
        'price_per_person':3000,
        'max_number':20,
        'status':'Active'
      },
      {
        'size':'L',
        'price_per_person':4000,
        'max_number':20,
        'status':'Inactive'
      },
      {
        'size':'XL',
        'price_per_person':4500,
        'max_number':15,
        'status':'Active'
      }
    ], 

  ),
  
  
  Good(
    id: 2,
    name:'Gormahia T-shirts -   Blue',
    subtitle: 'Sirkal',
    image_url: 'images/tshirts.jpeg',
    venue: 'kasarani sports stadium',
    start_date: '24-12-2024',
    end_date: '14-05-2025',
    description: 'The latests Gormahia T shirts for 2024 -25 season are now available at the DS house come grab yours today',
    sizes: [
      {
        'size':'S',
        'price_per_person': 2000,
        'max_number':10,
        'status':'Active'
      },
      {
        'size':'M',
        'price_per_person':3000,
        'max_number':20,
        'status':'Active'
      },
      {
        'size':'L',
        'price_per_person':4000,
        'max_number':20,
        'status':'Inactive'
      },
      {
        'size':'XL',
        'price_per_person':4500,
        'max_number':15,
        'status':'Active'
      }
    ], 

  ),



  ];
}