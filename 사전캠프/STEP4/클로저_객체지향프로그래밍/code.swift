import Foundation

// 직접 구현해보기
// MARK: - 1. 클로저 구현하기
let arr = [1, 2, 3, 4, 5]
let result = arr.map{ $0 * 2 }
print(result)

var counter = 0
let incrementCounter = {
    counter += 1
}
incrementCounter()
incrementCounter()

print(counter)


class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("make sound")
    }
}

class Dog: Animal {
    
    override func makeSound() {
        print("Bark!")
    }
}

class Cat: Animal {
    
    override func makeSound() {
        print("Meow!")
    }
}

var animals: [Animal] = [Dog(name: "Dog"), Cat(name: "Cat")]

for animal in animals {
    animal.makeSound()
}
