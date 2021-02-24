# Python Guideline

## Install Python Tools

1. Install software

```
cd
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
```

2. Configure Shell

```
vim ~/.profile
```

~/.profile:

```
....
#--------------------------------------------------------------------
# pyenv
#--------------------------------------------------------------------

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"   # pyenv-virtualenv: pyenv plugin
fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

....
```

3. Reset shell configuration

```
exec $SHELL
```

## Install Python Interpreter

1. Install

```
pyenv install 3.8.5
```

```
$ pyenv versions
* system (set by /Users/alanjui/.pyenv/version)

$ pyenv install 3.8.5
python-build: use openssl@1.1 from homebrew
python-build: use readline from homebrew
Downloading Python-3.8.5.tar.xz...
-> https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tar.xz
Installing Python-3.8.5...
python-build: use readline from homebrew
python-build: use zlib from xcode sdk
Installed Python-3.8.5 to /Users/alanjui/.pyenv/versions/3.8.5

$ pyenv versions
* system (set by /Users/alanjui/.pyenv/version)
  3.8.5
```

2. Configure default Python Interpreter

```
pyenv global <VerNo>
```

Ex: Without Python 2 specified

```
$ pyenv global 3.8.5

$ pyenv versions
  system
* 3.8.5 (set by /Users/alanjui/.pyenv/version)
```

Ex: With Python 2 and Python 3 specified

```
$  pyenv versions
  system
  2.7.16
* 3.8.5 (set by /Users/alanjui/.pyenv/version)
  3.9.1

$ pyenv global 2.7.16 3.9.1

$ pyenv versions
  system
* 2.7.16 (set by /Users/alanjui/.pyenv/version)
  3.8.5
* 3.9.1 (set by /Users/alanjui/.pyenv/version)
```

```
$ which python
/usr/bin/python
$ la /usr/bin/python
lrwxr-xr-x  1 root  wheel    75B  1  1  2020 /usr/bin/python -> ../../System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7
$ /usr/bin/python

WARNING: Python 2.7 is not recommended.
This version is included in macOS for compatibility with legacy software.
Future versions of macOS will not include Python 2.7.
Instead, it is recommended that you transition to using 'python3' from within Terminal.

Python 2.7.16 (default, Dec 21 2020, 23:00:36)
[GCC Apple LLVM 12.0.0 (clang-1200.0.30.4) [+internal-os, ptrauth-isa=sign+stri on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> ^D

$ which python2
/usr/bin/python2
$ la /usr/bin/python2
lrwxr-xr-x  1 root  wheel    75B  1  1  2020 /usr/bin/python2 -> ../../System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7

$ which python3
/usr/local/bin/python3
$ la /usr/local/bin/python3
lrwxr-xr-x  1 alanjui  admin    40B  2 13 12:23 /usr/local/bin/python3 -> ../Cellar/python@3.9/3.9.1_8/bin/python3
$ /usr/local/bin/python3
Python 3.9.1 (default, Feb  3 2021, 07:38:02)
[Clang 12.0.0 (clang-1200.0.32.29)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> ^D
```

Python installed locally:

```
$ ls -l -d  ~/.pyenv/shims/python[0-9]
-rwxr-xr-x  1 alanjui  staff  408  2 20 11:56 /Users/alanjui/.pyenv/shims/python2
-rwxr-xr-x  1 alanjui  staff  408  2 20 11:27 /Users/alanjui/.pyenv/shims/python3

$ ls -l -d ~/.pyenv/shims/python
-rwxr-xr-x  1 alanjui  staff  408  2 20 11:27 /Users/alanjui/.pyenv/shims/python
```

