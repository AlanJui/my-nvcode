# Install Lua Guideline

Ref URL: https://www.lua.org/manual/5.4/readme.html

## Building Lua

1.  Download source.

```
$ wget https://luarocks.org/releases/luarocks-X.Y.Z.tar.gz
$ tar zxpf luarocks-X.Y.Z.tar.gz
$ la lua-X.Y.Z
總計 24
drwxr-xr-x 4 alanjui alanjui 4096 11月 13 23:42 .
drwxr-xr-x 3 alanjui alanjui 4096  2月 19 21:44 ..
drwxr-xr-x 2 alanjui alanjui 4096 11月 13 23:35 doc
-rw-r--r-- 1 alanjui alanjui 3146 11月 11 04:54 Makefile
-rw-r--r-- 1 alanjui alanjui  151 11月 13 23:42 README
drwxr-xr-x 2 alanjui alanjui 4096 11月 13 23:33 src
$ cd luarocks-X.Y.Z
```

2.  Make sure build platform.

```
make help
```

The platforms currently supported are:

- guess
- aix
- bsd
- c89
- freebsd
- generic
- linux
- linux-readline
- macosx
- mingw
- posix
- solaris

3.  Build from source code.

```
make linux-readline
```

```
alanjui@VB01-Debian-10:~/build/lua-5.4.2$ make linux-readline
make[1]: Entering directory '/home/alanjui/build/lua-5.4.2/src'
make all SYSCFLAGS="-DLUA_USE_LINUX -DLUA_USE_READLINE" SYSLIBS="-Wl,-E -ldl -lreadline"
make[2]: Entering directory '/home/alanjui/build/lua-5.4.2/src'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/alanjui/build/lua-5.4.2/src'
make[1]: Leaving directory '/home/alanjui/build/lua-5.4.2/src'
```

The compilation takes only a few moments and produces three files in the
src directory:

- lua (the interpreter),
- luac (the compiler),
- liblua.a (the library).

4. To check that Lua has bben built correctly.

```
make test
```

```
alanjui@VB01-Debian-10:~/build/lua-5.4.2$ make test
make[1]: Entering directory '/home/alanjui/build/lua-5.4.2/src'
./lua -v
Lua 5.4.2  Copyright (C) 1994-2020 Lua.org, PUC-Rio
make[1]: Leaving directory '/home/alanjui/build/lua-5.4.2/src'
```

## Installing Lua

```
sudo make linux-readline install
```

### Install Lua locally

To install Lua locally after building it, do "make local". This will create
a directory install with subdirectories bin, include, lib, man, share, and
install Lua as listed below.

- bin:
  - lua
  - luac
- include:
  - lua.h
  - luaconf.h
  - lualib.h
  - lauxlib.h
  - lua.hpp
- lib:
  - liblua.a
- man/man1:
  - lua.1
  - luac.1

```
make linux-readline local
```

