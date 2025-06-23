const String bookingType = "يُحدد هذا الخيار طريقة حجز المقاعد في رحلتك:\n\n"
    "• أي شخص: يُمكن للركاب الحجز فورًا دون انتظار الموافقة\n"
    "• بعد الموافقة: يتطلب كل حجز موافقتك المسبقة قبل التأكيد";

String botomBarHomeTitles(int index) {
  switch (index) {
    case 0:
      return "Home";
    case 1:
      return "Search";
    case 2:
      return "Likes";
    case 3:
      return "Profile";
    default:
      return "";
  }
}