```
$ ~/.pyenv/shims/python
Python 2.7.16 (default, Feb 20 2021, 11:55:00)
[GCC Apple LLVM 12.0.0 (clang-1200.0.32.28)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>

$ ~/.pyenv/shims/python3
Python 3.9.1 (default, Feb 20 2021, 11:45:58)
[Clang 12.0.0 (clang-1200.0.32.28)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>

$ exec $SHELL

$ echo $PATH
/usr/local/opt/openjdk/bin:/Users/alanjui/.pyenv/plugins/pyenv-virtualenv/shims:/Users/alanjui/.pyenv/shims:/Users/alanjui/.pyenv/bin:/usr/local/opt/sqlite/bin:/Users/alanjui/.yarn/bin:/Users/alanjui/.config/yarn/global/node_modules/.bin:/Users/alanjui/.gem/bin:/usr/local/opt/libiconv/bin:/usr/local/opt/openssl@1.1/bin:/usr/local/opt/ruby/bin:/Users/alanjui/bin:/Users/alanjui/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/usr/local/share/dotnet:/Users/alanjui/n/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/Users/alanjui/.fzf/bin

$ which python
/Users/alanjui/.pyenv/shims/python
$ /Users/alanjui/.pyenv/shims/python
Python 2.7.16 (default, Feb 20 2021, 11:55:00)
[GCC Apple LLVM 12.0.0 (clang-1200.0.32.28)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>

$ which python3
/Users/alanjui/.pyenv/shims/python3
$ /Users/alanjui/.pyenv/shims/python3
Python 3.9.1 (default, Feb 20 2021, 11:45:58)
[Clang 12.0.0 (clang-1200.0.32.28)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

## Manage Python Virtualenvs

### Create Virtualenv

1. Create

```
pyenv virtualenv <VerNo> <VirtualEnvName>
```

Ex:

```
pyenv virtualenv 3.9.1 venv-3.9.1
```

2. Configure VirtualEnv for Project

```
pyenv local <VirtualEnvName>
```

```
$ cd ~/workspace/django/test-100

$ pyenv virtualenv 3.9.1 venv-3.9.1
Looking in links: /var/folders/36/6kwybs_92bj1_x96p67h7q8w0000gp/T/tmp67ulkd55
Requirement already satisfied: setuptools in /Users/alanjui/.pyenv/versions/3.9.1/envs/venv-3.9.1/lib/python3.9/site-packages (49.2.1)
Requirement already satisfied: pip in /Users/alanjui/.pyenv/versions/3.9.1/envs/venv-3.9.1/lib/python3.9/site-packages (20.2.3)

$ pyenv local venv-3.9.1

$pyenv versions
  system
  2.7.16
  3.8.5
  3.9.1
  3.9.1/envs/venv-3.9.1
* venv-3.9.1 (set by /Users/alanjui/workspace/django/test-100/.python-version)
```

## Configure pip

```
$ cd
$ pyenv version
2.7.16 (set by /Users/alanjui/.pyenv/version)
3.9.1 (set by /Users/alanjui/.pyenv/version)

$ ~/.pyenv/versions/3.9.1/bin/python3.9 -m pip install --upgrade pip
Collecting pip
  Downloading pip-21.0.1-py3-none-any.whl (1.5 MB)
     |████████████████████████████████| 1.5 MB 1.6 MB/s
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 20.2.3
    Uninstalling pip-20.2.3:
      Successfully uninstalled pip-20.2.3
Successfully installed pip-21.0.1

$ pip install pynvim
Collecting pynvim
  Using cached https://files.pythonhosted.org/packages/9c/76/d16f58648f4d3398ecd5b48ae7fb064f1701c51fe094e0b7b4e08586df0c/pynvim-0.4.2.tar.gz
Collecting msgpack>=0.5.0 (from pynvim)
  Downloading https://files.pythonhosted.org/packages/59/04/87fc6708659c2ed3b0b6d4954f270b6e931def707b227c4554f99bd5401e/msgpack-1.0.2.tar.gz (123kB)
    100% |████████████████████████████████| 133kB 1.7MB/s
