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
var MaxHP: Int = 100
var MP : Int = 100
var MaxMP : Int = 50
var items = [20,20]
var isRunning = true
var playerTurn = true

let OpeningScreen  = """
Welcome to a world of magic 🧙🏿‍♂️

You have been chosen to embark on an epic journey as a young wizard  on the path to becoming a master of the arcane arts. Your adventure will take you through forests 🌲, Mountains 🗻, and dungeon 🏰, where you will face challenges, make allies, and fight enemies

Press [Return] to continue:
"""

let JourneyScreen = """
From here, you can...

[C]heck your health and stats
[H]eal your wounds with potion
[R]egen your mana with elixir

Or.. you can choose where you want to go

[F]orest or trolls
[M]ountain of golem
[Q]uit the game

Whats your choice?
"""

func PlayerStatScreen(){
    print("""
Player Name : \(PlayerName)

HP : \(HP)/100
MP : \(MP)/50

Magic :
- Blade of Despair. Uses no MP. Deal 5pt of damage.
- Divine Judgement. Uses 15pt of MP. Deal 50pt of damage
- Shield of Athena. Uses 10ot of MP. Block all enemy's attack for 1 turn.

Items :
- Potion x\(items[0]). Heals 20pt to your HP
- Elixir x\(items[1]). Adds 10pt to your MP

Press [Return] to go back :
""")
}



//mountain
func mountain(){
    print("""
As you make your way through the rugged mountain terrain, you can feel the chill of the wind bitting at your skin. suddenly, you hear a sound that makes you freeze in your tracks.That's when you see it - a massive, snarling
Golem emerging from the shadows.

 😈 Golem name : Bhordac The Golem
 😈 Health : You might have to scan him for further details.
 
 Choose your action :
 [1] Blade of Despair. Uses no MP. Deal 5pt of damage.
 [2] Divine Judgement. Uses 15pt of MP. Deal 50pt of damage
 [3] Shield of Athena. Uses 10ot of MP. Block all enemy's attack for 1 turn.
 
 [4] Use potion to heal wound
 [5] Scan enemy's vital
 [6] Flee from battle
 
 Whats your choice
""")
}

func getName() -> String {
    // Keep asking for input until a valid alphabetic string is entered
    while true {
        if let input = readLine(), input.count > 0 {
            // Check if input contains only alphabetic characters
            let isValidInput = input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
            if isValidInput {
                return input
            }
        }
        print("Invalid input. Please enter only alphabetic characters.")
        print("May I know your name, young wizard?")
    }
}

for _ in 1... {
    print(OpeningScreen)
    let PlayerInput = readLine()
    if PlayerInput == ""{
        break // exit the loop if user inputs a blank line
    }
}

print("May I know your name, young wizard?")
PlayerName = getName()
print("")
print("Nice to meet you \(PlayerName)!")