```
alanjui@VB01-Debian-10:~/build/lua-5.4.2$ make linux-readline local
make[1]: Entering directory '/home/alanjui/build/lua-5.4.2/src'
make all SYSCFLAGS="-DLUA_USE_LINUX -DLUA_USE_READLINE" SYSLIBS="-Wl,-E -ldl -lreadline"
make[2]: Entering directory '/home/alanjui/build/lua-5.4.2/src'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/alanjui/build/lua-5.4.2/src'
make[1]: Leaving directory '/home/alanjui/build/lua-5.4.2/src'
make install INSTALL_TOP=../install
make[1]: Entering directory '/home/alanjui/build/lua-5.4.2'
cd src && mkdir -p ../install/bin ../install/include ../install/lib ../install/man/man1 ../install/share/lua/5.4 ../install/lib/lua/5.4
cd src && install -p -m 0755 lua luac ../install/bin
cd src && install -p -m 0644 lua.h luaconf.h lualib.h lauxlib.h lua.hpp ../install/include
cd src && install -p -m 0644 liblua.a ../install/lib
cd doc && install -p -m 0644 lua.1 luac.1 ../install/man/man1
make[1]: Leaving directory '/home/alanjui/build/lua-5.4.2'

alanjui@VB01-Debian-10:~/build/lua-5.4.2$ la
總計 28
drwxr-xr-x 5 alanjui alanjui 4096  2月 19 21:28 .
drwxr-xr-x 6 alanjui alanjui 4096  2月 18 19:40 ..
drwxr-xr-x 2 alanjui alanjui 4096 11月 13 23:35 doc
drwxr-xr-x 7 alanjui alanjui 4096  2月 19 21:28 install
-rw-r--r-- 1 alanjui alanjui 3146 11月 11 04:54 Makefile
-rw-r--r-- 1 alanjui alanjui  151 11月 13 23:42 README
drwxr-xr-x 2 alanjui alanjui 4096  2月 18 19:40 src

alanjui@VB01-Debian-10:~/build/lua-5.4.2$ la install
總計 28
drwxr-xr-x 7 alanjui alanjui 4096  2月 19 21:28 .
drwxr-xr-x 5 alanjui alanjui 4096  2月 19 21:28 ..
drwxr-xr-x 2 alanjui alanjui 4096  2月 19 21:28 bin
drwxr-xr-x 2 alanjui alanjui 4096  2月 19 21:28 include
drwxr-xr-x 3 alanjui alanjui 4096  2月 19 21:28 lib
drwxr-xr-x 3 alanjui alanjui 4096  2月 19 21:28 man
drwxr-xr-x 3 alanjui alanjui 4096  2月 19 21:28 share

alanjui@VB01-Debian-10:~/build/lua-5.4.2$ tree install
install
├── bin
│   ├── lua
│   └── luac
├── include
│   ├── lauxlib.h
│   ├── luaconf.h
│   ├── lua.h
│   ├── lua.hpp
│   └── lualib.h
├── lib
│   ├── liblua.a
│   └── lua
│       └── 5.4
├── man
│   └── man1
│       ├── lua.1
│       └── luac.1
└── share
    └── lua
        └── 5.4

10 directories, 10 files
```

To install Lua locally, but in some other directory,
do "make install INSTALL_TOP=xxx", where xxx is your chosen directory.
The installation starts in the src and doc directories, so take care
if INSTALL_TOP is not an absolute path.

### Install Lua golbally

```
sudo make linux-readline install INSTALL_TOP=/usr
```

```
alanjui@VB01-Debian-10:~/build/lua-5.4.2$ sudo make linux-readline install INSTALL_TOP=/usr
make[1]: Entering directory '/home/alanjui/build/lua-5.4.2/src'
make all SYSCFLAGS="-DLUA_USE_LINUX -DLUA_USE_READLINE" SYSLIBS="-Wl,-E -ldl -lreadline"
make[2]: Entering directory '/home/alanjui/build/lua-5.4.2/src'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/alanjui/build/lua-5.4.2/src'
make[1]: Leaving directory '/home/alanjui/build/lua-5.4.2/src'
cd src && mkdir -p /usr/bin /usr/include /usr/lib /usr/man/man1 /usr/share/lua/5.4 /usr/lib/lua/5.4
cd src && install -p -m 0755 lua luac /usr/bin
cd src && install -p -m 0644 lua.h luaconf.h lualib.h lauxlib.h lua.hpp /usr/include
cd src && install -p -m 0644 liblua.a /usr/lib
cd doc && install -p -m 0644 lua.1 luac.1 /usr/man/man1
alanjui@VB01-Debian-10:~/build/lua-5.4.2$
```

These are the only directories you need for development. If you only want
to run Lua programs, you only need the files in bin and man. The files in
include and lib are needed for embedding Lua in C or C++ programs.

## Customization

Three kinds of things can be customized by editing a file:

- Where and how to install Lua — edit Makefile.
- How to build Lua — edit src/Makefile.
- Lua features — edit src/luaconf.h.

You don't actually need to edit the Makefiles because you may set the relevant
variables in the command line when invoking make. Nevertheless, it's probably
best to edit and save the Makefiles to record the changes you've made.

