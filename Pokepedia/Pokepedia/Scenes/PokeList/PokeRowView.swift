//
//  PokeRowView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI

struct PokeRowView: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            Image(systemName: "star")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemon.number).png")) {
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4
                    )
            } placeholder: {
                EmptyView()
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("# \(pokemon.number)")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                    Text(pokemon.name)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                } // HSTACK
                ScrollView([.horizontal]) {
                    HStack {
                        ForEach(pokemon.types) { type in
                            Text(type.rawValue)
                                .fontWeight(.bold)
                                .padding(7)
                                .background(Color(hex: TypeColor.grass.rawValue))
                                .clipShape(Capsule())
                        } // FOREACH
                    } // HSTACK
                } // SCROLL
                //.defaultSrcllAnchor(.center)
            } // VSTACK
        } // HSTACK
        .padding(10)
        
    }
}

struct PokeRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokeRowView(pokemon: Pokemon(number: 4, name: "Charmander", types: [.fire, .grass]))
    }
}
