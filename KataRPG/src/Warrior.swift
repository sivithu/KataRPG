//
//  Warrior.swift
//  KataRPG
//
//  Created by Vithursan Sivakumaran on 13/07/2020.
//  Copyright © 2020 Vithursan Sivakumaran. All rights reserved.
//

import Foundation

class Warrior : Character {
    override func attack(character: Character) -> Void {
        let damage = Int.random(in: 0..<9)
        if (self.hasFaction()) {
            if (!self.checkSameFaction(character: character)) {
                character.health -= damage
                print("I attack you, You don't belong to my faction : \(character.name)")
            }
        } else {
            character.health -= damage
            print("I attack you : \(character.name)")
        }
        
    }
    
    override func heal(character: Character) -> Void {
        
    }
    
    func healHimSelf() -> Void {
        if (self.health < 100) {
            self.health += 1
            print("I heal myself")
        }
    }
}
