TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
echo $TF_INC # /usr/local/lib/python3.6/dist-packages/tensorflow_core/include

TF_LIB=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')
echo $TF_LIB # /usr/local/lib/python3.6/dist-packages/tensorflow_core/

ln -s $TF_LIB/libtensorflow_framework.so.1 \
    $TF_LIB/libtensorflow_framework.so
g++ -std=c++11 -shared rnn_ops.cc -o rnn_ops.so -fPIC -I $TF_INC -L $TF_LIB -ltensorflow_framework -O3 -mavx -D_GLIBCXX_USE_CXX11_ABI=0

# cd ../python
# python vgslspecs_test.py