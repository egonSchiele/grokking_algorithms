val voted:HashMap<String,Boolean> = HashMap<String, Boolean>() 

fun checkVoter(name: String) {
 
    if(!voted.containsKey(name)){
        voted.put(name, true)
        println("let them vote!")
    } else {
        println("kick them out!")
    }
    
}

fun main(args: Array<String>) {
    
    checkVoter("tom")
    checkVoter("mike")
    checkVoter("mike")
}