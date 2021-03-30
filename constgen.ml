module type Val_type = sig
  type t
  val add : t -> t -> t
  val mul : t -> t -> t
  val sqrt : t -> t
  val to_string : t -> string
  val zero : t
end

module type Vec_type = sig
  val size : int
  module Val : Val_type
end

module type VecOps_type = sig
  module Vec : Vec_type
  val dot : Vec.Val.t array -> Vec.Val.t array -> Vec.Val.t
  val norm : Vec.Val.t array -> Vec.Val.t
end

module VecOps (Vec : Vec_type) : VecOps_type = struct
  open Vec.Val
  module Vec = Vec
  let dot a b =
    (* Loop on int range just to show we can use the size. *)
    let range = Array.init Vec.size succ in
    let prods = Array.map (fun i -> mul a.(i - 1) b.(i - 1)) range in
    Array.fold_left (fun x sum -> add x sum) zero prods
  let norm a = sqrt (dot a a)
end

module VecOps2c = VecOps (struct
  open Complex
  module Val : Val_type = struct
    include Complex
    let to_string c = Printf.sprintf "%f + %f im" c.re c.im
  end
  let size = 2
end)

module VecOps2f = VecOps (struct
  module Val = Float
  let size = 2
end)

(* module Ops = VecOps2c *)
module Ops = VecOps2f

let main () =
  let a = [|1.5; 2.0|] in
  (* let open Complex in
  let a : Complex.t array = [|{re = 1.5; im = 0.0}; {re = 2.0; im = 0.0}|] in *)
  print_endline (Ops.Vec.Val.to_string (Ops.norm a))

let () = main ()
