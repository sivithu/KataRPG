//
//  KataRPGTests.swift
//  KataRPGTests
//
//  Created by Vithursan Sivakumaran on 13/07/2020.
//  Copyright © 2020 Vithursan Sivakumaran. All rights reserved.
//

import XCTest
@testable import KataRPG

class KataRPGTests: XCTestCase {
    
    func testInitCharacter() {
        let character = Character(name: "Kaaris")
        XCTAssertEqual("Kaaris", character.name)
    }
    
    func testInitWarrior() {
        let warrior = Warrior(name: "Booba")
        XCTAssertEqual("Booba", warrior.name)
    }
    
    func testInitPriest() {
        let priest = Priest(name: "Wejdene")
        XCTAssertEqual("Wejdene", priest.name)
    }
    
    func testInitFaction() {
        let faction = Faction(name: "MOC")
        XCTAssertEqual("MOC", faction.name)
    }
    
    func testInitAssembly() {
        let assembly = Assembly(name: "ESGI", allowedRoles: [Warrior(), Priest()])
        XCTAssertEqual("ESGI", assembly.name)
    }
    
    func testCharacterAttackOtherCharacter() {
        let character = Character(name: "Kaaris")
        let warrior = Character(name: "Booba")
        
        character.attack(character: warrior)
        XCTAssertEqual(99, warrior.health)
    }
    
    func testCharacterAttackHisSelf() {
        let character = Character(name: "Kaaris")
        
        character.attack(character: character)
        XCTAssertEqual(100, character.health)
    }
    
    func testCharacterHeal() {
        let character = Character(name: "Kaaris")
        let warrior = Character(name: "Booba")
        
        character.attack(character: warrior)
        character.attack(character: character)
        
        XCTAssertEqual(99, warrior.health)
        XCTAssertEqual(100, character.health)
        
        character.heal(character: warrior)
        character.heal(character: character)
        
        XCTAssertEqual(100, warrior.health)
        XCTAssertEqual(100, character.health)
    }
    
    func testWarriorAttack() {
        let character = Character(name: "Kaaris")
        let warrior = Warrior(name: "Booba")
        var characterLowLife : Bool = false
        var warriorLowLife : Bool = false
        
        warrior.attack(character: character)
        warrior.attack(character: warrior)
        warrior.attack(character: character)
        warrior.attack(character: warrior)
        
        if(character.health < 100) {
            characterLowLife = true
        }
        if(warrior.health < 100) {
            warriorLowLife = true
        }
        
        XCTAssertTrue(characterLowLife)
        XCTAssertTrue(warriorLowLife)
    }
    
    func testWarriorOnlyHealHisSelf() {
        let character = Character(name: "Kaaris")
        let warrior = Warrior(name: "Booba")
        
        character.attack(character: warrior)
        
        warrior.healHimSelf()
        
        XCTAssertEqual(100, warrior.health)
    }
    
    func testPriestHeal() {
        let character = Character(name: "Kaaris")
        let warrior = Warrior(name: "Booba")
        let priest = Priest(name: "Wejdene")
        
        character.attack(character: warrior)
        
        priest.heal(character: warrior)
        
        XCTAssertEqual(100, warrior.health)
    }
    
    func testHealthLimitedToHundred() {
        let character = Character(name: "Kaaris")
        let warrior = Warrior(name: "Booba")
        let priest = Priest(name: "Wejdene")
        
        character.heal(character: character)
        XCTAssertEqual(100, character.health)
        
        character.attack(character: warrior)
        XCTAssertEqual(99, warrior.health)
        
        priest.heal(character: warrior)
        XCTAssertEqual(100, warrior.health)
        
        character.attack(character: warrior)
        XCTAssertEqual(99, warrior.health)
        
        character.heal(character: warrior)
        character.heal(character: warrior)
        character.heal(character: warrior)
        XCTAssertEqual(100, warrior.health)
    }
    
    func testAttackMemberOfFaction() {
        let faction = Faction(name : "MOC")
        let character = Character(name: "Kaaris")
        let warrior = Warrior(name: "Booba")
        
        faction.addCharacter(character: character)
        faction.addCharacter(character: warrior)
        
        character.attack(character: warrior)
        warrior.attack(character: character)
        XCTAssertEqual(100, character.health)
        XCTAssertEqual(100, warrior.health)
    }
    
    func testAttackNoMemberOfFaction() {
        let faction = Faction(name : "MOC")
        let character = Character(name: "Kaaris")
        let warrior = Warrior(name: "Booba")
        let priest = Priest(name: "Wejdene")
        
        faction.addCharacter(character: character)
        faction.addCharacter(character: warrior)
        
        character.attack(character: priest)
        priest.attack(character: character)
        priest.attack(character: warrior)
        
        XCTAssertEqual(99, character.health)
        XCTAssertEqual(99, warrior.health)
        XCTAssertEqual(99, priest.health)
    }
    
