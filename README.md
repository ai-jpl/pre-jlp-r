# r_pre_jlp

# setup docker
```
https://docs.docker.com/install/
```

# build docker image 

## download CRF++
    + address: httyps://drive.google.com/drive/folders/0B4y35FiV1wh7fngteFhHQUN2Y1B5eUJBNHZUemJYQV9VWlBUb3JlX0xBdWVZTWtSbVBneU0
    + saved location:  ./vendors/CRF++-0.58.tar.gz

## download cabocha
    + address: https://drive.google.com/drive/folders/0B4y35FiV1wh7cGRCUUJHVTNJRnM
    + saved location:  ./vendors/cabocha-0.69.tar.bz2

## build docker image
```
sudo docker build -t r-jlp .
```

## run docker container
```
sudo docker run -it --name hoge r-jlp bash
```

### test
```
python test.py
```
