import Foundation

// 직접 구현해보기
// MARK: - 1. struct 구현하기
struct UserStruct {
    var name: String = ""
    var age: Int = 0
}

var userStruct = UserStruct()
var cheolsuStruct = userStruct
var yuriStruct = userStruct

cheolsuStruct.name = "cheolsu"
cheolsuStruct.age = 7
yuriStruct.name = "yuri"
yuriStruct.age = 8

print(userStruct)
print(cheolsuStruct)
print(yuriStruct)
// 출력 결과
/*
 UserStruct(name: "", age: 0)
 UserStruct(name: "cheolsu", age: 7)
 UserStruct(name: "yuri", age: 8)
 */

// MARK: - 2. class 구현하기
class UserClass {
    var name: String = ""
    var age: Int = 0
}

var userClass = UserClass()
var cheolsuClass = userClass
var yuriClass = userClass

cheolsuClass.name = "cheolsu"
cheolsuClass.age = 7

print(userClass.name)
print(userClass.age)
print(cheolsuClass.age)
print(cheolsuClass.name)
print(yuriClass.name)
print(yuriClass.age)
// 출력 결과
/*
 cheolsu
 7
 7
 cheolsu
 cheolsu
 7
 */


// MARK: - 3.4 Greetable 프로토콜 및 확장
protocol Greetable {
    func greet() -> String
}

extension Greetable {
    func greet() -> String {
        return "Hello!"
    }
}

struct Person: Greetable {
    var name: String
    func greet() -> String {
        return name
    }
}

class Robot: Greetable {
    var id: String = ""
    
    func greet() -> String {
        return id
    }
}

struct Alien: Greetable { }
let alien = Alien()
print(alien.greet())

