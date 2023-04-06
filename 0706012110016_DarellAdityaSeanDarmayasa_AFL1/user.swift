//
//  user.swift
//  0706012110016_DarellAdityaSeanDarmayasa_AFL1
//
//  Created by MacBook Pro on 01/04/23.
//

import Foundation

struct user {
    var name: String
    var HP: Int
    var MP: Int
    var Potions: Int
    var Elixir: Int
    
    init(name: String, HP: Int, MP: Int, Potions: Int, Elixir: Int) {
        self.name = name
        self.HP = HP
        self.MP = MP
        self.Potions = Potions
        self.Elixir = Elixir
    }
}

func playerStatScreen(player: user) {
    print("""
        Player Name : \(User.name)
    
        HP : \(User.HP)/100
        MP : \(User.MP)/50
    
        Magic :
        - Blade of Despair. Uses no MP. Deals 5pt of damage.
        - Divine Judgement. Uses 15pt of MP. Deals 50pt of damage.
        - Shield of Athena. Uses 10pt of MP. Blocks all enemy's attacks for 1 turn.
    
        Items :
        - Potion x\(User.Potions). Heals 20pt to your HP.
        - Elixir x\(User.Elixir). Adds 10pt to your MP.
    
        Press [Return] to go back :
    """)
}

func flee() {
    print("""
        You feel like if you don't escape soon, you won't be able to continue your fight.
        You look around frantically, searching for a way out. You sprint towards an exit, your heart pounding in your chest.
    
        You're safe now, for now.
    
        Press [Return] to continue :
    """)
}




