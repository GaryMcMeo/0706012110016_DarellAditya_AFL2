//
//  main.swift
//  0706012110016_DarellAdityaSeanDarmayasa_AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var PlayerInput = String()
var PlayerName = String()
var HP : Int = 100
var MP : Int = 50
var Potion : Int = 10
var Elixir : Int = 5

let OpeningScreen  = """
Welcome to a world of magic 🧙🏿‍♂️

You have been chosen to embark on an epic journey as a young wizard  on the path to becoming a master of the arcane arts. Your adventure will take you through forests 🌲, Mountains 🗻, and dungeon 🏰, where you will face challenges, make allies, and fight enemies

Press [Return] to continue:
"""

let JourneyScreen = """
From here, you can...

[C]heck your health and stats
[H]eal your wounds with potion

Or.. you can choose where you want to go

[F]orest or trolls
[M]ountain of golem
[Q]uit the game
"""

let PlayerStatScreen = """
Player Name : \(PlayerName)

HP : \(HP)/100
MP : \(MP)/50

Magic :
- Blade of Despair. Uses no MP. Deal 5pt of damage.
- Divine Judgement. Uses 15pt of MP. Deal 50pt of damage
- Shield of Athena. Uses 10ot of MP. Block all enemy's attack for 1 turn.

Items :
- Potion x\(Potion). Heals 20pt to your HP
- Elixir x\(Elixir). Adds 10pt to your MP

Press [Return] to go back :
"""

for _ in 1... {
    print(OpeningScreen)
    let PlayerInput = readLine()
    if PlayerInput == ""{
        break // exit the loop if user inputs a blank line
    }
}

print("May I know your name, young wizard?")
PlayerName = readLine()!
print("")
print("Nice to meet you \(PlayerName)!")




