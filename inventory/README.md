# Inventory Example

A beginner Flutter project illustrating useful features that will likely be needed in future Flutter projects.

In `lib/main.dart`, we define a home page (custom `Home` widget) with an [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html). In the AppBar's actions property, we define an [IconButton](https://api.flutter.dev/flutter/material/IconButton-class.html) that brings us to our about page. In the body of our home page, we define three instances of our custom widget, `InventoryCard`. The `InventoryCard` widget is [stateful](https://docs.flutter.dev/ui/interactivity) so that the `quantity` state variable can be updated on the screen. We also specify a `name` property for `InventoryCard` so that each instance can have a unique name.

In `lib/about.dart`, we define an about page (custom `About` widget) with an AppBar similar to that of `Home`. This time, instead of actions for the AppBar, we define an IconButton in the leading property to make the back arrow to return to the home page.

In the workshop, we created this project from the Empty Application template (selected after running `Flutter: New Project`), but I recommend exploring what the other templates have to offer. I have added comments to both `lib/main.dart` and `lib/about.dart` explaining key elements.

To explore more possibilities from Flutter, where "everything is a widget," check out the [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets).