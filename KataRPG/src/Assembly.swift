//
//  Assembly.swift
//  KataRPG
//
//  Created by Vithursan Sivakumaran on 13/07/2020.
//  Copyright © 2020 Vithursan Sivakumaran. All rights reserved.
//

import Foundation

class Assembly {
    var name : String
    var listOfMember : [Character] = []
    var listOfAllowedRoles : [Character] = []
    
    init(name : String, allowedRoles : [Character]) {
        self.name = name
        self.listOfAllowedRoles = allowedRoles
    }
    
    func addMember(member : Character) -> Void {
        self.listOfAllowedRoles.forEach { (typeOfCharacter) in
            if(type(of: typeOfCharacter) == type(of: member)) {
                if(member.currentAssembly == nil) {
                    if (listOfMember.count == 0) {
                        member.masterOfAssembly = true
                    }
                    self.listOfMember.append(member)
                    member.currentAssembly = self
                    print("Welcome to the Assembly \(self.name)")
                }
            }
        }
    }
    
    func removeMember(member : Character) -> Void {
        member.currentAssembly = nil
        member.masterOfAssembly = false
        if let indexMember = listOfMember.firstIndex(where: { $0.name == member.name }) {
            listOfMember.remove(at: indexMember)
        }
        if let randomMember = self.listOfMember.randomElement() {
            randomMember.masterOfAssembly = true
        }
    }
    
    func showDetail() -> Void {
        print("Welcome to \(self.name)")
        if (self.listOfMember.count > 0) {
            print("List of Members : ")
            self.listOfMember.forEach { (member) in
                print("\(member.name)")
                if (member.masterOfAssembly) {
                    print("Master of assembly : \(member.name)")
                }
            }
        }
        if (self.listOfAllowedRoles.count > 0) {
            print("List of Roles Allowed : ")
            self.listOfAllowedRoles.forEach { (roles) in
                print("\(type(of: roles))")
            }
        }
    }
}
