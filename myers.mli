(** Myers stack interface *)

type 'a t
val nil      : 'a t
val cons     : 'a -> 'a t -> 'a t 
val hd       : 'a t -> 'a
val tl       : 'a t -> 'a t
val length   : 'a t -> int
val nth      : 'a t -> int -> 'a
val tolist   : 'a t -> 'a list
val fromlist : 'a list -> 'a t
