import Foundation

// 직접 구현해보기
// MARK: - 1. 자료구조 구현
// Queue
struct Queue {
    var element: [Int]
    private var idx: Int
    
    init() {
        self.element = []
        self.idx = 0
    }
    
    mutating func enqueue(num: Int) {
        element.append(num)
    }
    
    mutating func dequeue() -> Int? {
        if element.isEmpty { return nil }
        let returnNum = element[idx]
        idx += 1
        return returnNum
    }
    
    mutating func currentState() {
        if idx != 0 {
            var newElements: [Int] = []
            for i in idx..<element.count {
                newElements.append(element[i])
            }
            idx = 0
            element = newElements
        }
        print(element)
    }
}

var queue = Queue()
queue.enqueue(num: 1)
queue.enqueue(num: 2)
queue.enqueue(num: 3)
queue.enqueue(num: 4)
queue.enqueue(num: 5)
queue.currentState()

print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())
queue.currentState()


// Stack
struct Stack {
    var elements: [String]
    
    init() {
        self.elements = []
    }
    
    mutating func push(str: String) {
        elements.append(str)
    }
    
    mutating func pop() -> String? {
        return elements.popLast()
    }
    
    func top() -> String? {
        return elements.last
    }
}

var stack = Stack()
stack.push(str: "1")
stack.push(str: "2")
stack.push(str: "3")
stack.push(str: "4")

print(stack.top())

print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.pop())



// MARK: - 2. ARC와 순환 참조 해결
class Person {
    var name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
        print("Person init")
    }
    deinit {
        print("Person deinit")
    }
}

class Pet {
    weak var owner: Person?
    
    init() {
        print("Pet init")
    }
    
    deinit {
        print("Pet deinit")
    }
}

var person: Person?
var pet: Pet?

person = Person(name: "cheolsu")
pet = Pet()

person!.pet = pet
pet!.owner = person

person = nil
pet = nil
