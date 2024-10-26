extension StringExtension on String? {

  String ucFirst(){
    return  '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }

  bool containsIgnoreCase(String? keyword) {
    if (this == null) {
      return false;
    } else {
      if (keyword == null) {
        return false;
      } else {
        return this!.toLowerCase().contains(keyword.toLowerCase());
      }
    }
  }


}
