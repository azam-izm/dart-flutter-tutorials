**Q: Why does Flutter throw an error when adding a nested list inside children: in widgets like Column, Row, or Stack?**

Widgets like Column, Row, and Stack expect a flat list of widgets, but a nested list (List<List<Widget>>) causes a type mismatch.

🔧 Fix: Use the spread operator (...) to unpack lists inside children: or assign a generated list directly.

This rule applies to all collection-based widgets in Flutter, including ListView, Wrap, and GridView.

**===== Flutter Questions & Answers =====**

**Q: How can I set up routes in MaterialApp without using initialRoute or home?**

Use the routes property to map each screen to a named route, like this:
```
routes: {
  '/': (context) => const Screen1(),
  'screen2': (context) => const Screen2(),
  'screen3': (context) => const Screen3(),
}
```

**===== Flutter Questions & Answers =====**

**Q: What does Provider provide in Flutter, and what are its core features?**


Provider is a state management solution in Flutter that offers a simple and efficient way to manage app state, providing dependency injection, automatic widget rebuilding, and reactive programming to streamline data flow across the app.

**===== Flutter Questions & Answers =====**

**Q: What does Riverpod provide in Flutter, and what are its core features?**

Riverpod is a state management solution in Flutter that offers a more flexible and scalable alternative to Provider, providing features like better testability, compile-time safety, and the ability to manage state globally without relying on the widget tree.

**===== Flutter Questions & Answers =====**

**Q: What does GetX provide in Flutter, and what are its core features?**


GetX is a Flutter package that provides state management, route management, and dependency injection, offering reactive programming, easy navigation, and efficient handling of app states with minimal boilerplate code.

**===== Flutter Questions & Answers =====**

**Q: What does Bloc provide in Flutter, and what are its core features?**


Bloc (Business Logic Component) provides a predictable state management solution in Flutter, following the BLoC pattern. Its core features include separating business logic from UI, managing state through streams, and ensuring a clear flow of data with events and states, promoting scalability and testability.

**===== Flutter Questions & Answers =====**

**Q: What is the difference between Provider, GetX, Riverpod, and Bloc in terms of dependency injection and routing?**

Dependency Injection:
```
Provider and GetX provide built-in dependency injection features.
Riverpod and Bloc do not offer direct dependency injection; you can manage state but need external solutions for DI.
```
Routing:
```
GetX has built-in routing capabilities for easy navigation.
Provider, Riverpod, and Bloc do not handle routing and rely on Flutter's default Navigator or external routing libraries.
```

**===== Flutter Questions & Answers =====**
