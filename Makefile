all:
	ocamlc -c myers.mli myers.ml

clean:
	rm -f myers.cmi myers.cmo
