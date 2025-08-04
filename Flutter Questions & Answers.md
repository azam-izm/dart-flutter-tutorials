**Q: WHAT IS HIVE IN FLUTTER?**

Hive is a fast and lightweight key-value NoSQL database for storing both simple and complex structured data locally in Flutter.

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT IS SHAREDPREFERENCES?**

 `SharedPreferences` is a key-value storage used to save small, simple data like user preferences locally on the device.
 
**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: MOST COMMONLY USED FIREBASE COMMANDS IN FLUTTER for FIRESTORE and REALTIME DATABASE**

🔥 **Cloud Firestore**

Add Data
```
FirebaseFirestore.instance.collection('collection_name').add({
  'key': 'value',
});
```

Update Data
```
FirebaseFirestore.instance.collection('collection_name').doc('document_id').update({
  'key': 'new_value',
});
```

Set Data (add or overwrite)
```
FirebaseFirestore.instance.collection('collection_name').doc('document_id').set({
  'key': 'value',
});
```

Delete Data
```
FirebaseFirestore.instance.collection('collection_name').doc('document_id').delete();
```

Read Data Once (FutureBuilder)
```
FirebaseFirestore.instance.collection('collection_name').get();
```

Real-time Data (StreamBuilder)
```
FirebaseFirestore.instance.collection('collection_name').snapshots();
```

🔄 **Realtime Database**

Add or Set Data
```
FirebaseDatabase.instance.ref('path_name').set({
  'key': 'value',
});
```

Update Data
```
FirebaseDatabase.instance.ref('path_name').update({
  'key': 'new_value',
});
```

Delete Data
```
FirebaseDatabase.instance.ref('path_name').remove();
```

Read Data Once (FutureBuilder)
```
FirebaseDatabase.instance.ref('path_name').once();
```

Real-time Data (StreamBuilder)
```
FirebaseDatabase.instance.ref('path_name').onValue;
```

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: DIFFERENCE BETWEEN FIRESTORE DATABASE (CLOUD FIRESTORE) AND REALTIME DATABASE.**

```
| Feature               | Firestore                                     | Realtime Database                            |
|-----------------------|-----------------------------------------------|----------------------------------------------|
| Type                  | Newer, advanced alternative                   | Older, simpler database                      |
| Data Format           | Documents & Collections (structured)          | JSON tree (unstructured)                     |
| Flexibility           | Highly flexible                               | Limited flexibility                          |
| Scalability           | Horizontally scalable                         | Less scalable                                |
| Speed (Large Apps)    | Generally faster                              | Slower as data grows                         |
| Offline Support       | Web, Android, iOS (local cache)               | Android & iOS only                           |
| Querying              | Advanced, indexed queries                     | Basic queries only                           |
| Use Case              | Complex, scalable apps                        | Simple real-time apps                        |
```

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT IS THE PURPOSE OF EACH PART OF A DART MODEL CLASS WHEN WORKING WITH JSON DATA?**

Fields               -> Store data inside the object (e.g., int? id, String? quote, etc.) <br>
ModelClass({...})    -> Used to create an object manually by passing values directly<br>
ModelClass.fromJson  -> Used to create an object from JSON (usually when receiving data from an API)<br>
toJson()             -> Used to convert the object back into a JSON/map (usually when sending data to an API)

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: CAN WE GUESS THE EXACT JSON FORMAT JUST BY LOOKING AT A DART MODEL CLASS?**

No. The model class only shows the structure of a single item — not the full API response.

**Dart Model:**
```
class Post {
  int? userId;
  int? id;
  String? title;
  String? body;
}
```

Possible JSON Responses:

**1. Single object:**
```
{
  "userId": 1,
  "id": 1,
  "title": "Sample Title",
  "body": "Post body"
}
```
**2. List of objects:**
```
[
  { "userId": 1, "id": 1, "title": "Title", "body": "..." },
  { "userId": 2, "id": 2, "title": "Title", "body": "..." }
]
```
**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: HOW DO I CONVERT A LIST OF JSON OBJECTS FROM AN API RESPONSE INTO A LIST OF MODEL CLASS OBJECTS IN DART, AND HOW DO I PROPERLY FETCH THIS DATA FROM AN API?**

To convert a list of JSON objects from an API response into a list of ModelClass objects in Dart, you need to fetch the data, parse the JSON response, and map each JSON object to a ModelClass instance. Below is a straightforward solution using the provided ModelClass and API fetching code.

