import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationBar() {
  return BottomNavigationBar(
      currentIndex: 1,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: '',
          icon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/Icons/home.png')),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Image.asset(
            'assets/Icons/ticket.png',
            width: 16,
            height: 16,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Image.asset(
            'assets/Icons/heart.png',
            width: 16,
            height: 16,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Image.asset(
            'assets/Icons/people.png',
            width: 16,
            height: 16,
          ),
        ),
      ]);
}