On the other hand, if you need to customize some Lua features, you'll need to
edit src/luaconf.h before building and installing Lua. The edited file will be
the one installed, and it will be used by any Lua clients that you build, to
ensure consistency. Further customization is available to experts by editing
the Lua sources.

## Configuration for alternatives infrastructure

### Install lua options for alternatives infrastructure

```
$ sudo cp /usr/bin/lua /usr/bin/lua5.4
$ sudo cp /usr/bin/luac /usr/bin/luac5.4
$ cd /usr/man/man1
$ sudo gzip lua.1
$ sudo gzip luac.1
$ sudo cp lua.1.gz /usr/share/man/man1/lua5.4.2.gz
$ sudo cp luac.1.gz /usr/share/man/man1/luac5.4.2.gz

$ sudo update-alternatives \
  --install /usr/bin/lua lua-interpreter /usr/bin/lua5.4 130 \
  --slave /usr/share/man/man1/lua.1.gz lua-manual /usr/share/man/man1/lua5.4.2.gz

$ sudo update-alternatives \
  --install /usr/bin/luac lua-compiler /usr/bin/luac5.4 130 \
  --slave /usr/share/man/man1/luac.1.gz lua-compiler-manual /usr/share/man/man1/luac5.4.2.gz
```

### Change default Lua Interpreter / Compiler

```
$ sudo update-alternatives --config lua-interpreter

$ sudo update-alternatives --config lua-compiler
```

### Remove option for alternatives infrastructure

```
$ sudo update-alternatives --remove lua-interpreter /usr/share/lua/5.4/lua
```

## Install Lua Support for Vim/Neovim

### Install Lua Language Server

Ref: https://emacs-lsp.github.io/lsp-mode/page/lsp-lua-language-server/

1. Install ninja

Debian/Ubuntu:

```
sudo apt install ninja-build
```

ArchLinux:

```
sudo pacman -S ninja
```

macOS:

```
brew install ninja
```

2. Make sure you have C++17

3. Clone project

```
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
```

4. Build

Linux:

```
cd 3rd/luamake
ninja -f ninja/linux.ninja
cd ../..
./3rd/luamake/luamake rebuild
```

macOS:

```
cd 3rd/luamake
ninja -f ninja/macos.ninja
cd ../..
./3rd/luamake/luamake rebuild
```

5. Run

Linux:

```
./bin/Linux/lua-language-server -E ./main.lua
```

macOS:

```
mv ~/build/lua-language-server ~/.local/share/
cd ~/.local/share/lua-language-server
./bin/macOS/lua-language-server -E ./main.lua
```

6. Install

Linux:

```
mv ~/build/lua-language-server ~/.local/share/
cd ~/.local/share/lua-language-server/bin/Linux
cp * ../
```

macOS:

```
mv ~/build/lua-language-server ~/.local/share/
cd ~/.local/share/lua-language-server/bin/macOS
cp * ../
```

### Install lua language server support for vim

1.  Start Vim 8 / Neovim 0.5

2.  透過 coc-nvim 執行安裝指令：

```
:CocInstall coc-lua
```

3. 設定 Lua Language Server Path

```
:CocConfig
```

【註】：等同 `nvim ~/.config/nvim/coc-settings.json` 或
`vim ~/.vim/coc-settings.json` 。

coc-settings.json

```
{
    ....
    "languageserver": {
        "bash": {
            ....
        },
        "lua": {
            "command": "~/.local/share/lua-language-server/bin/lua-language-server",
            "args": [
              "-E",
              "-e",
              "LANG=en",
              "~/.local/share/lua-language-server/main.lua"
            ],
            "filetypes": ["lua"],
            "trace.server": "verbose"
        }
    },
    ....
}
```

### Verify

1. Editing source code

```
cd ~/.vim/lua
vim testLua.lua
```

2. Run

Presss key: <Space><a><t> to open a floating window for terminal.

Entering commad below:

```
lua testLua.lua
```

Entering `exit` command to close terminal window and return to vim editor.

```
exit
```
