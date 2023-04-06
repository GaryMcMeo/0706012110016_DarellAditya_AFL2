//
//  enemy.swift
//  0706012110016_DarellAdityaSeanDarmayasa_AFL1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

protocol Enemy {
    func enemyAttack (player: user)
    func bossEncounter (chance: Int)
    func enemywins (player: user)
    func dropItem()-> Int?
}

class monster: Enemy{
    var enemyAttack: Int
    var enemyName: String
    var enemyHP: Int
    var enemyLoot: Int
    var enemyStatus: String
    
    init(enemyAttack: Int, enemyName: String, enemyHP: Int, enemyLoot: Int , enemyStatus: String) {
        self.enemyAttack = enemyAttack
        self.enemyName = enemyName
        self.enemyHP = enemyHP
        self.enemyLoot = enemyLoot
        self.enemyStatus = enemyStatus
    }
    
    func enemyAttack (player: user){
        User.HP -= enemyAttack
        print("\(enemyStatus) \(enemyName) attacks! You take \(enemyAttack) damage.")
        print("Your HP: \(User.HP)")
    }
    
    func bossEncounter(chance: Int){
        if chance > 75{
            enemyAttack = Int.random(in: 15...30)
            enemyHP = 50
            enemyStatus = "BOSS"
        }else{
            enemyAttack = Int.random(in: 5...20)
            enemyHP = 10
            enemyStatus = "Underling"
        }
    }
    
    func enemywins (player: user){
        print("You have been defeated!, You are not the chosen one.")
        exit(0)
    }
    
    func dropItem() -> Int? {
        let dropChance = Int.random(in: 1...100)
        if dropChance <= 25 {
            let quantity = Int.random(in: 1...3)
            return quantity
        } else if dropChance <= 50 {
            let quantity = Int.random(in: 1...3)
            return quantity
        } else {
            return nil
        }
    }

}


