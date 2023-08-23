//
//  PokeCardSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct PokeCardSceneState: DynamicProperty {
    @EnvironmentObject private var pokemonObject: PokemonObservableObject
    
    @State var isFav: Bool
    @Binding var favorites: [Int]
    let url: String
    
    var pokemon: Pokemon? {
        pokemonObject.pokemon
    }
    
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
    
    var name: String {
        pokemon?.name ?? ""
    }
    
    var stats: [Stat] {
        pokemon?.stats ?? []
    }
    
    func getTypes() -> [PossibleTypes] {
        let nestedTypes = pokemon?.types ?? []
        var result: [PossibleTypes] = []
        for nType in nestedTypes {
            print("\(pokemon?.types[0].type.name ?? "nothing")")
            print(pokemon?.name)
            result.append(PossibleTypes(rawValue: nType.type.name)!)
        }
        return result
    }
    
    
    func fetch() async {
       await pokemonObject.loadData(number: number)
    }
    
    var isLoaded: Bool {
        pokemon != nil
    }
}
