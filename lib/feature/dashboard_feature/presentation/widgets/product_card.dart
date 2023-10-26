import 'package:flutter/material.dart';
import 'package:market_mall_flutter_bloc/core/constants/api_constants.dart';

Widget ProductCard(String? image, double rat, String name, String cat,
    String productId, String email) {
  List<String> nameAndDescription = [
    name.split('name').first,
    name.split('name').last
  ];
  return InkWell(
    onTap: () {
      // AboutMagaz(productId: productId, email: email, checkUserPage: false);
    },
    child: Ink(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 2.5, color: Color(0xFF929292).withOpacity(0.37)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7,
                      offset: Offset(0, 6),
                      color: Color(0x33000000))
                ],
                image: image != null
                    ? DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage('http://$ip/$image'))
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/hotKesh/kesh0.jpg'))),
          ),
          SizedBox(height: 12),


          Container(
            child: Text(
              nameAndDescription[0],
              style: TextStyle(color: Color(0xFF313131), fontSize: 16),
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(height: 5),
          Text(
            cat == 'null' ? "Договорная" : cat.split('.').first + ' сом',
            style: TextStyle(color: Colors.orange, fontSize: 14),
          )
        ],
      ),
    ),
  );
}
