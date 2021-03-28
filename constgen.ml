module type Vec_type = sig
  val size : int
end

module type VecOps_type = sig
  val dot : float array -> float array -> float
  val norm : float array -> float
end

module VecOps (Vec : Vec_type) : VecOps_type = struct
  let dot a b =
    (* Loop on int range just to show we can use the size. *)
    let range = Array.init Vec.size succ in
    let prods = Array.map (fun i -> a.(i - 1) *. b.(i - 1)) range in
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
