import Foundation

protocol Stackable {
    associatedtype Element
    func peek() -> Element?
    mutating func push(_ element: Element)
    @discardableResult mutating func pop() -> Element?
}

extension Stackable {
    var isEmpty: Bool { peek() == nil }
}
struct Stack<Element>: Stackable where Element: Equatable {
    private var storage = [Element]()
    func peek() -> Element? { storage.last } // O(1)
    mutating func push(_ element: Element) { storage.append(element)  }  //O(1)
    mutating func pop() -> Element? { storage.popLast() }  //O(1)
}

extension Stack: Equatable {
    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool { lhs.storage == rhs.storage }
}

extension Stack: CustomStringConvertible {
    var description: String { "\(storage)" }
}

/* Example reverse the array
we have two solution
1- using array
 but you will use the reverse func O(n)
 the final result become n + n =  O(2n)
2- using stack
  will become only O(n)
*/
var stack = Stack<String>()
stack.push("a")
stack.push("h")
stack.push("m")
stack.push("e")
stack.push("d")

while !stack.isEmpty {
    print(stack.pop() ?? "")
}
