train_dir=/root/fixed
rm -rf $train_dir
mkdir -p $train_dir
python vgsl_train.py --model_str='8,16,0,1[S1(1x16)1,3 Lfx32 Lrx32 Lfx32]O1s12' \
  --max_steps=3072 --train_data=../testdata/numbers-16-00000-of-00001 \
  --initial_learning_rate=0.001 --final_learning_rate=0.001 \
  --num_preprocess_threads=1 --train_dir=$train_dir
python vgsl_eval.py --model_str='8,16,0,1[S1(1x16)1,3 Lfx32 Lrx32 Lfx32]O1s12' \
  --num_steps=256 --eval_data=../testdata/numbers-16-00000-of-00001 \
  --num_preprocess_threads=1 --decoder=../testdata/numbers.charset_size=12.txt \
  --eval_interval_secs=0 --train_dir=$train_dir --eval_dir=$train_dir/eval
