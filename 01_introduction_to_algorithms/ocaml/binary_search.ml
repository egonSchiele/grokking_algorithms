let rec binary_search ?(min = 0) ?(max = None) seq target =
  let max_ = match max with None -> Array.length seq - 1 | Some i -> i in
  if min > max_ then None
  else if Array.length seq = 0 then None
  else
    let mid = (max_ + min) / 2 in
    let current = seq.(mid) in
    if current = target then Some mid
    else if current > target then
      binary_search ~min ~max:(Some (mid - 1)) seq target
    else
      binary_search ~min:(mid + 1) ~max seq target

let print_result result =
  match result with
  | None -> print_endline "not found"
  | Some i -> print_string "found: " ; print_int i ; print_newline ()

let my_list = [|1; 3; 5; 7; 9|]

(* 1 *)
let () = print_result (binary_search my_list 3)

(* None *)
let () = print_result (binary_search my_list (-1))
