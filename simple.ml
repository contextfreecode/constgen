module type Val_type = sig
  type t
end

module type Vec_type = sig
  module Val : Val_type
end

module type VecOps_type = sig
  module Val : Val_type
end

(* The module type VecOps_type is what kills it. *)
module VecOps (Vec : Vec_type) = struct
(* module VecOps (Val : Val_type) : VecOps_type = struct *)
  include Vec
end

module VecOps2f = VecOps (struct
  module Val = struct
    include Float
  end
end)

let a : VecOps2f.Val.t = 1.0
