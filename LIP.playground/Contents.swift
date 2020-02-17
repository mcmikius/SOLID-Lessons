import UIKit

class Bird {
    func fly() {
        print("I can fly")
    }
    func swim() {
        print("I can swim")
    }
    
}

class Duck: Bird {
    override func fly() {
        print("I can fly a lot")
    }
    override func swim() {
        print("I can swim a lot")
    }
}

let someBird = Bird()
someBird.fly()
someBird.swim()

let duckOne = Duck()
duckOne.swim()
duckOne.fly()

class Penguin: Bird {
    override func swim() {
        print("swim is a life")
    }
    
    override func fly() {
        fatalError()
    }
}

let penguinOne = Penguin()
penguinOne.swim()
penguinOne.fly()
