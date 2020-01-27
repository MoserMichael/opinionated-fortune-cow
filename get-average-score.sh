#!/bin/bash

TEST_NUM=1000

#
# short script shows the average scores that nltk is producing
#

TOTAL_SCORE=0
POSITIVE_TOTAL_SCORE=0
NEGATIVE_TOTAL_SCORE=0
NUM_POSITIVE=0
NUM_NEGATIVE=0

ENV_DIR="$HOME/.opinionated-fortune-cow"

mkdir tmp
rm -rf tmp/*

for i in $(seq 1 $TEST_NUM); do

 fortune>tmp/try_$i
 
 score=$(cat tmp/try_$i | tr '\n' ' ' | tr -dc '[:print:]' | sed -e 's/\(.*\)--\(.*\)$/\1/g' | $ENV_DIR/n.py  2>/dev/null |  sed -e 's/compound: \([0-9\.\-]*\).*/\1/') 
 
 TOTAL_SCORE=$(echo "$TOTAL_SCORE $score" | awk '{ print $1 + $2 }')


 if [ "$score" != "0.0" ]; then
    if [ "${score:0:1}" == "-" ]; then 
        NEGATIVE_TOTAL_SCORE=$(echo "$NEGATIVE_TOTAL_SCORE $score" | awk '{ print $1 + $2 }')
        ((NUM_NEGATIVE += 1))
    else
        POSITIVE_TOTAL_SCORE=$(echo "$POSITIVE_TOTAL_SCORE $score" | awk '{ print $1 + $2 }')
        ((NUM_POSITIVE += 1))
    fi
 fi

 echo "try: $i total: $TOTAL_SCORE score: $score | total_positive: $POSITIVE_TOTAL_SCORE num_positive: $NUM_POSITIVE | total_negative: $NEGATIVE_TOTAL_SCORE num_negative: $NUM_NEGATIVE"
 
done

TOTAL_AVERAGE=$(echo "$TOTAL_SCORE $TEST_NUM" | awk '{ print $1 / $2 }')
POSITIVE_AVERAGE=$(echo "$POSITIVE_TOTAL_SCORE $NUM_POSITIVE" | awk '{ print $1 / $2 }')
NEGATIVE_AVERAGE=$(echo "$NEGATIVE_TOTAL_SCORE $NUM_NEGATIVE" | awk '{ print $1 / $2 }')

echo "average: $TOTAL_AVERAGE in num-tests: $TEST_NUM | positive-avg: $POSITIVE_AVERAGE in positive: $NUM_POSITIVE | negative-avg: $NEGATIVE_AVERAGE in negative: $NUM_NEGATIVE "
