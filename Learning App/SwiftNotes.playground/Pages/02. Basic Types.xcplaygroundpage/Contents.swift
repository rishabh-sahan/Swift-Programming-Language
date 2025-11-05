let float = 12.5
let weight: Float = 108.6
let weight1: Double = 100.6755

//Number Formatting
let paddedDouble = 000123.456
let twoMillion = 2_000_000
print(twoMillion)
let multiMillion = 1_000_000_.000_000_1

//Bools
let trustHim = true
let trustHer: Bool = false

//Typealias - Define an alternative name for exisiting type
typealias CID = UInt64
let roo: CID = 25

//Strings
let emptyString = ""
let anotherString = String()
emptyString == anotherString

let greeting = "Namaste!! " + "Haaa"
let anotherGreet: String = "Helloo!!"
greeting == anotherGreet
let combinedGreet = greeting + " and " + anotherGreet

//Tuples
let rohith = (45, "Cricket")
rohith.0
rohith.1
//Decompose Tuple
let (jno, profession) = rohith

print("rohith jersey no is \(jno) and his profession is \(profession)")

let(_, game) = rohith
print("Rohith fav game is \(game)")

let virat = (age: 35, family: "Kohli")

//Collection Types
//Array
var name = ["Rishabh", "Vikas", "Abhishek", "Manoj"]
let places: Array<String> = ["Mandya", "Mysore", "Banglore"]

var empty = [String]()
print("The names are \(name.count)")
name[1]
empty.append("Rahul")

empty.insert("Sahan", at: 0)
empty.removeFirst()
empty.isEmpty

name += ["Sahan"]
name[2] = "Jain"
name+=empty
print(empty)

var names = [String](repeating: "Manju", count: 5)
print("I dont like \(name[4])")

name[3...5]

var basicSyntax = Dictionary<String, String>()

var nickNames: [String: String] = ["Kings": "Jimmy", "Imp": "Tyson"]

//Declare a dictionary student with student name, ID, branch
var student = ["Student-1": ["Rishabh", 21, "Computer-Science"], "Student-2": ["Vikas", 80, "Computer-Science"]]
print(student)

