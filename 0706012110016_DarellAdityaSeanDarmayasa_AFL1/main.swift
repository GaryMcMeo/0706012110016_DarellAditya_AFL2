//
//  main.swift
//  0706012110016_DarellAdityaSeanDarmayasa_AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var PlayerInput = String()
var PlayerName = String()
var HP = 100
var MP = 50

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

for _ in 1... {
    print(OpeningScreen)
    let PlayerInput = readLine()
    if PlayerInput == ""{
        break // exit the loop if user inputs a blank line
    }
}






