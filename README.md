# docker-ubuntu

## 關於

基於ubuntu:trusty-20170602建立的docker

## 其它說明

- 手動執行docker image
```
docker run -it --rm erwinchang/ubuntu-build
```

- 將外部目錄mount到docker
```
docker run -it --rm --volume=/home/user:/root/workspace erwinchang/ubuntu-build
```

## Dockerfile設定說明

- [Avoid suggests, recommends][3]
```
APT::Install-Recommends 0;
```

- [How do I ask apt-get to skip any interactive post-install configuration steps?][4]
```
export DEBIAN_FRONTEND=noninteractive
```

- [確定 APT 可以透過 https 作業，並且已安裝 CA 憑證][5]
```
apt-get instll ca-certificates apt-transport-https
```

## 參考來源

- [sameersbn/docker-ubuntu][1]
- [ubuntu/Dockerfile][2]


[1]:https://github.com/sameersbn/docker-ubuntu
[2]:https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
[3]:https://askubuntu.com/questions/887701/avoid-suggests-recommends-and-upgrades-during-apt-get-install
[4]:https://serverfault.com/questions/227190/how-do-i-ask-apt-get-to-skip-any-interactive-post-install-configuration-steps
[5]:https://dotblogs.com.tw/grassshrimp_tech_intern/2016/06/05/200056