```
import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelClass {
  int? userId;
  int? id;
  String? title;
  String? body;

  ModelClass({this.userId, this.id, this.title, this.body});

  ModelClass.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}

Future<List<ModelClass>> fetchData() async {
  try {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ModelClass.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}
```
Explanation:
```
data.map((json) => ModelClass.fromJson(json)).toList(); 
this line 👆 transforms a list of JSON objects into a list of ModelClass objects

list 👇 of JSON objects
[
  {"userId": 1, "id": 1, "title": "Post 1", "body": "Body 1"},
  {"userId": 1, "id": 2, "title": "Post 2", "body": "Body 2"}
]


The line data.map((json) => ModelClass.fromJson(json)).toList():
Iterates over each JSON object in the list.

Calls ModelClass.fromJson for each object, creating:

list 👇 of ModelClass objects
ModelClass(userId: 1, id: 1, title: "Post 1", body: "Body 1")
ModelClass(userId: 1, id: 2, title: "Post 2", body: "Body 2")

Returns a list: [ModelClass(...), ModelClass(...)].
```
**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: HOW TO DETERMINE THE NUMBER OF MODEL CLASSES REQUIRED BASED ON ITS STRUCTURE?**

To determine the number of Dart model classes needed, count the nested objects in the JSON. Each object (or array of objects) requires a separate class to map its fields. Lists of primitive types (e.g., strings, integers) don’t need a class; use List<String>, List<int>, etc. Below are clear examples showing when one, two, or three classes are needed.

**1. One Class is Enough**

**When:** The JSON is flat, with no nested objects or arrays.

**Example JSON:**
```
{
  "id": 1,
  "quote": "Your heart is the size of an ocean.",
  "author": "Rumi"
}
```
**Explanation:** A single object with simple fields (id, quote, author) needs one class.

**2. Two Classes are Enough**

**When:** The JSON has a top-level object containing a list of objects.

**Example JSON:**
```
{
  "quotes": [
    {"id": 1, "quote": "Your heart is the size of an ocean.", "author": "Rumi"},
    {"id": 2, "quote": "Thinking is the capital.", "author": "Abdul Kalam"}
  ],
  "total": 1454
}
```
**Explanation:** The top-level object (quotes, total) needs one class. The quotes array contains objects, so a second class maps id, quote, and author.

**3. Three Classes are Needed**

**When:** The JSON has multiple levels of nesting, such as objects or arrays of objects inside objects.

**Example JSON:**
```
{
  "quotes": [
    {
      "id": 1,
      "quote": "Your heart is the size of an ocean.",
      "author": {"name": "Rumi", "birthYear": 1207}
    }
  ],
  "total": 1454
}
```
**Explanation:** Three classes are needed: one for the top-level (quotes, total), one for the quotes array objects (id, quote, author), and one for the nested author object (name, birthYear).

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT IS A DEVICE TOKEN?**

A device token is a unique identifier generated by Firebase for each app instance on a device. It allows Firebase to target that specific device when sending push notifications.

===== Flutter Questions & Answers ===== ===== Flutter Questions & Answers ===== ===== Flutter Questions & Answers =====

**Q: WHAT IS THE DIFFERENCE BETWEEN HANDLING JSON WRAPPED IN {} AND [] WHEN CALLING AN API, AND HOW DOES IT AFFECT THE MODEL CLASS IN DART?**

When the JSON is wrapped in {} (an object), the response is parsed directly into a single model instance (e.g., ModelName.fromJson(data)). For JSON wrapped in [] (an array), you return a List<ModelName> and use .map() to iterate through the array and convert each item into a model instance. In both cases, the model class remains the same; the difference lies in how you process the response:

{} → Single object

[] → List with .map() method

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: HOW CAN A SINGLE EVENT IN A FLUTTER BLOC MANAGE TWO STATE VARIABLES, LIKE TRACKING A PROCESS AND A COUNTER, AND DISPLAY THEM IN THE UI?**

A single event in a Flutter BLoC can manage two state variables by defining a state class with multiple fields, like `bool isProcessing` and `int actionCount` and updating them in the event handler. For example, in an `AppBloc`, a `PerformActionEvent` can emit a new state with `isProcessing: true` and `actionCount` incremented, then later emit `isProcessing: false` after a delay, using `copyWith` to modify the `AppState`. The UI, via `BlocBuilder`, can display both simultaneously showing a spinner when `isProcessing` is true and the updated `actionCount` as text demonstrating how one event can control multiple states for a richer interface.

