module type Val_type = sig
  type t
end

module type VecOps_type = sig
  module Val : Val_type
end

(* The module type VecOps_type is what kills it. *)
module VecOps (Val : Val_type) = struct
(* module VecOps (Val : Val_type) : VecOps_type = struct *)
  module Val = Val
end

module VecOps2f = VecOps (Float)

let a : VecOps2f.Val.t = 1.0
