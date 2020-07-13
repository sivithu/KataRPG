//
//  Character.swift
//  KataRPG
//
//  Created by Vithursan Sivakumaran on 13/07/2020.
//  Copyright © 2020 Vithursan Sivakumaran. All rights reserved.
//

import Foundation

class Character {
    var name : String
    var health : Int = 100
    var alive : Bool =  true
    var listOfFaction : [Faction] = []
    var currentAssembly : Assembly?
    var masterOfAssembly : Bool = false
    
    init() {
        self.name = ""
    }
    
    init(name : String) {
        self.name = name
    }
    
    func attack(character : Character) -> Void {
        if (self.hasFaction()) {
            if (self.name != character.name && character.alive == true && !checkSameFaction(character: character)) {
                character.health -= 1
                print("I attacked an enemy who don't belong to my faction : \(character.name)")
            }
            if (character.health <= 0) {
                character.alive = false
                print("He is dead, He's didn't belong to my faction : \(character.name)")
            }
        } else {
            if (self.name != character.name && character.alive == true) {
                character.health -= 1
                print("I attacked an enemy : \(character.name)")
            }
            if (character.health <= 0) {
                character.alive = false
                print("He is dead : \(character.name)")
            }
        }
        
    }
    
    func heal(character : Character) -> Void {
        if (hasFaction()) {
            if (character.health < 100 && checkSameFaction(character: character)) {
                character.health += 1
                print("I heal you my friend: \(character.name)")
            }
        } else {
            if (character.health < 100) {
                character.health += 1
                print("I heal you : \(character.name)")
            }
        }
    }
    
    func checkSameFaction(character : Character) -> Bool {
        var sameFaction : Bool = false
        var listOfMyFactions : [Faction] = []
        var listOfCharacterFactions : [Faction] = []
        
        self.listOfFaction.forEach { (faction) in
            listOfMyFactions.append(faction)
            faction.listOfFactionAsFriend.forEach { (friendFaction) in
                listOfMyFactions.append(friendFaction)
            }
        }
        
        character.listOfFaction.forEach { (otherFaction) in
            listOfCharacterFactions.append(otherFaction)
            otherFaction.listOfFactionAsFriend.forEach { (otherFriendFaction) in
                listOfCharacterFactions.append(otherFriendFaction)
            }
        }
        
        listOfMyFactions.forEach { (faction) in
            listOfCharacterFactions.forEach { (otherFaction) in
                if(faction.name == otherFaction.name) {
                    sameFaction = true
                }
            }
        }
        
        return sameFaction
    }
    
    func hasFaction() -> Bool {
        if (self.listOfFaction.count > 0) {
            return true
        }
        return false
    }
    
    func changeNameOfAssembly(newName : String) -> Void {
        if (masterOfAssembly) {
            currentAssembly?.name = newName
        }
    }
    
    func showDetail() -> Void {
        print("My name is \(self.name), health : \(health)")
        if(self.listOfFaction.count > 0) {
            print("My factions : ")
            self.listOfFaction.forEach { (faction) in
                print(faction.name)
            }
        }
        if (currentAssembly != nil) {
            print("My Assembly is : \(currentAssembly!.name)")
        }
    }
}
