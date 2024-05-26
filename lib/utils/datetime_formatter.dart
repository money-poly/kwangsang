enum DateTimeStrType {
  korean,
  slash,
}

String dateToStr(DateTimeStrType type, DateTime dateTime) {
  switch (type) {
    case DateTimeStrType.korean:
      return '${dateTime.year}년 ${dateTime.month}월 ${dateTime.day}일';
    case DateTimeStrType.slash:
      return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
  }
}
