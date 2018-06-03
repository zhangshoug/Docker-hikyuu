#!/bin/bash
echo start ................................. $0

#set -e
tocheckfile=$tmpdir/ta-lib-0.4.0-src.tar.gz
if [ -f $tocheckfile ]; then
  tar -xzf $tocheckfile
  cd ta-lib/
  ./configure --prefix=/usr LDFLAGS="-lm"
  # 加上 make -j4 会报错 Makefile:254: recipe for target 'gen_code-gen_code.o' failed
  make
  make install
  cd ../
  rm $tocheckfile
  rm -rf ta-lib
fi

if [ -f /opt/conda/bin/conda ]; then
echo ".............................. conda update"
/opt/conda/bin/conda install -y pandas numpy flask beautifulsoup4 requests ipython
/opt/conda/bin/conda install -y matplotlib lxml hdf5 jupyter
/opt/conda/bin/conda install -y mkl
echo .............................. conda update Done
fi

echo ".............................. pip install ta-lib"

#pip install ta-lib
#pip install pyperclip
pip install ta-lib -i https://pypi.tuna.tsinghua.edu.cn/simple
pip install pyperclip -i https://pypi.tuna.tsinghua.edu.cn/simple

echo done ................................. $0
