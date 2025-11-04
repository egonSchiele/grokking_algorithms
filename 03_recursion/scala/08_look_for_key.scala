// Item can have 2 types: key or box
sealed trait Item
case class Key() extends Item
case class Box(itemsInBox: List[Item]) extends Item

def lookForKey(box: Box): Unit = {
  for(item <- box.itemsInBox) {
    item match {
      case Box(items) => lookForKey(Box(items)) // recursive case
      case Key() => println("found the key!") // base case
    }
  }
}

/*
main_box
├── box_A
│   ├── box_B
│   └── box_C
└── box_D
    └── box_E
        └── key
*/
val mainBox = Box(List(
  Box(List(Box(List()), Box(List()))), // box_A with box_B and box_C
  Box(List(Box(List(Key())))) // box_D with box_E containing key
))

lookForKey(mainBox)

