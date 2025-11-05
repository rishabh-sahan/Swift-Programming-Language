//Control Flow
//For Loops
//For-in

for index in 1...10 {
    print("\(index) times 12 is \(index * 12)")
}

for _ in 1..<4 {
    print("Hello!!")
}

let checkList = ["Ram", "Roy", "Raj", "Shiv"];
for i in 0..<checkList.count {
    print(checkList[i])
}

for name in checkList {
    print("Kill \(name)")
}

//Iterate a dictionary

let nickNames: [String: String] = ["King": "Roy", "Imp": "Queen"]
for (key , value) in nickNames {
    print("\(key) is also known as \(value)")
}

//While Loops
var index = 1
while index<5 {
    print("Hello World!!")
    index+=1
}

repeat {
    print("Hello!!")
    index+=1
} while index < 3

//if
if index == 6 {
    print("True")
} else {
    print("False")
}

if index < 6 {
    print("Less than 6")
} else if index == 6 {
    print("Six")
} else {
    print("Large Number")
}

//switch
index = 8
switch index {
case 0:
    print("Zero")
case 1, 2:
    print("1 or 2")
case 3..<7:
    print("3 to 6")
case 7...10:
    print("7 to 10")
    fallthrough
default:
    print("Not worth it")
}
