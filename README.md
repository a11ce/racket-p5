# racket-p5

Uses [soegaard](https://github.com/soegaard)'s [urlang](https://github.com/soegaard/urlang) compiler to give p5.js Racket-y syntax.

## Setup

Run `raco pkg install p5` or go to `File > Install Package...` in DrRacket and install p5.

## Usage

Start your file with `#lang p5`, then do your best to write p5 code with Racket syntax and it should mostly work how you expect. Also see `examples/`. 

Running your program will display the compiled p5.js sketch. 

### Options

Certain top-level expressions (prefixed with `^`) are recognized as language options. They are applied per source file.

- `(^output-file "filename.js")` writes the compiled JS to the specified path.

## How it works

`#lang p5` is a wrapper around urlang which:
- makes urlang think that p5 identifiers are bound
- adds the needed boilerplate so the user can focus on creating
- provides some extra options

## Demos

- [space-draw](https://a11ce.com/racket-p5/examples/space-draw/space-draw.html)
- [Unknown Pleasures](https://a11ce.com/racket-p5/examples/unknown-pleasures/unknown-pleasures.html)
<!-- Add your own! -->

--- 

All contributions are welcome by pull request or issue.
