//
//  DataSource.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

class DataStore {
    static let shared = DataStore()
    
    let dinersNames = [
        "Chang-Fisher",
        "Sheppard-Tucker",
        "Faulkner-Howard",
        "Wagner",
        "Campos",
        "Handmade Graph",
        "Astonishing Studio",
        "Eclipse Rises",
        "Pane In The Glass",
        "Go Figure",
        "Mosaics",
        "Long Last Craft",
        "The Empty Plate",
        "The Agreeing Cart",
        "Poetic Craftiness Co",
        "Hipster",
        "The Trendy",
        "Jaguar Ventures",
        "The Dry Pagoda",
        "The Sleek Apple",
        "Chest Cheese",
        "The Fast Spoon",
        "Oceans Clean Up"
    ]
    
    let dishes = [
        "Oven-Baked Basil",
        "Lime Quail",
        "Broasted Saffron",
        "Shallot Turkey",
        "Poached Cucumber",
        "Lime Lollies",
        "Seared Chili Fish",
        "Cured Garlic",
        "Rosemary Spring Vegetables",
        "Baked Curry of Chestnuts",
        "Mandarin Ice",
        "Caramel",
        "Waffles",
        "Jelly",
        "Papaya Candy"
    ]
    
    private init() {}
}
