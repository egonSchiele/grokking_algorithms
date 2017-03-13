import Foundation

func greet2(name: String) {
    print("how are you, \(name) ?")
}

func bye() {
    print("ok bye!")
}

func greet(name: String ) {
    print("hello, \(name)!")
    greet2(name: name)
    print("getting ready to say bye...")
    bye()
}

greet(name: "adit")
