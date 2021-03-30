module type Val_type = sig
  type t
end

module Hi (Val : Val_type) = struct
  type t = Val.t
end

module FloatHi = Hi (struct
  include Float
  (* include Int *)
end)

let main () =
  let a : FloatHi.t = 1.0 in
  Printf.printf "hi: %f\n" a

let () = main ()
