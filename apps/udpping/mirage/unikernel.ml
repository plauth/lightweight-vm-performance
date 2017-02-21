module Main (S:V1_LWT.STACKV4) = struct
  module U = S.UDPV4

  let server = Ipaddr.V4.of_string_exn "192.168.42.42"
  let port = 1337
  let msg = Cstruct.of_string "H"

  let start s =
    let udp = S.udpv4 s in
    S.UDPV4.write ~source_port:1338 ~dest_ip:server ~dest_port:port udp msg
end
