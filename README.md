
## opinionated fortune cow.

The cows.sh script pipes the result of [fortune](https://en.wikipedia.org/wiki/Fortune_%28Unix%29) into [cowsay](https://en.wikipedia.org/wiki/Cowsay) . Now the fortune cookie is passed through sentiment analysis, if the compound result is positive then the cow has a cheerful expression, if negative then the cow has a sad expression.

The first run of this script creates a python virtual environment that installs nltk, that is needed for running the sentiment analysis step.
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
nltk score: 42 '(from -100..100) state: 'good' eye: o tongue: :)
```

Or the cow may look a bit sad, like this:
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
nltk score: -80 '(from -100..100) state: 'very bad' eye: ~ tongue: :(
```

However most of the time the cow will likely remain indifferent:

```
 _________________________________________
/ I do hate sums. There is no greater     \
| mistake than to call arithmetic an      |
| exact science. There are permutations   |
| and aberrations discernible to minds    |
| entirely noble like mine; subtle        |
| variations which ordinary accountants   |
| fail to discover; hidden laws of number |
| which it requires a mind like mine to   |
| perceive. For instance, if you add a    |
| sum from the bottom up, and then again  |
| from the top down, the result is always |
| different.                              |
|                                         |
\ -- Mrs. La Touche                       /
 -----------------------------------------
        \   ^__^
         \  (..)\_______
            (__)\       )\/\
             -- ||----w |
                ||     ||
nltk score: 17 '(from -100..100) state: 'neutral' eye: . tongue: --
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

However this project helped me to get practice with python3 [virtual environments](https://docs.python.org/3/library/venv.html) , and that is probably a good thing.
