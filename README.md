#### 1.安装govendor
```
go get -u github.com/kardianos/govendor
```
#### 2.初始化，生成vendor目录
```
govendor init 
```
#### 3.导入依赖包
```
govendor add +external
```
#### 4.执行完后目录结构如下
```$xslt
├── Makefile
├── README.md
├── bin
│   ├── wsclt
│   └── wssvr
├── vendor
│   ├── golang.org
│   │   └── x
│   │       └── net
│   │           ├── LICENSE
│   │           ├── PATENTS
│   │           └── websocket
│   │               ├── client.go
│   │               ├── dial.go
│   │               ├── hybi.go
│   │               ├── server.go
│   │               └── websocket.go
│   └── vendor.json
├── wsclt
│   └── wsclt.go
└── wssvr
    └── wssvr.go

```