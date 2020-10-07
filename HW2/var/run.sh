OUT_DIR="./egorov_res"
NUM_REDUCERS=1
hdfs dfs -rm -r $OUT_DIR
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=${NUM_REDUCERS} -files mapper.py,reducer.py -mapper 'python3 ./mapper.py' -reducer 'python3 ./reducer.py' -input hw2_data/AB_NYC_2019.csv -output $OUT_DIR
for num in `seq 0 $(($NUM_REDUCERS - 1))`
do
    hdfs dfs -cat ${OUT_DIR}/part-0000$num | head  # Выводим 1-е 10 строк из каждого файла. 
done