```
// Event
abstract class AppEvent {}
class PerformActionEvent extends AppEvent {}

// State with two variables
class AppState {
  final bool isProcessing;    // First state variable
  final int actionCount;      // Second state variable

  AppState({required this.isProcessing, required this.actionCount});

  AppState copyWith({bool? isProcessing, int? actionCount}) {
    return AppState(
      isProcessing: isProcessing ?? this.isProcessing,
      actionCount: actionCount ?? this.actionCount,
    );
  }
}

// Bloc with one event
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState(isProcessing: false, actionCount: 0)) {
    on<PerformActionEvent>((event, emit) async {

      emit(state.copyWith(isProcessing: true, actionCount: state.actionCount + 1));

      await Future.delayed(const Duration(milliseconds: 500));

      emit(state.copyWith(isProcessing: false));
    });
  }
}
```

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT IS EQUATABLE AND WHAT DOES IT DO?**

**Equatable:** Value equality, compares objects by properties, not memory address. <br>
**Does:** Helps Bloc compare states, prevents unnecessary state emits, avoids redundant UI rebuilds. <br>

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: How can I initialize a BLoC in Flutter with an event to trigger an action immediately after creation, and what’s the proper syntax for doing so in a BlocProvider?**

You can initialize a BLoC with an event using the cascade operator (..) in a BlocProvider. 
For example:
```
BlocProvider<CounterBloc>(
  create: (context) => CounterBloc()..add(IncrementEvent()),
  child: MyWidget(),
)
```
This creates the CounterBloc and immediately dispatches the IncrementEvent, triggering the associated logic (e.g., incrementing a counter) as soon as the BLoC is instantiated. Ensure your BLoC’s event handler is set up to process the event correctly.

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: DOES Get.put(ControllerClassName) IN GETX WORK LIKE context.read or context.watch IN PROVIDER, OR ref.read or ref.watch IN RIVERPOD?**

No, Get.put(ControllerClassName) is used for dependency injection, while context.read, context.watch, ref.read, and ref.watch are used to access or listen to state within a specific scope or widget.

```
Get.put is for registering and injecting dependencies globally.

context.read and context.watch (Provider) or ref.read and ref.watch (Riverpod) are for reading and
listening to state changes, but they are used differently.
```

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHY IS IT NOT ALLOWED TO SPECIFY TYPE PARAMETERS (GENERICS) IN RIVERPOD’S CONSUMERWIDGET, BUT NECESSARY IN PROVIDER?**

Providers require generics to define the data type they hold for type safety, while ConsumerWidget doesn’t need them because it infers types directly from the provider via ref.watch/ref.read, avoiding redundancy since the provider (source of truth) already enforces the type.

In Provider:
```
Consumer<MyProvider>(
  builder: (context, myProvider, child) {
    // Access the state from the provider
    return Text(myProvider.someState); // OR  Text(context.watch<MyProvider>().someState); 
  },
);

In Provider, you can access the state using context.read() or context.watch(). In contrast,
Riverpod requires the use of ref.watch() or ref.read() to manage the state.
```

In Riverpod:
```
ConsumerWidget(
  builder: (context, ref, child) {
    final state = ref.watch(myProvider);
    return Text(state);
  },
);
```

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT IS THE DIFFERENCE BETWEEN onSubmitted AND TextEditingController IN FLUTTER, AND WHEN SHOULD EACH BE USED?**

Controllers allow direct access to input values.  Without a controller, we’d need to store the text manually on every change, making it less efficient.

onSubmitted:
```
onSubmitted is a callback function triggered when the user presses the "done"
or "submit" button on the keyboard.

It provides the input value at that moment, typically used for form submissions
or actions triggered by user input.
```

TextEditingController: 
```
TextEditingController is an object that manages and tracks the current value of
a TextField in real-time.

It allows you to access and modify the TextField value programmatically, providing
more control and flexibility.
```
Use Cases:
```
Use onSubmitted for handling specific actions when the user submits input, like submitting a form.

Use TextEditingController for real-time input management and more complex scenarios requiring
programmatic control over text fields.
```


**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHY CAN'T WE USE A ListView DIRECTLY INSIDE A Column IN FLUTTER?**

A ListView expects height constraints, but a Column doesn't provide them, leading to an unbounded height error. Wrapping the ListView with Expanded or Flexible provides the necessary constraints.

