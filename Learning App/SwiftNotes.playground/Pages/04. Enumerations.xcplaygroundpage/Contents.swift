enum StudentsType {
    case Junior
    case Senior
    case Alumini
}

var studentsType = StudentsType.Alumini
switch studentsType {
case .Alumini:
    print("Old Student")
case .Senior:
    print("Final year Student")
case .Junior:
    print("First year student")
}
