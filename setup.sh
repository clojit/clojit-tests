
rm -rf ./tmp
clang --version
mkdir tmp
cd tmp
git clone https://github.com/clojit/clojit-c.git
git clone https://github.com/clojit/clojit-cvm.git
cd clojit-cvm
make

