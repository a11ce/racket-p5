# racket-p5

Uses [soegaard](https://github.com/soegaard)'s [urlang](https://github.com/soegaard/urlang) compiler to give p5.js Racket-y syntax.

## Setup

Run `raco pkg install p5` or go to `File > Install Package...` in DrRacket and install p5.

## Usage

Start your file with `#lang p5`, then do your best to write p5 code with Racket syntax and it should mostly work how you expect. Also see `examples/`. 

Running your program will display the compiled p5.js sketch. 

## Why?

I like Racket's syntax. I do not like JavaScript's syntax.

## How it works

`#lang p5` is a wrapper around urlang which:
- makes urlang think that p5 identifiers are bound
- adds the needed boilerplate so the user can focus on creating
- TODO: provides multiple output formats 

## Is it any good?

[Yes.](https://editor.p5js.org/a11ce/sketches/FZw3mATYb)

--- 

All contributions are welcome by pull request or issue.
