In recent Ubuntu versions (>= 18.04):

```
sudo apt-get install libheif-examples
```

Then run the following command in the directory containing the .heic files:

```
for file in *.heic; do heif-convert $file ${file/%.heic/.jpg}; done
```
