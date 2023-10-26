import 'package:flutter/material.dart';
import 'package:market_mall_flutter_bloc/core/constants/api_constants.dart';

Widget Category(String id,String name, String image) {
  return GestureDetector(
    onTap: () {
      // CategoryProducts(categoryId: id,categoryName: name);
    },
    child: Container(
      width: 89,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1A000000).withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 4)),
                ],
                border: Border.all(
                    width: 0.5, color: Color(0xFF929292).withOpacity(0.37)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Image.network(
                'http://$ip/$image',
                height: 22,
                width: 22,
              ),
            ),
          ),
          SizedBox(height: 13),
          Text(
            name,
            style: TextStyle(color: Colors.black, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}