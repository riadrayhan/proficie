class LanguageModel {
  String style;
  String lang;

  LanguageModel({
    required this.style,
    required this.lang,
  });
}

List<LanguageModel> language = [
  LanguageModel(
    style: "English",
    lang: "English",
  ),
  LanguageModel(
    style: "Bahasa Melayu",
    lang: "Malay",
  ),
  LanguageModel(
    style: "العربية",
    lang: "Arabic",
  ),
  LanguageModel(
    style: "Nederland",
    lang: "Dutch",
  ),
  LanguageModel(
    style: "Deutsch",
    lang: "Germany",
  ),
  LanguageModel(
    style: "Français",
    lang: "French",
  ),
  LanguageModel(
    style: "Italiano",
    lang: "Italian",
  ),
  LanguageModel(
    style: "Polanski",
    lang: "Polish",
  ),
  LanguageModel(
    style: "Svenska",
    lang: "Swedish",
  ),
];
