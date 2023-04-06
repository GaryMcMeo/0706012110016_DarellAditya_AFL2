//
//  main.swift
//  0706012110016_DarellAdityaSeanDarmayasa_AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var User = user(name: "", HP: 50, MP: 25, Potions: 5, Elixir: 5)
var bod = BladeOfDespair(name: "Blade Of Despair", cost: 0, damage: 5)
var dj = DivineJudgement(name: "Divine Judgement", cost: 15, damage: 50)
var block = ShieldOfAthena(name: "Shield Of Athena", cost: 10)
var potions = Potion(name: "Potions", potions: 0)
var elixir = Elixir(name: "Elixir", elixir: 0)
var enemy = monster(enemyAttack: 0, enemyName: "", enemyHP: 0, enemyLoot: 0, enemyStatus: "")
var PlayerInput = String()
var isRunning = true
var playerTurn = true

func OpeningScreen(){
    print("""
    Welcome to a world of magic 🧙🏿‍♂️

    You have been chosen to embark on an epic journey as a young wizard  on the path to becoming a master of the arcane arts. Your adventure will take you through forests 🌲, Mountains 🗻, and dungeon 🏰, where you will face challenges, make allies, and fight enemies

    Press [Return] to continue:
""")
}

func JourneyScreen(){
   print("""
    From here, you can...

    [C]heck your health and stats
    [H]eal your wounds with potion
    [R]egen your mana with elixir

    Or.. you can choose where you want to go

    [F]orest or trolls
    [M]ountain of golem
    [Q]uit the game

    Whats your choice?
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

//Loops opening screen untils user inputs return
for _ in 1... {
    OpeningScreen()
    let PlayerInput = readLine()
    if PlayerInput == ""{
        break // Exit the loop if user inputs a blank line
    }
}

print("May I know your name, young wizard?")
User.name = getName()
print("")
print("Nice to meet you \(User.name)!")

//Loops the game until user exits the game
while isRunning {
    JourneyScreen()
    let input = readLine() ?? ""
    switch input.uppercased() {
    case "C":
        for _ in 1... {
            playerStatScreen(player: User)
            let InputJourney = readLine()
            if InputJourney == "" {
                break // exit the loop if user inputs a blank line
            }
        }
        
    case "H":
        if User.HP == 100 {
            print("You don't need to use any potion right now. Your HP is already full.")
        } else {
            var inputHeal = false
            repeat {
                let HealWoundScreen = """
                        Player Name : \(User.name)
                        
                        Your current HP is \(User.HP).
                        You have \(User.Potions) Potions.
                        
                        Are you sure you want to use 1 potion to heal wound? [Y/N]
                        """
                print(HealWoundScreen)
                if let choice = readLine()?.uppercased() {
                    if choice == "Y" && User.Potions > 0 {
                        potions.addhealth(player: User)
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
        if User.MP == 50 {
            print("You don't need to use any Elixir right now. Your MP is already full.")
        } else {
            var inputRegen = false
            repeat {
                let HealWoundScreen = """
                        Player Name : \(User.name)
                        
                        Your current MP is \(User.MP).
                        You have \(User.Elixir) Elixirs.
                        
                        Are you sure you want to use 1 elixir to regenerate your mana? [Y/N]
                        """
                print(HealWoundScreen)
                if let choice = readLine()?.uppercased() {
                    if choice == "Y" && User.Elixir > 0 {
                        elixir.addmana(player: User)
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
        var chance = Int.random(in: 1...100)
        playerTurn = true
        enemy.enemyName = "Troll"
        enemy.bossEncounter(chance: chance)
        var scanned = false
        var showhp = "You might have to scan him for further details."
        print("Heading to the forest...")
        print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you, you quickly spin around, and find a Troll emerging from the shadows.")

        //Loops the forest battle screen while playerturn is still true and player hasnt defeated opponent
        while playerTurn==true {
            if playerTurn {
                if scanned == true {
                   showhp = String(enemy.enemyHP)
                }else{
                   showhp = "You might have to scan him for further details."
                }
                print("""
                      😈 Enemy: \(enemy.enemyStatus) \(enemy.enemyName)
                      😈 Health: \(showhp)

                         Choose your action :
                      [1] Blade of Despair. Uses no MP. Deal 5pt of damage.
                      [2] Divine Judgement. Uses 15pt of MP. Deal 50pt of damage
                      [3] Shield of Athena. Uses 10of of MP. Block all enemy's attack for 1 turn.

                      [4] Use potion to heal wound
                      [5] Use elixir to regenerate mana
                      [6] Scan enemy's vital
                      [7] Flee from battle

                      Whats your choice?
                     """)

                if let choice = readLine() {
                    switch choice {
                    case "1":
                        bod.AttackMelee(player: User, Monster: enemy)
                        enemy.enemyAttack(player: User)

                    case "2":
                        if User.MP >= 15 {
                            dj.AttackSkill(player: User, Monster: enemy)
                            enemy.enemyAttack(player: User)
                        } else {
                            print("You don't have enough MP to use Divine Judgement.")
                            continue
                        }

                    case "3":
                        if User.MP >= 10 {
                            block.Shield(player: User, Monster: enemy)
                        } else {
                            print("You don't have enough MP to use Shield of Athena.")
                            continue
                        }

                    case "4":
                        if User.HP == 100 {
                            print("You don't need to use any potion right now. Your HP is already full.")
                        }else if User.Potions > 0 {
                            potions.addhealth(player: User)
                            print("You used 1 potion to heal your wound. Your HP is now \(User.HP)/100.")
                        } else {
                            print("You don't have any potion left.")
                            continue
                        }

                    case "5":
                        if User.MP == 50 {
                            print("You don't need to use any Elixir right now. Your MP is already full.")
                        }else if User.Elixir > 0 {
                            elixir.addmana(player: User)
                            print("You used 1 elixir to regenerate your mana. Your MP is now \(User.MP)/100.")
                        } else {
                            print("You don't have any potion left.")
                            continue
                        }

                    case "6":
                        print("You Scanned Him For More Information")
                        scanned = true
                        continue

                    case "7":
                        flee()
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

                    if enemy.enemyHP <= 0 {
                        print("You have defeated \(enemy.enemyStatus) \(enemy.enemyName)")
                        if let drop = enemy.dropItem() {
                            if drop < 10 {
                                User.Potions += drop
                                print("It dropped \(drop) potions")
                            } else {
                                User.Elixir += drop
                                print("It dropped \(drop) elixirs")
                            }
                        } else {
                            print("No items dropped")
                        }
                        print("Leaving the forest...")
                        break
                    } else if User.HP <= 0 {
                        enemy.enemywins(player: User)
                    }

                    // Back to the journey screen...
                    print(" ")
                }

            }
        }

    case "M":
        var chance = Int.random(in: 1...100)
        playerTurn = true
        enemy.enemyName = "Golem"
        enemy.bossEncounter(chance: chance)
        var scanned = false
        var showhp = "You might have to scan him for further details."
        print("Heading to the mountain...")
        print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind bitting at your skin. suddenly, you hear a sound that makes you freeze in your tracks.That's when you see it - a massive, snarling Golem emerging from the shadows.")

        //loops the forest battle screen while playerturn is still true and player hasnt defeated opponent
        while playerTurn==true {
            if playerTurn {
                if scanned == true {
                   showhp = String(enemy.enemyHP)
                }else{
                   showhp = "You might have to scan him for further details."
                }
                print("""
                      😈 Enemy: \(enemy.enemyStatus) \(enemy.enemyName)
                      😈 Health: \(showhp)

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
                        bod.AttackMelee(player: User, Monster: enemy)
                        enemy.enemyAttack(player: User)

                    case "2":
                        if User.MP >= 15 {
                            dj.AttackSkill(player: User, Monster: enemy)
                            enemy.enemyAttack(player: User)
                        } else {
                            print("You don't have enough MP to use Divine Judgement.")
                            continue
                        }

                    case "3":
                        if User.MP >= 10 {
                            block.Shield(player: User, Monster: enemy)
                        } else {
                            print("You don't have enough MP to use Shield of Athena.")
                            continue
                        }

                    case "4":
                        if User.HP == 100 {
                            print("You don't need to use any potion right now. Your HP is already full.")
                        }else if User.Potions > 0 {
                            potions.addhealth(player: User)
                            print("You used 1 potion to heal your wound. Your HP is now \(User.HP)/100.")
                        } else {
                            print("You don't have any potion left.")
                            continue
                        }

                    case "5":
                        if User.MP == 50 {
                            print("You don't need to use any Elixir right now. Your MP is already full.")
                        }else if User.Elixir > 0 {
                            elixir.addmana(player: User)
                            print("You used 1 elixir to regenerate your mana. Your MP is now \(User.MP)/100.")
                        } else {
                            print("You don't have any potion left.")
                            continue
                        }

                    case "6":
                        print("You Scanned Him For More Information")
                        scanned = true
                        continue

                    case "7":
                        flee()
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

                    if enemy.enemyHP <= 0 {
                        print("You have defeated \(enemy.enemyStatus) \(enemy.enemyName)")
                        if let drop = enemy.dropItem() {
                            if drop < 10 {
                                User.Potions += drop
                                print("It dropped \(drop) potions")
                            } else {
                                User.Elixir += drop
                                print("It dropped \(drop) elixirs")
                            }
                        } else {
                            print("No items dropped")
                        }
                        print("Leaving the mountains...")
                        break
                    } else if User.HP <= 0 {
                        enemy.enemywins(player: User)
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


