import Foundation

var voter = [String : Bool]()

func checkVoter(_ name : String) {
    if voter[name] != nil {
        print("kick them out!")
    } else {
        voter[name] = true
        print("let them vote!")
    }
}

checkVoter("tom")
checkVoter("mike")
checkVoter("mike")


