module type Vec_type = sig
  val size : int
end

(* module type VecOps_type = sig
  (* type Vec = floatarray *)
  val dot : floatarray -> floatarray -> float
end

module VecOps (Vec : Vec_type) : VecOps_type = struct
  let dot a b =
    let prods = Float.Array.map2 (fun x y -> x *. y) a b in
    Float.Array.fold_left (fun x sum -> x +. sum) 0.0 prods
end *)

module type VecOps_type = sig
  val dot : float array -> float array -> float
  val norm : float array -> float
end

module VecOps (Vec : Vec_type) : VecOps_type = struct
  let dot a b =
    let prods = Array.map2 (fun x y -> x *. y) a b in
    Array.fold_left (fun x sum -> x +. sum) 0.0 prods
  let norm a = Float.sqrt (dot a a)
end

module VecOps2f =
  VecOps (
    struct
      let size = 2
    end
  )

let main () =
  let a = [|1.5; 2.0|] in
  print_endline (string_of_float (VecOps2f.norm a))

let () = main ()
