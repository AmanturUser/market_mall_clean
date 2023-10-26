import 'package:flutter/material.dart';

Widget CardForSlide() {
  return Stack(
    fit: StackFit.passthrough,
    children: [
      Container(
        width: 332,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF313131),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x40000000).withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 6))
            ]),
        child: const Padding(
          padding: EdgeInsets.only(left: 14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                top: 17,
                right: 143,
              ),
              child: Text(
                'Кешбэка много не бывает',
                style: TextStyle(color: Colors.white, fontSize: 20),
                softWrap: true,
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: EdgeInsets.only(right: 112),
              child: Text(
                "Летай сколько угодно, получай за каждую покупку до 15%",
                style: TextStyle(color: Colors.white, fontSize: 12),
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 31,
            ),
            Text(
              'До 30.05.2023',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            SizedBox(
              height: 8,
            )
          ]),
        ),
      ),
      Positioned(
          bottom: 10,
          right: 8,
          child: Image.asset(
            'assets/img/kesh.png',
            height: 180,
            width: 122,
          ))
    ],
  );
}
