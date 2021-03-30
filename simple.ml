module type Val_type = sig
  module X : sig
    type t
  end
end

module Hi (Val : Val_type) = struct
  (* type t = Val.t *)
  module X = Val.X
end

module FloatHi = Hi (struct
  module X = Float
  (* include Float *)
  (* include Int *)
end)

let main () =
  let a : FloatHi.X.t = 1.0 in
  let b : FloatHi.X.t array = [|1.0|] in
  Printf.printf "hi: %f\n" a

let () = main ()
