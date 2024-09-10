# Item have 2 types: key or box
class Item:
    def __init__(self, is_key=False):
        self.is_key = is_key 

        # If not a key, it's a box that can hold items 
        self.items_in_box = [] 

    def is_a_box(self):
        return not self.is_key

    def is_a_key(self):
        return self.is_key


def look_for_key(box: Item):
    for item in box.items_in_box:
        if item.is_a_box():
            # recursive case
            look_for_key(item)
        elif item.is_a_key():
            # base case
            print("found the key!") 


"""
main_box
├── box_A
│   ├── box_B
│   └── box_C
└── box_D
    └── box_E
        └── key
"""
main_box = Item()

box_A = Item()
box_B = Item()
box_C = Item()
box_A.items_in_box = [box_B, box_C]

box_D = Item()
box_E = Item()
key = Item(is_key = True)
box_E.items_in_box = [key]
box_D.items_in_box = [box_E]

main_box.items_in_box = [box_A, box_D]

look_for_key(main_box)