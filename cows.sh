#!/bin/bash

function run_cow {  
    local ENV_DIR
    local score
    local state
    local EYE
    local TONGUE

    ENV_DIR="$1"

    fortune >/tmp/cow
        
    # 1. print message
    # 2. remove newlines
    # 3. leave out only ascii characters
    # 4. remove the author (after -- <auhtor>)
    # 5. turn to lower case.
    # 6. call nltk to do the sentiment analysis
    # 7. leave out the number after compound: 
    # 8. normalize to range of -100..100
    # 9. should have done the text fiddling in python.

    score=$(cat /tmp/cow | tr '\n' ' ' | tr -dc '[:print:]' | sed -e 's/\(.*\)--\(.*\)$/\1/g' |  tr '[:upper:]' '[:lower:]' |  $ENV_DIR/n.py  2>/dev/null |  sed -e 's/compound: \([0-9\.\-]*\).*/\1/' |  awk '{printf "%.0f\n", $1 * 100 }')

    # echo "score: $score"
        
    if [ "$score" -ge 60 ]; then
           state="very good"
           EYE="O"
           TONGUE=":)" 
    elif [ "$score" -ge 30 ]; then 
           state="good"
           EYE="o"
           TONGUE=":)" 
    elif [ "$score" -le -60 ]; then
           state="very bad"
           EYE="~"
           TONGUE=":(" 
    elif [ "$score" -le -30 ]; then
           state="bad"
           EYE="!"
           TONGUE=":(" 
    else
           state="neutral"
           EYE="."
           TONGUE="--" 
    fi

    #not all cow shapes support eye and tongue character. strange
    #random_shape="-f "$(cowsay -l | sed '1d' | tr ' ' '\n' | shuf -n 1 | awk '{ print $1 }') 

    #cat /tmp/cow | cowsay -e $EYE -T $TONGUE $random_shape
    cat /tmp/cow | cowsay -e $EYE -T $TONGUE 
    echo "nltk score: $score '(from -100..100) state: '$state' eye: $EYE tongue: $TONGUE"
}

function install_cow {
    local ENV_DIR
    local EDIR

    ENV_DIR="$1"

    echo "installing opinionated cow - first time install"
    pushd "$HOME"

    EDIR=$(basename "${ENV_DIR}")
    python3 -m venv "$EDIR"

    bash -c "source ${ENV_DIR}/bin/activate; cd ${ENV_DIR}; pip install nltk"

    cat >${ENV_DIR}/n.py <<EOF
#!${ENV_DIR}/bin/python

import sys
import nltk
import ssl

# fix validation error; see https://stackoverflow.com/questions/38916452/nltk-download-ssl-certificate-verify-failed    
try:
    _create_unverified_https_context = ssl._create_unverified_context
except AttributeError:
    pass
else:
    ssl._create_default_https_context = _create_unverified_https_context

nltk.downloader.download('vader_lexicon')

from nltk.sentiment import SentimentIntensityAnalyzer

def check_it(sentence):
    #print("input {}".format( sentence ))
    sid = SentimentIntensityAnalyzer()
    ss = sid.polarity_scores(sentence)
    for k in sorted(ss):
        print('{0}: {1}, '.format(k, ss[k]), end='')
    print()

for line in sys.stdin:
    check_it(line)
EOF

   chmod +x "${ENV_DIR}/n.py" 
    
   popd
}

function opinionated_cow {
 
    local ENV_DIR

    ENV_DIR="$HOME/.opinionated-fortune-cow"

    if [[ -d $ENV_DIR ]]; then
        run_cow "$ENV_DIR"
    else 
        install_cow "$ENV_DIR"
        run_cow "$ENV_DIR"
    fi
}

opinionated_cow
