import Foundation

// 직접 구현해보기
// MARK: - 1. 비동기 프로그래밍 구현
DispatchQueue.global().async {
    for i in 1...5 {
        print(i)
    }
    DispatchQueue.main.async {
        print("UI 업데이트 완료")
    }
}

class NetworkManager {
    func load() -> Data? {
        print("data loaded")
        return nil
    }
}
DispatchQueue.global().async {
    NetworkManager().load()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print("UI 업데이트 완료")
    }
}

// MARK: - 2. 제네릭 구현
func swapValues<T>(a: inout T, b: inout T) {
    var temp = b
    b = a
    a = temp
}

var a = 10
var b = 20
swapValues(a: &a, b: &b)
print(a, b)


struct Stack<T> {
    var elements: [T]
    
    init() {
        self.elements = []
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
print(intStack.pop())
