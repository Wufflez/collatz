let rec collatz input =
    match input with
    | 1 -> [1]
    | x when x % 2 = 1 -> x :: collatz (x * 3 + 1)
    | x -> x :: collatz (x / 2)

[<EntryPoint>]
let main(args) =           
    let user_input = match args with
                     | [|arg|] -> arg
                     | _ -> printf "Please enter input value: "
                            System.Console.ReadLine()

    printf $"Collatz : "; user_input |> int |> collatz |> List.iter (printf "%d ")    
    0
