[![Build Status](https://travis-ci.org/thanhtan541/vim-shuffle.svg?branch=master)](https://travis-ci.org/thanhtan541/vim-shuffle)
# Vim-shuffle

## Intro
I ran into many situation of placing argument in wrong orders or dealing with legacy projects that have lots of 
arguments place inline (it hurts my eyes). With `Vim-shuffle`, long live those ugly appealing

## Feature
- Shuffle inline
- Split across multiple line
- Recommended interface 

## Function parameters
- shuffle#OrderParams(sort, fold)

| Name         | Value          | Meaning                        |
| :---         |     :---:      | :---                           |
| sort         | 1 or 0         | sorting the order of parameters|
| fold         | 1 or 0         | split parameters into lines    |


## Key-binding
#####Please feels free to map your key-combination for these two use-cases!
```.env
# Split inline parameters into multiple lines
call shuffle#OrderParams(0, 0)
# Shuffle orders of inline parameters
call shuffle#OrderParams(1, 1)
```

## Testing
```.env
# Run individual test
$ vim --clean -S test/run_test.vim test/tests/<your_test_file>.vim
# Run every tests
$ bash ./test/run_test.sh

```

## Supports
- Php
- Python
- ...

## Contributes
- Please visit [ycm-core/YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) - 99% of current test framework this awesome plugin
