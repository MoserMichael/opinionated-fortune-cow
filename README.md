
## opinionated fortune cow.

The cows.sh script pipes the result of [fortune](https://en.wikipedia.org/wiki/Fortune_%28Unix%29) into [cowsay](https://en.wikipedia.org/wiki/Cowsay) . Now the fortune cookie is passed through sentiment analysis, if the compound result is positive then the cow has a cheerful expression, if negative then the cow has a sad expression.

The first run of the cows.sh script writes s a python script that calls [nltk](https://www.nltk.org/) and a virtual environment that installs nltk, that is needed for running the sentiment analysis step.
All this goodness is put into directory ~/.opinionated-fortune-cow

In the end it looks as follows, when the cow is happy

```
 ________________________________________
/  In the beginning was the Tao. The Tao \
| gave birth to Space and Time.          |
| Therefore, Space and Time are the Yin  |
| and Yang of programming.               |
|                                        |
| Programmers that do not comprehend the |
| Tao are always running out of time and |
| space for their programs. Programmers  |
| that comprehend the Tao always have    |
| enough time and space to accomplish    |
| their goals.                           |
|                                        |
| How could it be otherwise?             |
|                                        |
| -- Geoffrey James, "The Tao of         |
\ Programming"                           /
 ----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
             :) ||----w |
                ||     ||
nltk score: 42 '(from -100..100) state: 'good' eye: oo tongue: :)
```

Or the cow may look a bit sad, like this:
```
 ________________________________________
/ Power is danger.                       \
|                                        |
| -- The Centurion, "Balance of Terror", |
\ stardate 1709.2                        /
 ----------------------------------------
        \   ^__^
         \  (!!)\_______
            (__)\       )\/\
             :( ||----w |
                ||     ||
nltk score: -53 '(from -100..100) state: 'bad' eye: !! tongue: :(
```

However most of the time the cow will likely remain indifferent:

```

 _________________________________________
/ Reading is thinking with someone else's \
\ head instead of one's own.              /
 -----------------------------------------
        \   ^__^
         \  (..)\_______
            (__)\       )\/\
             -- ||----w |
                ||     ||
nltk score: 0 '(from -100..100) state: 'neutral' eye: .. tongue: --
```

The cow might get excited about something, then she is very happy:

```
 _________________________________________
/ If a team is in a positive frame of     \
| mind, it will have a good attitude. If  |
| it has a good attitude, it will make a  |
| commitment to playing the game right.   |
| If it plays the game right, it will win |
| -- unless, of course, it doesn't have   |
| enough talent to win, and no manager    |
| can make goose-liver pate out of goose  |
| feathers, so why worry?                 |
|                                         |
\ -- Sparky Anderson                      /
 -----------------------------------------
        \   ^__^
         \  (OO)\_______
            (__)\       )\/\
             :) ||----w |
                ||     ||
nltk score: 94 '(from -100..100) state: 'very good' eye: OO tongue: :)
```

Or she might be very very sad.
```
 ________________________________________
/ A scientific truth does not triumph by \
| convincing its opponents and making    |
| them see the light, but rather because |
| its opponents eventually die and a new |
| generation grows up that is familiar   |
| with it.                               |
|                                        |
\ -- Max Planck                          /
 ----------------------------------------
        \   ^__^
         \  (~~)\_______
            (__)\       )\/\
             :( ||----w |
                ||     ||
nltk score: -80 '(from -100..100) state: 'very bad' eye: ~~ tongue: :(

 ________________________________________
/ A man would still do something out of  \
| sheer perversity - he would create     |
| destruction and chaos - just to gain   |
| his point... and if all this could in  |
| turn be analyzed and prevented by      |
| predicting that it would occur, then   |
| man would deliberately go mad to prove |
| his point.                             |
|                                        |
| -- Feodor Dostoevsky, "Notes From the  |
\ Underground"                           /
 ----------------------------------------
        \   ^__^
         \  (~~)\_______
            (__)\       )\/\
             :( ||----w |
                ||     ||
nltk score: -86 '(from -100..100) state: '' eye: ~~ tongue: :(
```

### Installation

You need cow and fortune

- ```brew install cowsay```
- ```brew install fortune```

or 

- ```apt-get install cowsay```
- ```apt-get install fortune```

You also need to have python3 and bash

### what i learned from this.

if you look at the texts produced by the [fortune](https://en.wikipedia.org/wiki/Fortune_%28Unix%29) program, then these look quite different to the training set of the [vader](https://github.com/cjhutto/vaderSentiment) sentiment analysis module that is used in [nltk](https://www.nltk.org/) ; now any model can work only if applied to a similar data set as that used during training; obviously.

However this project helped me to get practice with python3 [virtual environments](https://docs.python.org/3/library/venv.html) , and that is probably a good thing. A vitual environment has a bin/python script, this is runnable and runs a python interpreter within that virtual enviroment. The virtual environment can have it's own isolated packages, and that is a cleaner way to handle package dependencies in python.
