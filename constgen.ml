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

(* module type VecOps_type = sig
  module Val : Val_type
  module Vec : Vec_type
  val dot : Val.t array -> Val.t array -> Val.t
  val norm : Val.t array -> Val.t
end *)

module VecOps (Vec : Vec_type) = struct
  include Vec
  let dot a b =
    (* Loop on int range just to show we can use the size. *)
    let range = Array.init size succ in
    let prods = Array.map (fun i -> Val.mul a.(i - 1) b.(i - 1)) range in
    Array.fold_left (fun x sum -> Val.add x sum) Val.zero prods
  let norm a = Val.sqrt (dot a a)
end

module VecOps2f = VecOps (struct
  module Val = Float
  let size = 2
end)

module VecOps2c = VecOps (struct
  module Val = struct
    include Complex
    let mul a b = mul a (conj b)
    let to_string a = Printf.sprintf "%f + %f im" a.re a.im
  end
  let size = 2
end)

module Ops = VecOps2f
(* module Ops = VecOps2c *)

let main () =
  let a = [|1.5; 2.0|] in
  (* let open Complex in
  let a = [|{re = 1.5; im = 1.0}; {re = 2.0; im = 2.0}|] in *)
  print_endline (Ops.Val.to_string (Ops.norm a))

let () = main ()
