train_dir=/root/ctc
rm -rf $train_dir
mkdir -p $train_dir
python vgsl_train.py --model_str='1,32,0,1[S1(1x32)1,3 Lbx100]O1c105' \
  --max_steps=4096 --train_data=../testdata/arial-32-00000-of-00001 \
  --initial_learning_rate=0.001 --final_learning_rate=0.001 \
  --num_preprocess_threads=1 --train_dir=$train_dir &
python vgsl_eval.py --model_str='1,32,0,1[S1(1x32)1,3 Lbx100]O1c105' \
  --num_steps=256 --eval_data=../testdata/arial-32-00000-of-00001 \
  --num_preprocess_threads=1 --decoder=../testdata/arial.charset_size=105.txt \
  --eval_interval_secs=15 --train_dir=$train_dir --eval_dir=$train_dir/eval &
tensorboard --logdir=$train_dir
