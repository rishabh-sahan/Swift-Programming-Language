class Student{
    var name: String?
    
    init (name: String?=nil){
        self.name=name
    }
    func printTheName(){
        print(name)
    }
}

let stuObj = Student(name: "Hello")
stuObj.name
let stuObj1 = stuObj
stuObj.name = "Bye"
stuObj1.name

struct Login{
    var uname: String
    var pass: String
    
    func isValid()->Bool{
        return uname == "admin" && pass == "1234"
    }
}
var login1 = Login(uname: "admin", pass: "1234")
login1.isValid()
var login2 = login1
login1.uname = "admin1"
login2.uname

struct Name {
    var fname: String
    var lname: String
    func Greet() -> String {
        return fname + lname
    }
}
var Greeting = Name(fname: "Rishabh ", lname: "Jain ")
print("Welcome " + Greeting.Greet() + "to this world")