Collecting trollius (from pynvim)
  Using cached https://files.pythonhosted.org/packages/0b/31/356ae13ad4df58f963e9954d55118f6cffdb3a903c1547973ad7bc347fb9/trollius-2.2.post1.tar.gz
Collecting greenlet (from pynvim)
  Downloading https://files.pythonhosted.org/packages/92/be/878cc5314fa5aadce33e68738c1a24debe317605196bdfc2049e66bc9c30/greenlet-1.0.0.tar.gz (84kB)
    100% |████████████████████████████████| 92kB 8.7MB/s
Collecting six (from trollius->pynvim)
  Using cached https://files.pythonhosted.org/packages/ee/ff/48bde5c0f013094d729fe4b0316ba2a24774b3ff1c52d924a8a4cb04078a/six-1.15.0-py2.py3-none-any.whl
Collecting futures (from trollius->pynvim)
  Using cached https://files.pythonhosted.org/packages/d8/a6/f46ae3f1da0cd4361c344888f59ec2f5785e69c872e175a748ef6071cdb5/futures-3.3.0-py2-none-any.whl
Installing collected packages: msgpack, six, futures, trollius, greenlet, pynvim
  Running setup.py install for msgpack ... done
  Running setup.py install for trollius ... done
  Running setup.py install for greenlet ... done
  Running setup.py install for pynvim ... done
Successfully installed futures-3.3.0 greenlet-1.0.0 msgpack-1.0.2 pynvim-0.4.2 six-1.15.0 trollius-2.2.post1
You are using pip version 18.1, however version 20.3.4 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.

$ pip install --upgrade pip
Collecting pip
  Downloading https://files.pythonhosted.org/packages/27/79/8a850fe3496446ff0d584327ae44e7500daf6764ca1a382d2d02789accf7/pip-20.3.4-py2.py3-none-any.whl (1.5MB)
    100% |████████████████████████████████| 1.5MB 5.3MB/s
Installing collected packages: pip
  Found existing installation: pip 18.1
    Uninstalling pip-18.1:
      Successfully uninstalled pip-18.1
Successfully installed pip-20.3.4

$ which pip
/Users/alanjui/.pyenv/shims/pip

$ pip install pynvim
DEPRECATION: Python 2.7 reached the end of its life on January 1st, 2020. Please upgrade your Python as Python 2.7 is no longer maintained. pip 21.0 will drop support for Python 2.7 in January 2021. More details about Python 2 support in pip can be found at https://pip.pypa.io/en/latest/development/release-process/#python-2-support pip 21.0 will remove support for this functionality.
Requirement already satisfied: pynvim in ./.pyenv/versions/2.7.16/lib/python2.7/site-packages (0.4.2)
Requirement already satisfied: msgpack>=0.5.0 in ./.pyenv/versions/2.7.16/lib/python2.7/site-packages (from pynvim) (1.0.2)
Requirement already satisfied: trollius in ./.pyenv/versions/2.7.16/lib/python2.7/site-packages (from pynvim) (2.2.post1)
Requirement already satisfied: greenlet in ./.pyenv/versions/2.7.16/lib/python2.7/site-packages (from pynvim) (1.0.0)
Requirement already satisfied: six in ./.pyenv/versions/2.7.16/lib/python2.7/site-packages (from trollius->pynvim) (1.15.0)
Requirement already satisfied: futures in ./.pyenv/versions/2.7.16/lib/python2.7/site-packages (from trollius->pynvim) (3.3.0)

$ pip3 install pynvim
Collecting pynvim
  Using cached pynvim-0.4.2.tar.gz (42 kB)
Collecting msgpack>=0.5.0
  Using cached msgpack-1.0.2-cp39-cp39-macosx_10_14_x86_64.whl (74 kB)
Collecting greenlet
  Using cached greenlet-1.0.0-cp39-cp39-macosx_10_14_x86_64.whl (86 kB)
Using legacy 'setup.py install' for pynvim, since package 'wheel' is not installed.
Installing collected packages: msgpack, greenlet, pynvim
    Running setup.py install for pynvim ... done
