//
//  PokepediaApp.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI

@main
struct PokepediaApp: App {
    var body: some Scene {
        WindowGroup {
            PokeCardScene(pokemon: Pokemon(number: 4, name: "Charmander", types: [.fire, .water], stats: ["ATTACK", "DEFENSE"], info: "SOme text about charmander"))
        }
    }
}
