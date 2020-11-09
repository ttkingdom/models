train_dir=/root/mnist
rm -rf $train_dir
mkdir -p $train_dir
python vgsl_train.py --model_str='16,0,0,1[Ct5,5,16 Mp3,3 Lfys32 Lfxs64]O0s12' \
  --max_steps=1024 --train_data=../testdata/mnist-sample-00000-of-00001 \
  --initial_learning_rate=0.001 --final_learning_rate=0.001 \
  --num_preprocess_threads=1 --train_dir=$train_dir
python vgsl_eval.py --model_str='16,0,0,1[Ct5,5,16 Mp3,3 Lfys32 Lfxs64]O0s12' \
  --num_steps=256 --eval_data=../testdata/mnist-sample-00000-of-00001 \
  --num_preprocess_threads=1 --decoder=../testdata/numbers.charset_size=12.txt \
  --eval_interval_secs=0 --train_dir=$train_dir --eval_dir=$train_dir/eval