Successfully installed greenlet-1.0.0 msgpack-1.0.2 pynvim-0.4.2

$ la ~/.pyenv/versions/3.9.1/lib/python3.9/site-packages
total 16
-rw-r--r--   1 alanjui  staff   119B  2 20 11:46 README.txt
drwxr-xr-x   3 alanjui  staff    96B  2 20 11:46 __pycache__
-rw-r--r--   1 alanjui  staff   126B  2 20 11:46 easy_install.py
drwxr-xr-x  10 alanjui  staff   320B  2 20 14:17 greenlet
drwxr-xr-x  10 alanjui  staff   320B  2 20 14:17 greenlet-1.0.0.dist-info
drwxr-xr-x   9 alanjui  staff   288B  2 20 14:17 msgpack
drwxr-xr-x   8 alanjui  staff   256B  2 20 14:17 msgpack-1.0.2.dist-info
drwxr-xr-x   5 alanjui  staff   160B  2 20 14:17 neovim
drwxr-xr-x   7 alanjui  staff   224B  2 20 14:05 pip
drwxr-xr-x  10 alanjui  staff   320B  2 20 14:05 pip-21.0.1.dist-info
drwxr-xr-x   6 alanjui  staff   192B  2 20 11:46 pkg_resources
drwxr-xr-x   9 alanjui  staff   288B  2 20 14:17 pynvim
drwxr-xr-x   9 alanjui  staff   288B  2 20 14:17 pynvim-0.4.2-py3.9.egg-info
drwxr-xr-x  45 alanjui  staff   1.4K  2 20 11:46 setuptools
drwxr-xr-x  12 alanjui  staff   384B  2 20 11:46 setuptools-49.2.1.dist-info
```

## Django Project

1. Install package for projects

```
pip install -r requirements.txt
```

```
$ cd ~/workspace/django/test-100

$ pyenv version
venv-3.9.1 (set by /Users/alanjui/workspace/django/test-100/.python-version)

$ la ~/.pyenv/versions/3.9.1/envs/venv-3.9.1/lib/python3.9/site-packages
total 8
drwxr-xr-x   3 alanjui  staff    96B  2 20 21:12 __pycache__
-rw-r--r--   1 alanjui  staff   126B  2 20 21:12 easy_install.py
drwxr-xr-x   7 alanjui  staff   224B  2 20 21:12 pip
drwxr-xr-x  10 alanjui  staff   320B  2 20 21:12 pip-20.2.3.dist-info
drwxr-xr-x   6 alanjui  staff   192B  2 20 21:12 pkg_resources
drwxr-xr-x  45 alanjui  staff   1.4K  2 20 21:12 setuptools
drwxr-xr-x  12 alanjui  staff   384B  2 20 21:12 setuptools-49.2.1.dist-info

$ pip install -r requirements.txt
....

