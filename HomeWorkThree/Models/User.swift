//
//  User.swift
//  HomeWorkThree
//
//  Created by Руслан Арыстанов on 10.10.2024.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "Ruslan",
            password: "Rusik",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let placeOfWork: String
    let hobbie: String
    let target: String
    
    static func getPerson() -> Person {
        Person(
            name: "Ruslan",
            surname: "Arystanov",
            placeOfWork: "Arbuz.kz",
            hobbie: "fitness",
            target: "become a IOS developer"
        )
    }
}
