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
#### 5.govendor说明
```$xslt
$ govendor
```
```
govendor (v1.0.9): record dependencies and copy into vendor folder
	-govendor-licenses    Show govendor's licenses.
	-version              Show govendor version
	-cpuprofile 'file'    Writes a CPU profile to 'file' for debugging.
	-memprofile 'file'    Writes a heap profile to 'file' for debugging.

Sub-Commands

	init     Create the "vendor" folder and the "vendor.json" file.
	list     List and filter existing dependencies and packages.
	add      Add packages from $GOPATH.
	update   Update packages from $GOPATH.
	remove   Remove packages from the vendor folder.
	status   Lists any packages missing, out-of-date, or modified locally.
	fetch    Add new or update vendor folder packages from remote repository.
	sync     Pull packages into vendor folder from remote repository with revisions
  	             from vendor.json file.
	migrate  Move packages from a legacy tool to the vendor folder with metadata.
	get      Like "go get" but copies dependencies into a "vendor" folder.
	license  List discovered licenses for the given status or import paths.
	shell    Run a "shell" to make multiple sub-commands more efficient for large
	             projects.

	go tool commands that are wrapped:
	  "+status" package selection may be used with them
	fmt, build, install, clean, test, vet, generate, tool

Status Types

	+local    (l) packages in your project
	+external (e) referenced packages in GOPATH but not in current project
	+vendor   (v) packages in the vendor folder
	+std      (s) packages in the standard library

	+excluded (x) external packages explicitly excluded from vendoring
	+unused   (u) packages in the vendor folder, but unused
	+missing  (m) referenced packages but not found

	+program  (p) package is a main package

	+outside  +external +missing
	+all      +all packages

	Status can be referenced by their initial letters.

Package specifier
	<path>[::<origin>][{/...|/^}][@[<version-spec>]]

Ignoring files with build tags, or excluding packages from being vendored:
	The "vendor.json" file contains a string field named "ignore".
	It may contain a space separated list of build tags to ignore when
	listing and copying files.
	This list may also contain package prefixes (containing a "/", possibly
	as last character) to exclude when copying files in the vendor folder.
	If "foo/" appears in this field, then package "foo" and all its sub-packages
	("foo/bar", …) will be excluded (but package "bar/foo" will not).
	By default the init command adds the "test" tag to the ignore list.

If using go1.5, ensure GO15VENDOREXPERIMENT=1 is set.
```
#### 6.注意
govendor只是用来管理项目的依赖包，如果GOPATH中本身没有项目的依赖包，则需要通过go get先下载到GOPATH中，再通过govendor add +external拷贝到vendor目录中。