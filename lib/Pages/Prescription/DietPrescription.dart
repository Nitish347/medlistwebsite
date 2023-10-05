import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/dropdown.dart';


class DietPrescription extends StatefulWidget {
  const DietPrescription({Key? key}) : super(key: key);

  @override
  State<DietPrescription> createState() => _DietPrescriptionState();
}

class _DietPrescriptionState extends State<DietPrescription> {
  List tabs = [1, 1, 1, 1, 1, 1];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(010),
        child: Container(
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 10.0,
                ),
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 10.0)
              ],
              // border: Border.all(
              //     // color: Colors.green,
              //     ),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.005,
                  ),
                  MedicineBlockTitle(height, width),
                  Column(
                    children: List.generate(tabs.length, (index) {
                      return MedicineBlock(height, width);
                    }),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    width: width * 0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              tabs.add(1);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.05,
                            width: width * 0.08,
                            decoration: BoxDecoration(
                                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "Add More +",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: width * 0.01,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.05,
                                width: width * 0.07,
                                decoration: BoxDecoration(
                                    color: Colors.red, borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Clear All",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: width * 0.01,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.05,
                                width: width * 0.07,
                                decoration: BoxDecoration(
                                    color: Colors.green, borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Save",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: width * 0.01,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget medicineTextField(String hint, double height, double width) {
  return Container(
    width: width * 0.3,
    child: TextField(
      decoration: InputDecoration(
        counterText: "",
        hintText: hint,
        filled: true,
        fillColor: Colors.blueGrey[50],
        labelText: hint,
        labelStyle: GoogleFonts.poppins(fontSize: height * 0.018, color: Colors.green),
        hintStyle:
            GoogleFonts.poppins(fontSize: height * 0.019, color: Colors.grey.withOpacity(0.8)),
        contentPadding: EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}

Widget MedicineBlock(double? height, double? width) {
  List<String> indianHealthyDishes = [
    "",
    'Tandoori Chicken',
    'Grilled Fish Tikka',
    'Masoor Dal (Red Lentil Curry)',
    'Palak Paneer (Spinach and Cottage Cheese)',
    'Bhindi Masala (Okra Curry)',
    'Chana Masala (Chickpea Curry)',
    'Vegetable Biryani',
    'Baingan Bharta (Roasted Eggplant Curry)',
    'Lauki (Bottle Gourd) Soup',
    'Matar Paneer (Peas and Cottage Cheese)',
    'Moong Dal Khichdi (Lentil and Rice Porridge)',
    'Methi Thepla (Fenugreek Flatbread)',
    'Chana Saag (Chickpeas with Spinach)',
    'Cabbage Thoran (Stir-fried Cabbage)',
    'Tofu Tikka',
    'Poha (Flattened Rice with Vegetables)',
    'Rajma (Kidney Bean Curry)',
    'Sabudana Khichdi (Tapioca Pearl Pilaf)',
    'Karela Sabzi (Bitter Gourd Stir-fry)',
    'Aloo Gobi (Potato and Cauliflower)',
    'Kalaadi (Paneer-like Cheese from Jammu)',
    'Moong Dal Chilla (Lentil Pancakes)',
    'Chicken Tikka Salad',
    'Tamarind Chutney',
    'Ragi Roti (Finger Millet Flatbread)',
    'Gajar Ka Halwa (Carrot Pudding)',
    'Masala Oats',
    'Papaya Salad',
    'Chole Bhature (Chickpea Curry with Fried Bread)',
    'Baingan Bharwa (Stuffed Eggplant)',
    'Methi Paratha (Fenugreek Flatbread)',
    'Dal Makhani (Creamy Lentil Curry)',
    'Tandoori Shrimp',
    'Spinach Soup',
    'Bharwa Karela (Stuffed Bitter Gourd)',
    'Aloo Methi (Potatoes with Fenugreek Leaves)',
    'Moong Dal Tadka (Tempered Split Yellow Lentils)',
    'Tofu Bhurji (Scrambled Tofu)',
    'Dhokla (Steamed Gram Flour Cake)',
    'Beetroot Salad',
    'Tinda Masala (Apple Gourd Curry)',
    'Chicken Kebabs',
    'Sarson Da Saag (Mustard Greens Curry)',
    'Spinach and Mushroom Stir-fry',
    'Jeera Rice (Cumin Flavored Rice)',
    'Cucumber Raita',
    'Paneer Tikka Masala',
    'Methi Thepla (Fenugreek Flatbread)',
    'Kalaadi Masala (Spiced Jammu Cheese)',
    'Tandoori Mushroom',
    'Sabudana Vada (Tapioca Fritters)',
    'Aloo Palak (Potatoes with Spinach)',
    'Chicken Soup',
    'Mixed Vegetable Sabzi (Stir-fried Vegetables)',
    'Raita (Yogurt with Cucumber and Spices)',
    'Baingan Bharta (Roasted Eggplant Dip)',
    'Moong Dal Salad',
    'Tandoori Broccoli',
    'Sprout Salad',
    'Methi Rice (Fenugreek Rice)',
    'Tofu Stir-fry',
    'Cabbage and Carrot Salad',
    'Mushroom Tikka',
    'Malai Kofta (Creamy Vegetable Dumplings)',
    'Masoor Dal Soup',
    'Palak Paratha (Spinach Flatbread)',
    'Stuffed Capsicum (Bell Pepper)',
    'Aloo Gajar Sabzi (Potato and Carrot Curry)',
    'Fish Curry',
    'Vegetable Pulao',
    'Curd Rice',
    'Paneer Bhurji (Scrambled Cottage Cheese)',
    'Baingan Pakora (Eggplant Fritters)',
    'Tofu and Vegetable Stir-fry',
    'Gajar Methi Sabzi (Carrot and Fenugreek Curry)',
    'Chicken Biryani',
    'Vegetable Upma',
    'Bhindi Raita (Okra Yogurt Dip)',
    'Dal Fry (Tempered Lentils)',
    'Palak Puri (Spinach Flavored Fried Bread)',
    'Aloo Baingan (Potato and Eggplant Curry)',
    'Masoor Dal Khichdi (Lentil and Rice Porridge)',
    'Tandoori Salmon',
    'Spinach and Lentil Soup',
    'Keema Matar (Minced Meat with Peas)',
    'Vegetable Seekh Kebabs',
    'Aloo Methi Paratha (Potato and Fenugreek Flatbread)',
    'Dahi Puri (Yogurt-Filled Puffed Bread)',
  ];
  List<String> indianFruits = [
    "",
    'Aguaje (Mauritia flexuosa)',
    'Aloe Vera',
    'Aonla (Indian Gooseberry)',
    'Apple',
    'Apricot',
    'Bael Fruit (Wood Apple)',
    'Bael Fruit (Wood Apple)',
    'Banana',
    'Ber',
    'Bilimbi',
    'Black Sapote',
    'Blackberry',
    'Blueberry',
    'Breadfruit',
    'Buddha\'s Hand',
    'Cactus Pear (Prickly Pear)',
    'Carissa (Karonda)',
    'Carambola (Starfruit)',
    'Celeriac (Celery Root)',
    'Chebulic Myrobalan (Haritaki)',
    'Cherry',
    'Cherimoya (Custard Apple)',
    'Chikoo (Sapodilla)',
    'Clementine',
    'Coconut',
    'Cordia (Lasora)',
    'Cranberry',
    'Cucumber',
    'Custard Apple',
    'Custard Apple (Sitaphal)',
    'Date Palm',
    'Dragon Fruit (Pitaya)',
    'Durian',
    'Elephant Apple (Chalta)',
    'Feijoa',
    'Fig',
    'Falsa (Phalsa)',
    'Falsa (Phalsa)',
    'Grapes',
    'Guava',
    'Indian Barberry (Kilmora)',
    'Indian Fig (Prickly Pear)',
    'Indian Gooseberry (Amla)',
    'Indian Plum (Ber)',
    'Jujube (Ber)',
    'Jungle Jalebi (Pithecellobium dulce)',
    'Kiwano (Horned Melon)',
    'Kiwi',
    'Kokum',
    'Kokum',
    'Kundru (Ivy Gourd)',
    'Kuruba (Malabar Plum)',
    'Langsat (Lansium parasiticum)',
    'Lemon',
    'Lime',
    'Litchi',
    'Longan',
    'Lychee',
    'Lychee',
    'Mala Mooti (Screw Pine)',
    'Malay Apple (Syzygium malaccense)',
    'Mango',
    'Mango Ginger (Amba Haldi)',
    'Mara Puli (Velvet Tamarind)',
    'Morus (Mulberry)',
    'Muskmelon',
    'Naseberry (Sapodilla)',
    'Nectarine',
    'Orange',
    'Papaya',
    'Peach',
    'Pepino',
    'Pineapple',
    'Pitanga (Surinam Cherry)',
    'Pomegranate',
    'Pummelo',
    'Rambutan',
    'Raspberry',
    'Santol (Wild Mangosteen)',
    'Sapodilla (Chikoo)',
    'Sapota (Chikoo)',
    'Sea Buckthorn',
    'Soursop (Graviola)',
    'Star Gooseberry (Phyllanthus acidus)',
    'Starfruit (Carambola)',
    'Strawberry',
    'Surinam Cherry (Pitanga)',
    'Sweet Lime (Mosambi)',
    'Tadgola (Ice Apple)',
    'Tamarillo (Tree Tomato)',
    'Tamarind',
    'Tangerine',
    'Ugli Fruit',
    'Velvet Tamarind (Mara Puli)',
    'Wampee',
    'Watermelon',
    'Wild Jackfruit (Anchovy Pear)',
    'Wood Apple (Bael Fruit)',
    'Wood Apple (Bael Fruit)',
    'Yellow Passion Fruit',
    'Yuzu',
  ];

  return Padding(
    padding: EdgeInsets.only(bottom: height! * 0.025),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "1.",
          style: GoogleFonts.poppins(fontSize: height! * 0.025, fontWeight: FontWeight.w400),
        ),
        dropdown(indianFruits, "Fruits", width! * 2.5),
        dropdown(indianHealthyDishes, "Medicine", width! * 2.5),
      ],
    ),
  );
}

Widget MedicineBlockTitle(double height, double width) {
  return Padding(
    padding: EdgeInsets.only(bottom: height * 0.025),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.065,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            height: height * 0.05,
            width: width * 0.1,
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(50)),
            child: Text(
              " Previous Diet ",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: width * 0.008,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.1,
        ),
        Text(
          "Fruits",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: width * 0.02,
          ),
        ),
        SizedBox(
          width: width * 0.3,
        ),
        Text(
          "Diets",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: width * 0.02,
          ),
        ),
      ],
    ),
  );
}
