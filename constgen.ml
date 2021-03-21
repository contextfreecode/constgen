module type Message_type = sig
  val message : string
end

module type Hello_type = sig
  val hello : unit -> unit
end

(* module Hello (Hello : Hello_type) : Hello_type = struct *)
module Hello (Message : Message_type) : Hello_type = struct
  (* let message = "Hello" *)
  let hello () = print_endline Message.message
end

module Other_hello =
  Hello (
    struct
      let message = "Hi"
    end)

let goodbye () = print_endline "Goodbye"

let hello_goodbye () =
  Other_hello.hello ();
  goodbye ()

let main () =
  hello_goodbye ()

let () = main ()
