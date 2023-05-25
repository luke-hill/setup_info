In recent Ubuntu versions (>= 18.04):

sudo apt-get install libheif-examples
And then

for file in *.heic; do heif-convert $file ${file/%.heic/.jpg}; done