$la ~/.pyenv/versions/3.9.1/envs/venv-3.9.1/lib/python3.9/site-packages
total 616
drwxr-xr-x  12 alanjui  staff   384B  2 20 21:53 Django-3.1.7.dist-info
drwxr-xr-x   7 alanjui  staff   224B  2 20 21:53 __pycache__
drwxr-xr-x  12 alanjui  staff   384B  2 20 21:53 asgiref
drwxr-xr-x   9 alanjui  staff   288B  2 20 21:53 asgiref-3.3.1.dist-info
drwxr-xr-x  30 alanjui  staff   960B  2 20 21:53 astroid
drwxr-xr-x  10 alanjui  staff   320B  2 20 21:53 astroid-2.4.2.dist-info
drwxr-xr-x  11 alanjui  staff   352B  2 20 21:53 autopep8-1.5.5.dist-info
-rw-r--r--   1 alanjui  staff   148K  2 20 21:53 autopep8.py
drwxr-xr-x  22 alanjui  staff   704B  2 20 21:53 django
-rw-r--r--   1 alanjui  staff   126B  2 20 21:12 easy_install.py
drwxr-xr-x  10 alanjui  staff   320B  2 20 21:53 greenlet
drwxr-xr-x   9 alanjui  staff   288B  2 20 21:53 greenlet-1.0.0-py3.9.egg-info
drwxr-xr-x  34 alanjui  staff   1.1K  2 20 21:53 isort
drwxr-xr-x   9 alanjui  staff   288B  2 20 21:53 isort-5.7.0.dist-info
drwxr-xr-x  10 alanjui  staff   320B  2 20 21:53 lazy_object_proxy
drwxr-xr-x  10 alanjui  staff   320B  2 20 21:53 lazy_object_proxy-1.4.3.dist-info
drwxr-xr-x  11 alanjui  staff   352B  2 20 21:53 mccabe-0.6.1.dist-info
-rw-r--r--   1 alanjui  staff    10K  2 20 21:53 mccabe.py
drwxr-xr-x   9 alanjui  staff   288B  2 20 21:53 msgpack
drwxr-xr-x   7 alanjui  staff   224B  2 20 21:53 msgpack-1.0.2-py3.9.egg-info
drwxr-xr-x   5 alanjui  staff   160B  2 20 21:53 neovim
drwxr-xr-x  10 alanjui  staff   320B  2 20 21:53 neovim_remote-2.4.0.dist-info
drwxr-xr-x   5 alanjui  staff   160B  2 20 21:53 nvr
drwxr-xr-x   7 alanjui  staff   224B  2 20 21:54 pip
drwxr-xr-x  10 alanjui  staff   320B  2 20 21:54 pip-21.0.1.dist-info
drwxr-xr-x   6 alanjui  staff   192B  2 20 21:12 pkg_resources
drwxr-xr-x  16 alanjui  staff   512B  2 20 21:53 psutil
drwxr-xr-x   9 alanjui  staff   288B  2 20 21:53 psutil-5.8.0-py3.9.egg-info
drwxr-xr-x  11 alanjui  staff   352B  2 20 21:53 pycodestyle-2.6.0.dist-info
-rw-r--r--   1 alanjui  staff   101K  2 20 21:53 pycodestyle.py
drwxr-xr-x  20 alanjui  staff   640B  2 20 21:53 pylint
drwxr-xr-x  10 alanjui  staff   320B  2 20 21:53 pylint-2.6.2.dist-info
drwxr-xr-x   9 alanjui  staff   288B  2 20 21:53 pynvim
drwxr-xr-x   9 alanjui  staff   288B  2 20 21:53 pynvim-0.4.2-py3.9.egg-info
drwxr-xr-x  10 alanjui  staff   320B  2 20 21:53 pytz
drwxr-xr-x  12 alanjui  staff   384B  2 20 21:53 pytz-2021.1.dist-info
drwxr-xr-x  45 alanjui  staff   1.4K  2 20 21:12 setuptools
drwxr-xr-x  12 alanjui  staff   384B  2 20 21:12 setuptools-49.2.1.dist-info
drwxr-xr-x   9 alanjui  staff   288B  2 20 21:53 six-1.15.0.dist-info
-rw-r--r--   1 alanjui  staff    33K  2 20 21:53 six.py
drwxr-xr-x  16 alanjui  staff   512B  2 20 21:53 sqlparse
drwxr-xr-x  11 alanjui  staff   352B  2 20 21:53 sqlparse-0.4.1.dist-info
drwxr-xr-x   8 alanjui  staff   256B  2 20 21:53 toml
drwxr-xr-x   9 alanjui  staff   288B  2 20 21:53 toml-0.10.2.dist-info
drwxr-xr-x   8 alanjui  staff   256B  2 20 21:53 wrapt
drwxr-xr-x   7 alanjui  staff   224B  2 20 21:53 wrapt-1.12.1-py3.9.egg-info
```
