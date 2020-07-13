//
//  Faction.swift
//  KataRPG
//
//  Created by Vithursan Sivakumaran on 13/07/2020.
//  Copyright © 2020 Vithursan Sivakumaran. All rights reserved.
//

import Foundation

class Faction {
    var name : String
    var listOfCharacter : [Character] = []
    var listOfFactionAsFriend : [Faction] = []
    
    init(name : String) {
        self.name = name
    }
    
    func addCharacter(character : Character) -> Void {
        if (!listOfCharacter.contains(where: { $0.name == character.name })) {
            listOfCharacter.append(character)
            character.listOfFaction.append(self)
        }
    }
    
    func removeCharacter(character : Character) -> Void {
        if let indexCharacter = listOfCharacter.firstIndex(where: { $0.name == character.name }) {
            listOfCharacter.remove(at: indexCharacter)
        }
        if let indexFaction = character.listOfFaction.firstIndex(where: { $0.name == self.name }) {
            character.listOfFaction.remove(at: indexFaction)
        }
    }
    
    func addFactionAsFriend(faction : Faction) {
        if (!listOfFactionAsFriend.contains(where: { $0.name == faction.name })) {
            listOfFactionAsFriend.append(faction)
        }
    }
}
