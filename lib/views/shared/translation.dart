mixin AppLocale {
  static const String beverages = 'beverages';
  static const String loading = 'loading';
  static const String filterBeverages = 'filterBeverages';
  static const String currentLanguage = 'currentLanguage';

  static const Map<String, dynamic> en = {
    beverages: 'Beverages',
    loading: 'Loading \nprototype',
    filterBeverages: 'Select beverages to display',
    currentLanguage: 'Current language',
  };
  static const Map<String, dynamic> vi = {
    beverages: 'Thức uống',
    loading: 'Khởi chạy\nứng dụng',
    filterBeverages: 'Lọc thức uống',
    currentLanguage: 'Ngôn ngữ hiện tại',
  };
}