while isRunning {
    print(JourneyScreen)
    let input = readLine() ?? ""
    switch input.uppercased() {
    case "C":
        for _ in 1... {
            PlayerStatScreen()
            let InputJourney = readLine()
            if InputJourney == "" {
                break // exit the loop if user inputs a blank line
            }
        }
    case "H":
        if HP == MaxHP {
            print("You don't need to use any potion right now. Your HP is already full.")
        } else {
            var inputHeal = false
            repeat {
                let HealWoundScreen = """
                        Player Name : \(PlayerName)
                        
                        Your current HP is \(HP).
                        You have (Potion) Potions.
                        
                        Are you sure you want to use 1 potion to heal wound? [Y/N]
                        """
                print(HealWoundScreen)
                if let choice = readLine()?.uppercased() {
                    if choice == "Y" && items[0] > 0 {
                        HP += 20
                        if HP > MaxHP {
                            HP = MaxHP
                        }
                        items[0] -= 1
                        print("Your HP is now \(HP).")
                        inputHeal = true
                    } else if choice == "N" {
                        print("You chose not to use any potion.")
                        inputHeal = true
                    } else {
                        print("Invalid input.")
                    }
                }
            } while !inputHeal
        }
        
    case "R":
        if MP == MaxMP {
            print("You don't need to use any Elixir right now. Your MP is already full.")
        } else {
            var inputRegen = false
            repeat {
                let HealWoundScreen = """
                        Player Name : \(PlayerName)
                        
                        Your current MP is \(MP).
                        You have \(items[1]) Elixirs.
                        
                        Are you sure you want to use 1 elixir to regenerate your mana? [Y/N]
                        """
                print(HealWoundScreen)
                if let choice = readLine()?.uppercased() {
                    if choice == "Y" && items[1] > 0 {
                        MP += 10
                        if MP > MaxMP {
                            MP = MaxMP
                        }
                        items[1] -= 1
                        print("Your MP is now \(MP).")
                        inputRegen = true
                    } else if choice == "N" {
                        print("You chose not to use any elixir.")
                        inputRegen = true
                    } else {
                        print("Invalid input.")
                    }
                }
            } while !inputRegen
        }
    case "F":
        playerTurn = true
        var trollHealth = 150
        print("Heading to the forest...")
        print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you, you quickly spin around, and find a Troll emerging from the shadows.")
        
        while playerTurn==true {
            if playerTurn {
                print("""
                     
                      😈 Troll name: Gunnar The Troll
                      😈 Health: You might have to scan him for further details.
                     
                         Choose your action :
                      [1] Blade of Despair. Uses no MP. Deal 5pt of damage.
                      [2] Divine Judgement. Uses 15pt of MP. Deal 50pt of damage
                      [3] Shield of Athena. Uses 10ot of MP. Block all enemy's attack for 1 turn.
                      
                      [4] Use potion to heal wound
                      [5] Use elixir to regenerate mana
                      [6] Scan enemy's vital
                      [7] Flee from battle
                      
                      Whats your choice?
                     """)
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        trollHealth -= 5
                        print("You attacked Gunnar the Troll with Blade of Despair for 5 damage.")
                        let trollDamage = Int.random(in: 10...20)
                        HP -= trollDamage
                        print("Gunnar The Troll attacks! You take \(trollDamage) damage.")
                        print("Your HP: \(HP)")
                        
                    case "2":
                        if MP >= 15 {
                            trollHealth -= 50
                            MP -= 15
                            print("You used Divine Judgement on Gunnar the Troll for 50 damage.")
                            let trollDamage = Int.random(in: 10...20)
                            HP -= trollDamage
                            print("Gunnar The Troll attacks! You take \(trollDamage) damage.")
                            print("Your HP: \(HP)")
                        } else {
                            print("You don't have enough MP to use Divine Judgement.")
                            continue
                        }
                        
                    case "3":
                        if MP >= 10 {
                            MP -= 10
                            print("You use Shield of Athena, you are now defending against incoming attack.")
                            print("Gunnar The Troll attacks, but it was blocked by your Shield of Athena!")
                        } else {
                            print("You don't have enough MP to use Shield of Athena.")
                            continue
                        }
                        
                    case "4":
                        if items[0] > 0 {
                            HP += 20
                            if HP > MaxHP {
                                HP = MaxHP
                            }
                            items[0] -= 1
                            print("You used 1 potion to heal your wound. Your HP is now \(HP)/\(MaxHP).")
                        } else {
                            print("You don't have any potion left.")
                            continue
                        }
                    case "5":
                        if items[1] > 0 {
                            MP += 10
                            if MP > MaxMP {
                                MP = MaxMP
                            }
                            items[1] -= 1
                            print("You used 1 elixir to regenerate your mana. Your MP is now \(MP)/\(MaxMP).")
                        } else {
                            print("You don't have any potion left.")
                            continue
                        }
                    case "6":
                        print("Gunnar the Troll\nHP: \(trollHealth)")
                        continue
                        
                    case "7":
                        print("""
                                You feel like if you don't escape soon, you won't be able to continue your fight.
                                You look around frantically, searching for a way out. You sprint towards an exit, your heart pounding in your chest
                                        
                                You're safe now, for now
                                Press [return] to continue
                              """)
                        if let choice = readLine(), choice.isEmpty {
                            print("You fled from battle!")
                            playerTurn = false
                            break
                        } else {
                            print("Invalid choice!")
                        }
                        
                    default:
                        print("Invalid choice")
                    }
                    
                    if trollHealth <= 0 {
                        print("You have defeated Gunnar the Troll")
                        print("Leaving the forest...")
                        break
                    } else if HP <= 0 {
                        print("Game over!, Gunnar cuts you in half")
                        exit(0)
                    }
                    
                    // Back to the journey screen...
                    print(" ")
                }
                
            }
        }
        
    case "M":
        playerTurn = true
        var golemHealth = 1000
        print("Heading to the mountain...")
        print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind bitting at your skin. suddenly, you hear a sound that makes you freeze in your tracks.That's when you see it - a massive, snarling Golem emerging from the shadows.")
        
        while playerTurn==true {
            if playerTurn {
                print("""
                     
                      😈 Golem name : Bhordac The Golem
                      😈 Health : You might have to scan him for further details.
                     
                         Choose your action :
                      [1] Blade of Despair. Uses no MP. Deal 5pt of damage.
                      [2] Divine Judgement. Uses 15pt of MP. Deal 50pt of damage
                      [3] Shield of Athena. Uses 10ot of MP. Block all enemy's attack for 1 turn.
                      
                      [4] Use potion to heal wound
                      [5] Use elixir to regenerate mana
                      [6] Scan enemy's vital
                      [7] Flee from battle
                      
                      Whats your choice?
                     """)
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        golemHealth -= 5
                        print("You attacked Bhordac the Golem with Blade of Despair for 5 damage.")
                        let golemDamage = Int.random(in: 0...8)
                        HP -= golemDamage
                        print("Bhordac The Golem attacks! You take \(golemDamage) damage.")
                        print("Your HP: \(HP)")
                        
                    case "2":
                        if MP >= 15 {
                            golemHealth -= 50
                            MP -= 15
                            print("You used Divine Judgement on Bhordac the Golem for 50 damage.")
                            let golemDamage = Int.random(in: 0...8)
                            HP -= golemDamage
                            print("Bhordac The Troll attacks! You take \(golemDamage) damage.")
                            print("Your HP: \(HP)")
                        } else {
                            print("You don't have enough MP to use Divine Judgement.")
                            continue
                        }
                        
                    case "3":
                        if MP >= 10 {
                            MP -= 10
                            print("You use Shield of Athena, you are now defending against incoming attack.")
                            print("Bhordac The Golem attacks, but it was blocked by your Shield of Athena!")
                        } else {
                            print("You don't have enough MP to use Shield of Athena.")
                            continue
                        }
                        
                    case "4":
                        if items[0] > 0 {
                            HP += 20
                            if HP > MaxHP {
                                HP = MaxHP
                            }
                            items[0] -= 1
                            print("You used 1 potion to heal your wound. Your HP is now \(HP)/\(MaxHP).")
                        } else {
                            print("You don't have any potion left.")
                            continue
                        }
                    case "5":
                        if items[1] > 0 {
                            MP += 10
                            if MP > MaxMP {
                                MP = MaxMP
                            }
                            items[1] -= 1
                            print("You used 1 elixir to regenerate your mana. Your MP is now \(MP)/\(MaxMP).")
                        } else {
                            print("You don't have any potion left.")
                            continue
                        }
                    case "6":
                        print("Bhordac the Golem\nHP: \(golemHealth)")
                        continue
                        
                    case "7":
                        print("""
                                You feel like if you don't escape soon, you won't be able to continue your fight.
                                You look around frantically, searching for a way out. You sprint towards an exit, your heart pounding in your chest
                                        
                                You're safe now, for now
                                Press [return] to continue
                              """)
                        if let choice = readLine(), choice.isEmpty {
                            print("You fled from battle!")
                            playerTurn = false
                            break
                        } else {
                            print("Invalid choice!")
                        }
                        
                    default:
                        print("Invalid choice!")
                    }
                    
                    if golemHealth <= 0 {
                        print("You have defeated Bhordac the Golem")
                        print("Leaving the Mountain...")
                        break
                    } else if HP <= 0 {
                        print("Game over!, Bhordac crushes your skull")
                        exit(0)
                    }
                    
                    // Back to the journey screen...
                    print(" ")
                }
                
            }
        }
        
    case "Q":
        print("Thankyou for playing, Quitting the game...")
        isRunning = false
    default:
        print("Invalid input, please try again.")
    }
}


