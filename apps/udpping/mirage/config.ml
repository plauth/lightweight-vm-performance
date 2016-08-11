open Mirage

let stack = generic_stackv4 default_console tap0

let main = foreign "Unikernel.Main" (stackv4 @-> job)

let () =
  register "udpping" [main $ stack]
