//
//  skill.swift
//  0706012110016_DarellAdityaSeanDarmayasa_AFL1
//
//  Created by MacBook Pro on 01/04/23.
//

import Foundation

class Skill {
    var SkillName: String
    var SkillCost: Int
    
    init(SkillName: String, SkillCost: Int) {
        self.SkillName = SkillName
        self.SkillCost = SkillCost
    }
    
}

class BladeOfDespair: Skill {
    var damage: Int
    
    init(name: String, cost: Int, damage: Int) {
        self.damage = damage
        super.init(SkillName: name, SkillCost: cost)
    }
    
    func AttackMelee(player: user, Monster: monster){
        print("You attacked \(Monster.enemyStatus) \(Monster.enemyName) for \(damage) damage")
        Monster.enemyHP -= damage
    }
}

class DivineJudgement: Skill {
    var damage: Int
    
    init(name: String, cost: Int, damage: Int) {
        self.damage = damage
        super.init(SkillName: name, SkillCost: cost)
    }
    
    func AttackSkill(player: user, Monster: monster){
        print("You attacked \(Monster.enemyStatus) \(Monster.enemyName) for \(damage) damage")
        User.MP -= 15
        Monster.enemyHP -= damage
    }
    
}

class ShieldOfAthena: Skill {
    
    init(name: String, cost: Int) {
        super.init(SkillName: name, SkillCost: cost)
    }
    
    func Shield(player: user, Monster: monster){
        User.MP -= 10
        print("You use Shield of Athena, you are now defending against incoming attack.")
        print("\(enemy.enemyStatus) \(enemy.enemyName) attacks, but it was blocked by your Shield of Athena!")
    }
}
