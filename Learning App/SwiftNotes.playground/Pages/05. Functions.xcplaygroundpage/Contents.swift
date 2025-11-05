//Functions Syntax

func simpleGreet(param1: String, param2: String) -> String {
    return param1 + " " + param2 + "!"
}
simpleGreet(param1: "Hello", param2: "World")


func addTwoNum(p1: Int, p2: Int)-> Int {
    return p1+p2
}
addTwoNum(p1: 25, p2: 23)

func mulTwoNum(p1: Int, p2: Int)-> Int {
    return p1*p2
}
mulTwoNum(p1: 25, p2: 23)

//Function with mutiple return types
func temperature() -> (Int, Int) {
    return(30, 45)
}
temperature().1

func food(pa1: String, _ pa2: String) -> String {
    return pa1 + " " + pa2
}
food(pa1: "Idli", "Vada")
