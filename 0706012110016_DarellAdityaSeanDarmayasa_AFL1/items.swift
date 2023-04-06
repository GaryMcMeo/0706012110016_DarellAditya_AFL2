//
//  items.swift
//  0706012110016_DarellAdityaSeanDarmayasa_AFL1
//
//  Created by MacBook Pro on 01/04/23.
//

import Foundation

class Item {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Elixir: Item {
    var elixir: Int
    
    init(name: String, elixir: Int) {
        self.elixir = elixir
        super.init(name: name)
    }
    
    func addmana(player: user){
        User.Elixir -= 1
        User.MP += 10
        if User.MP > 50 {
            User.MP = 50
        }
        print("Your MP is now \(User.MP).")
    }
}

class Potion: Item {
    var potions: Int
    
    init(name: String, potions: Int) {
        self.potions = potions
        super.init(name: name)
    }
    
    func addhealth(player: user){
        User.Potions -= 1
        User.HP += 20
        if User.HP > 100 {
            User.HP = 100
        }
        print("Your HP is now \(User.HP).")
    }
}