```
Column(
  children: [
    Text('Header'),
    Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item $index'));
        },
      ),
    ),
  ],
)
```

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: IN FLUTTER BLOC, WHICH WIDGETS ARE USED TO INTERACT WITH THE STATE IN THE UI?**

1. BlocBuilder → Rebuilds UI when the state changes.


2. BlocListener → Listens for state changes and triggers side effects (e.g., Snackbar).


3. BlocConsumer → A combination of BlocListener and BlocBuilder (listens + rebuilds).


4. BlocSelector → Selects and listens to a specific part of the state, optimizing rebuilds.

Most commonly, developers use BlocBuilder, BlocListener, and BlocConsumer, but BlocSelector is also an important tool for improving performance.

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT IS THE DIFFERENCE BETWEEN BLOCBUILDER AND BLOCLISTENER IN FLUTTER'S BLOC PACKAGE?**

BlocBuilder: Always returns a widget and rebuilds the UI when the state changes.

BlocListener: Never returns a widget; it only executes side effects (e.g., showing a SnackBar or navigating) without affecting the UI.

```
// UI update using BlocBuilder
BlocBuilder<CounterBloc, int>(
  builder: (context, state) {
    return Text('Count: $state'); // Always returns a widget
  },
);

// Side effect using BlocListener
BlocListener<CounterBloc, int>(
  listener: (context, state) {
    if (state == 5) {
      // Executes a side effect, never returns a widget
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Count reached 5!')),
      );
    }
  },
  child: Container(), // A child widget can be provided
);
```
**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHY DOES FLUTTER THROW AN ERROR WHEN ADDING A NESTED LIST INSIDE children: IN WIDGETS LIKE Column, Row, or Stack?**

Widgets like Column, Row, and Stack expect a flat list of widgets, but a nested list (List<List<Widget>>) causes a type mismatch. Use the spread operator (...) to unpack lists inside children: or assign a generated list directly. This rule applies to all collection-based widgets in Flutter, including ListView, Wrap, and GridView.
```
Column(
  children: [
    Text("Item 1"),
    ...[Text("Item 2"), Text("Item 3")], // ✅ FIXED: Spreads elements
  ],
)
```
```
Column(
  children: List.generate(3, (index) => Text("Item ${index + 1}")), // ✅ Works fine
)
```

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: HOW CAN I SET UP ROUTES IN MaterialApp WITHOUT USING initialRoute OR home?**

Use the routes property to map each screen to a named route, like this:
```
routes: {
  '/': (context) => const Screen1(),
  'screen2': (context) => const Screen2(),
  'screen3': (context) => const Screen3(),
}
```

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT DOES PROVIDER PROVIDE IN FLUTTER, AND WHAT ARE ITS CORE FEATURES?**


Provider is a state management solution in Flutter that offers a simple and efficient way to manage app state, providing dependency injection, automatic widget rebuilding, and reactive programming to streamline data flow across the app.

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT DOES RIVERPOD PROVIDE IN FLUTTER, AND WHAT ARE ITS CORE FEATURES?**

Riverpod is a state management solution in Flutter that offers a more flexible and scalable alternative to Provider, providing features like better testability, compile-time safety, and the ability to manage state globally without relying on the widget tree.

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT DOES GETX PROVIDE IN FLUTTER, AND WHAT ARE ITS CORE FEATURES?**

GetX is a Flutter package that provides state management, route management, and dependency injection, offering reactive programming, easy navigation, and efficient handling of app states with minimal boilerplate code.

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT DOES BLOC PROVIDE IN FLUTTER, AND WHAT ARE ITS CORE FEATURES?**


Bloc (Business Logic Component) provides a predictable state management solution in Flutter, following the BLoC pattern. Its core features include separating business logic from UI, managing state through streams, and ensuring a clear flow of data with events and states, promoting scalability and testability.

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**

**Q: WHAT IS THE DIFFERENCE BETWEEN PROVIDER, GETX, RIVERPOD, AND BLOC IN TERMS OF DEPENDENCY INJECTION AND ROUTING?**

Dependency Injection:
```
Provider and GetX provide built-in dependency injection features.
Riverpod and Bloc do not offer direct dependency injection; you can manage state but need external
solutions for DI.
```
Routing:
```
GetX has built-in routing capabilities for easy navigation.
Provider, Riverpod, and Bloc do not handle routing and rely on Flutter's default Navigator or
external routing libraries.
```

**===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**          **===== Flutter Questions & Answers =====**
