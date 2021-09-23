import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff17AB2F);
const Color kDarkBlueColor = Color(0xff2E3A59);
const Color kGreyColor = Color(0xffC5CEE0);
const Color kLightGreenColor = Color(0xff7DDC8D);

BoxDecoration kBoxDecoration = BoxDecoration(
  border: Border.all(color: kGreyColor),
  borderRadius: BorderRadius.circular(10),
);

BoxDecoration kWhiteBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [BoxShadow(color: Colors.grey)]);

const String kLoremIpsum =
    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.';
