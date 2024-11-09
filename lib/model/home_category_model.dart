class CategoryModel {
  String image_1;
  String name_1;
  String image_2;
  String name_2;

  CategoryModel({
    required this.image_1,
    required this.name_1,
    required this.image_2,
    required this.name_2,
  });
}

List<CategoryModel> category = [
  CategoryModel(
    image_1: "assets/icons/diamond.png",
    name_1: "Design",
    image_2: "assets/icons/home_face-id.png",
    name_2: "Animator",
  ),
  CategoryModel(
    image_1: "assets/icons/document-text.png",
    name_1: "Business",
    image_2: "assets/icons/home_analyst.png",
    name_2: "Analyst",
  ),
  CategoryModel(
    image_1: "assets/icons/home_technology.png",
    name_1: "Technology",
    image_2: "assets/icons/home_management.png",
    name_2: "Management",
  ),
  CategoryModel(
    image_1: "assets/icons/home_development.png",
    name_1: "Development",
    image_2: "assets/icons/home_more.png",
    name_2: "More",
  ),
];
