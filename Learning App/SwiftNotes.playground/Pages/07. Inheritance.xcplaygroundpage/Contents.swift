class ParentClass {
    var name: String = "Parent"
    func sayHii() {
        print("Hello from Parent")
    }
}

class ChildClass: ParentClass {
    var subName: String = "Child"
    override func sayHii() {
        print("Hello from child")
    }
}

let CP = ChildClass()
print(CP.name)
CP.sayHii()
