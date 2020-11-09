train_dir=/root/fsns
rm -rf $train_dir
mkdir -p $train_dir
python vgsl_train.py --max_steps=10000 --num_preprocess_threads=1 \
  --train_data=../testdata/fsns-00000-of-00001 \
  --initial_learning_rate=0.0001 --final_learning_rate=0.0001 \
  --train_dir=$train_dir &
python vgsl_eval.py --num_steps=256 --num_preprocess_threads=1 \
   --eval_data=../testdata/fsns-00000-of-00001 \
   --decoder=../testdata/charset_size=134.txt \
   --eval_interval_secs=300 --train_dir=$train_dir --eval_dir=$train_dir/eval &
tensorboard --logdir=$train_dir
