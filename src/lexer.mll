
{
  let ws_count = ref 0
  let (ws_stack : int Stack.t) = Stack.create ()
}

rule main = parse
  | '\n'        { Printf.printf "NEWLINE\n"; ws_count := 0; indent lexbuf; }
  | _           { main lexbuf; }
  | eof         { () }
and indent = parse
  | ' '   { incr ws_count; indent lexbuf; }
  | '\t'  { ws_count := !ws_count + 4}
  | _     { if !ws_count > Stack.top ws_stack then
              (Stack.push !ws_count ws_stack;
               Printf.printf "INDENT ";)
            else while !ws_count < Stack.top ws_stack do
              ignore (Stack.pop ws_stack);
              Printf.printf "UNDENT ";
            done;
            main lexbuf;
          }
{
  let main () =
    let lexbuf = Lexing.from_channel stdin in
    Stack.push 0 ws_stack;
    indent lexbuf
  let _ = Printexc.print main ()
}
