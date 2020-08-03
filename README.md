# Kong

Kong 云原生架构下的 API 网关


## 如何使用

### 项目说明

* **此项目使用了`kong:2.1.0-ubuntu`和`pantsel/konga:0.14.9`镜像**

### 克隆项目

```
git clone https://github.com/my6889/kong-api.git
```

### 启动项目

1.修改数据库密码

(默认密码是`1qaz2wsx`,也可以不改)

```
sed -i "s/1qaz2wsx/yourpassword/g" kong.env
sed -i "s/1qaz2wsx/yourpassword/g" konga.env
sed -i "s/1qaz2wsx/yourpassword/g" postgresql.env
```

2.在`postgresql.env`设置一些其它环境变量（选做）

3.初始化项目

```
chmod +x prepare.sh
./prepare.sh
```

4.启动项目

```
docker-compose up -d
```

5.完全移除项目

```
# 慎重操作
docker-compose down -v
```



