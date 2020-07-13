//
//  Priest.swift
//  KataRPG
//
//  Created by Vithursan Sivakumaran on 13/07/2020.
//  Copyright © 2020 Vithursan Sivakumaran. All rights reserved.
//

import Foundation

class Priest : Character {
    override func heal(character: Character) -> Void {
        let bonusHealth = Int.random(in: 5..<10)
        if (self.hasFaction()) {
            if (character.health < 100 && checkSameFaction(character: character)) {
                character.health += bonusHealth
                print("Priest heal allie")
            }
        } else {
            character.health += bonusHealth
            print("Priest heal")
        }
        if (character.health > 100) {
            character.health = 100
        }
    }
}
