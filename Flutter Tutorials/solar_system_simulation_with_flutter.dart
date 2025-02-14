/**
 * Solar System Simulation with Flutter
 *
 * This Flutter application simulates a simplified solar system where the Sun remains stationary at the center of the screen,
 * while the planets orbit around it. Each planet has a unique orbit radius, size, color, and speed, mimicking the natural
 * behavior of celestial bodies in our solar system. The simulation includes a starry background for a cosmic aesthetic,
 * and Saturn is given a unique ring effect to distinguish it from other planets.
 *
 * The simulation is built using Flutter's animation and custom painting capabilities. The `Planet` class defines the properties
 * of each planet, such as its orbit radius, size, color, and speed. The `OrbitWidget` class manages the animation and updates
 * the positions of the planets over time, while the `CelestialPainter` class handles the rendering of the Sun, planets, and
 * background stars.
 *
 * Key Features:
 * - Static Sun positioned at the center of the screen.
 * - Planets orbit the Sun in circular paths with varying speeds.
 * - Saturn is rendered with rings for added realism.
 * - Starry background enhances the visual appeal of the simulation.
 *
 * This simulation is a great example of using Flutter's animation and custom painting features to create visually engaging
 * and interactive applications. It can be extended further by adding more celestial objects, improving the physics, or
 * allowing user interaction.
 *
 * Author: Muhammad Azam
 * Date: 14 feb 2025
 */


// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const SolarSystem());

class SolarSystem extends StatelessWidget {
  const SolarSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: OrbitWidget(),
        ),
      ),
    );
  }
}

class Planet {
  final String name;
  final double orbitRadius;
  final double radius;
  final Color color;
  final double speed;
  double angle;

  Planet({
    required this.name,
    required this.orbitRadius,
    required this.radius,
    required this.color,
    required this.speed,
    this.angle = 0.0,
  });
}

class OrbitWidget extends StatefulWidget {
  const OrbitWidget({super.key});

  @override
  _OrbitWidgetState createState() => _OrbitWidgetState();
}

class _OrbitWidgetState extends State<OrbitWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Planet> planets;
  final Offset sunPosition = const Offset(200, 200);

  @override
  void initState() {
    super.initState();

    planets = [
      Planet(
        name: 'Mercury',
        orbitRadius: 50.0,
        radius: 6.0,
        color: const Color(0xFFA0522D),
        speed: 0.12,
      ),
      Planet(
        name: 'Venus',
        orbitRadius: 80.0,
        radius: 8.5,
        color: const Color(0xFFFFD700),
        speed: 0.09,
      ),
      Planet(
        name: 'Earth',
        orbitRadius: 120.0,
        radius: 9.0,
        color: const Color(0xFF0000FF),
        speed: 0.07,
      ),
      Planet(
        name: 'Mars',
        orbitRadius: 160.0,
        radius: 7.5,
        color: const Color(0xFFFF0000),
        speed: 0.05,
      ),
      Planet(
        name: 'Jupiter',
        orbitRadius: 220.0,
        radius: 20.0,
        color: const Color(0xFFDAA520),
        speed: 0.03,
      ),
      Planet(
        name: 'Saturn',
        orbitRadius: 270.0,
        radius: 18.0,
        color: const Color(0xFFCD853F),
        speed: 0.02,
      ),
      Planet(
        name: 'Uranus',
        orbitRadius: 310.0,
        radius: 12.0,
        color: const Color(0xFF87CEEB),
        speed: 0.015,
      ),
      Planet(
        name: 'Neptune',
        orbitRadius: 350.0,
        radius: 11.0,
        color: const Color(0xFF000080),
        speed: 0.01,
      ),
    ];

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _controller.addListener(() {
      setState(() {
        for (var planet in planets) {
          planet.angle += planet.speed;
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CelestialPainter(sunPosition, planets),
      size: const Size(400, 400),
    );
  }
}

class CelestialPainter extends CustomPainter {
  final Offset sunPosition;
  final List<Planet> planets;

  CelestialPainter(this.sunPosition, this.planets);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw starry background
    final paint = Paint()..color = Colors.white.withOpacity(0.1);
    final random = Random();
    for (int i = 0; i < 200; i++) {
      canvas.drawCircle(
        Offset(random.nextDouble() * size.width,
            random.nextDouble() * size.height),
        random.nextDouble() * 1.5,
        paint,
      );
    }

    // Draw Sun with glowing effect
    final sunPaint = Paint()
      ..shader = const RadialGradient(
        colors: [Colors.yellowAccent, Colors.orange],
        stops: [0.7, 1.0],
      ).createShader(Rect.fromCircle(center: sunPosition, radius: 40))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);
    canvas.drawCircle(sunPosition, 40, sunPaint);

    // Draw planets
    for (final planet in planets) {
      // Draw orbit path
      final orbitPaint = Paint()
        ..color = Colors.white24
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5;
      canvas.drawCircle(sunPosition, planet.orbitRadius, orbitPaint);

      // Calculate planet position
      final planetX = sunPosition.dx + planet.orbitRadius * cos(planet.angle);
      final planetY = sunPosition.dy + planet.orbitRadius * sin(planet.angle);
      final planetPos = Offset(planetX, planetY);

      // Draw planet
      final planetPaint = Paint()
        ..shader = RadialGradient(
                colors: [planet.color, planet.color.withOpacity(0.7)])
            .createShader(
                Rect.fromCircle(center: planetPos, radius: planet.radius));
      canvas.drawCircle(planetPos, planet.radius, planetPaint);

      // Add Saturn's rings
      if (planet.name == 'Saturn') {
        final ringPaint = Paint()
          ..color = Colors.grey.withOpacity(0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
        canvas.drawCircle(planetPos, planet.radius + 8, ringPaint);
        canvas.drawCircle(planetPos, planet.radius + 12, ringPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
