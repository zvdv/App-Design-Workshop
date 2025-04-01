# App Design and Development

A series of workshops presented at the College of Science and Technology, Phuentsholing, Bhutan.

## Part 1: Intro to Figma

In this workshop, we explored everything needed to create complex, interactive designs in Figma through hands-on examples. Topics included: shapes, text, styles, frames, constraints, auto layout, components and variants. `Figma Workshop Recap.pdf` contains a summary of the workshop with suggestions and links for further learning.

## Part 2: Intro to Flutter

In this workshop, we learned how to bring designs to life on any device using Flutter. During the workshop, each participant created a project from the Empty Application template and developed an app similar to `inventory/`. This example demonstrated a few key functions such as navigating between pages, updating values in the UI (state), and reusing custom widgets.

So far, I have written a high-level summary of what we did during the workshop in `inventory/README.md`, and added comments in `inventory/lib/main.dart` and `inventory/lib/about.dart` detailing what key parts of the code are doing. Soon I plan to add similar details to the other two Flutter projects in this repository, `collector/` and `dashboard/`. `collector/` uses [hive_ce](https://pub.dev/packages/hive_ce) to store user data in a local database, while `dashboard/` uses [mqtt_client](https://pub.dev/packages/mqtt_client) to display data obtained via MQTT. I hope these additional projects can serve as inspiration for a myriad of possible Flutter projects you might imagine building.
