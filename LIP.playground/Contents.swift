import UIKit

protocol Birds {
    func fly()
    func swim()
}

protocol Flyable {
    func fly()
}

protocol Swimable {
    func swim()
}

class Duck: Flyable, Swimable {
    func fly() {
        print("I can fly a lot")
    }
    func swim() {
        print("I can swim a lot")
    }
}

let duckOne = Duck()
duckOne.swim()
duckOne.fly()

class Penguin: Swimable {
    
    func swim() {
        print("swim is my life")
    }
}

let penguinOne = Penguin()
penguinOne.swim()
