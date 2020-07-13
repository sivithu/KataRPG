//
//  KataRPG.swift
//  KataRPG
//
//  Created by Vithursan Sivakumaran on 13/07/2020.
//  Copyright © 2020 Vithursan Sivakumaran. All rights reserved.
//

import Foundation












func main() -> Void {
    /*
    let w = Warrior(name: "Warrior ZER")
    let w2 = Warrior(name: "Warriror ZER2")
    let c = Character(name: "Pute")
    let c2 = Character(name: "Pute2")
    let p = Priest(name: "Priest")
    
    //Character Attaque tout le monde sauf soi meme
    c.attack(character: c2) // passe : J'ai attacker un fdp d'ennemi : Pute2
    c.attack(character: w) // passe : J'ai attacker un fdp d'ennemi : Warrior ZER
    c.attack(character: c) // passe pas
    
    //Character Heal seulement si pv inférieur à 100
    c.heal(character : c) // passe pas
    c.heal(character : c2) // passe : Tiens poto je te heal : Pute2
    c.heal(character : w) // passe : Tiens poto je te heal : Warrior ZER
    
    //Warrior peu attaquer n'importe qui
    w.attack(character: w) // passe : Tiens jtencule warrior : Warrior ZER
    w.attack(character: c) // passe : Tiens jtencule warrior : Pute
    
    //Warrior se heal soi meme
    w.healHimSelf() // passe : jme heal warrior
    
    //Priest heal
    p.heal(character: c) // passe : Priest heal
 
    // Créer une faction
    let f = Faction(name: "DGGN")
    
    //Character est dans une faction
    f.addCharacter(character: c)
    
    //Test attack et heal faction
    c.attack(character: p) // passe : J'ai attacker un fdp d'ennemi, il est pas de ma faction : Priest
    c.heal(character: p) // passe pas
    
    f.addCharacter(character: p)
    c.heal(character: p) // passe : Tiens poto je te heal faction: Priest
    p.heal(character: w) // passe pas
    
    f.addCharacter(character: w2)
    w2.attack(character: c) // passe pas
    w2.attack(character: w2) // passe pas
    w2.attack(character: c2) // passe : Tiens jtencule warrior, t pas de la meme section que moi : Pute2
    
    f.removeCharacter(character: w2)
    w2.attack(character: w2) // passe : Tiens jtencule warrior : Warriror ZER2

    */
    var fFriend1 = Faction(name: "FactionFriend1")
    var fFriend2 = Faction(name: "FactionFriend2")
    var fFriend3 = Faction(name: "FactionFriend3")
    var cFriend = Character(name: "CharacterFriend")
    var wFriend = Warrior(name: "WarriorFriend")
    var w2Friend = Warrior(name: "WarriorFriend2")
    var pFriend = Priest(name: "PriestFriend")
    var p2Friend = Priest(name: "PriestFriend2")
    
    fFriend1.addCharacter(character: cFriend)
    fFriend1.addCharacter(character: wFriend)
    
    cFriend.attack(character: wFriend) // passe pas
    cFriend.attack(character: pFriend) // passe : J'ai attacker un fdp d'ennemi, il est pas de ma faction : PriestFriend
    cFriend.heal(character: pFriend) // passe pas
  
    fFriend2.addCharacter(character: pFriend)
    
    cFriend.attack(character: wFriend) // passe pas
    cFriend.attack(character: pFriend) // passe : J'ai attacker un fdp d'ennemi, il est pas de ma faction : PriestFriend
    cFriend.heal(character: pFriend) // passe pas

    fFriend1.addFactionAsFriend(faction: fFriend2)
    
    cFriend.attack(character: wFriend) // passe pas
    cFriend.attack(character: pFriend) // passe pas
    cFriend.heal(character: pFriend) // passe :  Tiens poto je te heal faction: PriestFriend
    
    var assembly1 = Assembly(name: "Avengers", allowedRoles: [Warrior(), Priest()])
    assembly1.addMember(member: wFriend)
    assembly1.addMember(member: pFriend)
    assembly1.addMember(member: p2Friend)
    assembly1.addMember(member: w2Friend)
    assembly1.showDetail()
    assembly1.removeMember(member: wFriend)
    assembly1.showDetail()
}
