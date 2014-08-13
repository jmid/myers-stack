(** Myers stack implementation *)

type 'a t = { pair : 'a my_t;
	      len  : int;
	      jmp  : 'a t }
and 'a my_t =
  | Empty
  | Cons of 'a * 'a t

let rec nil =
  let rec null = { pair = Empty;
		   len  = 0;
		   jmp  = null } in null

let cons e m =
  let jmp    = m.jmp in
  let jmpjmp = jmp.jmp in
  let mlen   = m.len in
  let jmplen = jmp.len in
  let newlen = mlen + 1 in
  if (mlen - jmplen) = (jmplen - jmpjmp.len)
  then { pair = Cons(e,m) ; len = newlen; jmp = jmpjmp }
  else { pair = Cons(e,m) ; len = newlen; jmp = m }

let hd m = match m.pair with
  | Empty      -> raise (Failure "hd")
  | Cons (e,_) -> e

let tl m = match m.pair with
  | Empty       -> raise (Failure "tl")
  | Cons (_,m') -> m'

let length m = m.len

let rec nth m n = 
  let rec walk m index =
    match m.pair with
      | Empty       -> raise (Failure "nth")
      | Cons (e,m') ->
	if index = length m
	then e
	else
	  if index > (length m'.jmp) (* jmp takes us too far *)
	  then walk m' index
	  else walk m'.jmp index
  in
  if n < 0
  then raise (Invalid_argument "nth")
  else (* length is a "decreasing index" *)
       (* search for suffix with an appropriate index *)
    let index = (length m) - n in
    walk m index

let rec tolist m = match m.pair with
  | Empty -> []
  | Cons (e,m') -> e::(tolist m')

let fromlist ls = List.fold_right cons ls nil;;

