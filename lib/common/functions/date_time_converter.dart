DateTime? timeStamptoDateTimeConverter(String? formatedTimeStamp) {
  try {
    if (formatedTimeStamp != null) {
      DateTime formatedDate = DateTime.parse(formatedTimeStamp);
      return formatedDate;
    }
    return null;
  } catch (e) {
    return null;
  }
}
