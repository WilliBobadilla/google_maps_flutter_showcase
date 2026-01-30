# google_maps_showcase

Showcasing google maps for flutter.


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