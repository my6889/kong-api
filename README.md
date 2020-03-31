# Bs-kong

Kong 云原生架构下的 API 网关，参考链接：

> Docker 安装：https://docs.konghq.com/install/docker/
>
> Docker-compose 安装部署：https://github.com/Kong/docker-kong/tree/master/compose
>
> 云原生架构下的 API 网关实践 [一](https://juejin.im/post/5d348b36e51d45554877a6a0)、[二](https://juejin.im/post/5d63ca34e51d4561cc25f05f)、[三](https://juejin.im/post/5d6fce2d51882505730d2d01)



## 如何使用

### 项目说明

* **此项目仅适用于外置数据库,compose项目中不包含数据库**
* **此项目使用了`kong:2.0.1`和`pantsel/konga:0.14.7`镜像**

### 配置外置PostgreSQL数据库

创建kong用户和kong数据库

```
create user kong with password 'yourpassword';
create database kong owner kong;
```

创建konga用户和konga数据库

```
create user konga with password 'yourpassword';
create database konga owner konga;
```

### 克隆项目

```
git clone -b 2.0 gitlab@git.socmap.org:soc/smis/bs-kong.git
```

### 启动项目

1.修改kong.env和konga.env文件

2.初始化项目

```
chmod +x prepare.sh
./prepare.sh
```

3.启动项目

```
docker-compose up -d
```



