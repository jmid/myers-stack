Myers stack
===========

This module implements a 'Myers stack' in OCaml.

The distinguishing feature of such stacks is arbitrary access in O(log n)
time and constant time length. The remaining operations match those of
OCaml's builtin singly-linked lists.

For more information, see Myers:IPL83 "An applicative random-access
stack" available here:
  http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.188.9344


To build:
---------

On the command line simply run:

    $ make


To run:
-------

On the command line run:

    $ ocaml myers.cmo
        OCaml version 4.01.0

    # let l = Myers.fromlist ["0";"1";"2";"3";"4";"5";"6";"7"];;
    val l : string Myers.t = <abstr>
    # Myers.length l;;
    - : int = 8
    # Myers.hd (Myers.tl (Myers.tl l));;
    - : string = "2"
    # Myers.nth l 4;;                                           
    - : string = "4"
    # Myers.nth l 0;;
    - : string = "0"
    # 
