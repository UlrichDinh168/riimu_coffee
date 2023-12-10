mixin AppLocale {
  static const String beverages = 'beverages';
  static const String available = 'available';
  static const String averageConsumption = 'averageConsumption';
  static const String loading = 'loading';
  static const String filterBeverages = 'filterBeverages';

  static const Map<String, dynamic> en = {
    beverages: 'Beverages',
    averageConsumption: 'Daily average consumption',
    loading: 'Loading \nprototype',
    filterBeverages: 'Filter beverages',
  };
  static const Map<String, dynamic> vi = {
    beverages: 'Thức uống',
    averageConsumption: 'Tiêu thụ trung bình',
    loading: 'Khởi chạy\nứng dụng',
    filterBeverages: 'Lọc thức uống',
  };
}
