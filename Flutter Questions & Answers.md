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
