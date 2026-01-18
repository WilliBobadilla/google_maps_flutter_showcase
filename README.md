# google_maps_showcase

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



### Create new features with mason 

1. Activate mason cli 
```
dart pub global activate mason_cli
```
2. Export to path 
```
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

3. Write your brick(If is the first time)
Create a file called mason.yaml, and add the following lines:
```
bricks:
  clean_architecture_feature2: ^0.1.0
```
4. Get your brick
```
mason get
```

5. Use it
```
mason make clean_architecture_feature2
```