
## opinionated fortune cow.

the cows.sh script pipes the result of [fortune](https://en.wikipedia.org/wiki/Fortune_%28Unix%29) into [cowsay](https://en.wikipedia.org/wiki/Cowsay) . Now the fortune cookie is passed through sentiment analysis, if the compound result is positive then the cow has a cheerful expression, if negative then the cow has a sad expression.

The first run of this script creates a python virtual environment that installs nltk, that is needed for running the sentiment analysis step.
all this goodness is put into directory ~/.opinionated-fortune-cow


### what i learned from this.

if you look at the texts produced by the [fortune](https://en.wikipedia.org/wiki/Fortune_%28Unix%29) program, then these look quite different to the training set of the [vader](https://github.com/cjhutto/vaderSentiment) sentiment analysis module that is used in [nltk](https://www.nltk.org/) ; now any model can work only if applied to a similar data set as that used during training; obviously.

However this project helped me to get practice with python3 [virtual environments](https://docs.python.org/3/library/venv.html) , and that is probably a good thing.
