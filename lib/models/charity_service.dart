// lib/models/charity_service.dart
import 'package:flutter/material.dart';

class CharityService {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String image;
  final String route;

  CharityService({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.image,
    required this.route,
  });
}