    func testHealMemberOfFaction() {
        let faction = Faction(name : "MOC")
        let character = Character(name: "Kaaris")
        let warrior = Warrior(name: "Booba")
        let priest = Priest(name: "Wejdene")
        
        faction.addCharacter(character: character)
        faction.addCharacter(character: warrior)
        
        character.attack(character: priest)
        priest.attack(character: character)
        priest.attack(character: warrior)
        
        XCTAssertEqual(99, character.health)
        XCTAssertEqual(99, warrior.health)
        XCTAssertEqual(99, priest.health)
        
        character.heal(character: warrior)
        XCTAssertEqual(100, warrior.health)
    }
    
    func testHealNoMemberOfFaction() {
        let factionMOC = Faction(name : "MOC")
        let factionAL = Faction(name : "AL")
        let character = Character(name: "Kaaris")
        let warrior = Warrior(name: "Booba")
        let priest = Priest(name: "Wejdene")
        
        factionMOC.addCharacter(character: character)
        factionMOC.addCharacter(character: warrior)
        
        character.attack(character: priest)
        priest.attack(character: character)
        priest.attack(character: warrior)
        XCTAssertEqual(99, character.health)
        XCTAssertEqual(99, warrior.health)
        XCTAssertEqual(99, priest.health)
        
        character.heal(character: priest)
        XCTAssertEqual(99, priest.health)
        
        priest.heal(character: character)
        XCTAssertEqual(100, character.health)
        
        factionAL.addCharacter(character: priest)
        priest.attack(character: character)
        XCTAssertEqual(99, character.health)
        
        priest.heal(character: character)
        XCTAssertEqual(99, character.health)
    }
    
    func testAttackMemberOfFactionFriend() {
        let factionMOC = Faction(name : "MOC")
        let factionAL = Faction(name: "AL")
        let characterKaaris = Character(name: "Kaaris")
        let priestWejdene = Priest(name: "Wejdene")
        
        factionMOC.addCharacter(character: characterKaaris)
        factionAL.addCharacter(character: priestWejdene)
        
        factionMOC.addFactionAsFriend(faction: factionAL)
        
        characterKaaris.attack(character: priestWejdene)
        XCTAssertEqual(100, priestWejdene.health)
    }
    
    func testAttackNoMemberOfFactionFriend() {
        let factionMOC = Faction(name : "MOC")
        let factionAL = Faction(name: "AL")
        let factionSRC = Faction(name: "SRC")
        let characterKaaris = Character(name: "Kaaris")
        let priestWejdene = Priest(name: "Wejdene")
        let characterHatik = Character(name: "Hatik")
        
        factionMOC.addCharacter(character: characterKaaris)
        factionAL.addCharacter(character: priestWejdene)
        factionSRC.addCharacter(character: characterHatik)
        
        factionMOC.addFactionAsFriend(faction: factionAL)
        
        characterKaaris.attack(character: priestWejdene)
        characterKaaris.attack(character: characterHatik)
        XCTAssertEqual(100, priestWejdene.health)
        XCTAssertEqual(99, characterHatik.health)
    }
    
    func testHealMemberOfFactionFriend() {
        let factionMOC = Faction(name : "MOC")
        let factionAL = Faction(name: "AL")
        let factionSRC = Faction(name: "SRC")
        let characterKaaris = Character(name: "Kaaris")
        let priestWejdene = Priest(name: "Wejdene")
        let characterHatik = Character(name: "Hatik")
        
        factionMOC.addCharacter(character: characterKaaris)
        factionAL.addCharacter(character: priestWejdene)
        factionSRC.addCharacter(character: characterHatik)
        
        factionMOC.addFactionAsFriend(faction: factionAL)
        
        characterHatik.attack(character: priestWejdene)
        XCTAssertEqual(99, priestWejdene.health)
        
        
        characterKaaris.heal(character: priestWejdene)
        XCTAssertEqual(100, priestWejdene.health)
    }
    
    func testHealNoMemberOfFactionFriend() {
        let factionMOC = Faction(name : "MOC")
        let factionAL = Faction(name: "AL")
        let factionSRC = Faction(name: "SRC")
        let factionMCSI = Faction(name: "MCSI")
        
        let characterKaaris = Character(name: "Kaaris")
        let priestWejdene = Priest(name: "Wejdene")
        let characterHatik = Character(name: "Hatik")
        let priestInes = Priest(name: "Ines")
        
        factionMOC.addCharacter(character: characterKaaris)
        factionAL.addCharacter(character: priestWejdene)
        factionSRC.addCharacter(character: characterHatik)
        factionMCSI.addCharacter(character: priestWejdene)
        
        factionMOC.addFactionAsFriend(faction: factionAL)
        factionMCSI.addFactionAsFriend(faction: factionSRC)
        
        characterKaaris.attack(character: characterHatik)
        characterKaaris.attack(character: priestInes)
        XCTAssertEqual(99, priestInes.health)
        XCTAssertEqual(99, characterHatik.health)
        
        characterKaaris.heal(character: priestInes)
        characterKaaris.heal(character: characterHatik)
        XCTAssertEqual(99, priestInes.health)
        XCTAssertEqual(99, characterHatik.health)
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
