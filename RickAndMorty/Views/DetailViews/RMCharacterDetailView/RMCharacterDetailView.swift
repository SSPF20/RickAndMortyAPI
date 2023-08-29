//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 11/08/23.
//

import Foundation
import SwiftUI

struct RMCharacterDetailView: View {
    
    @ObservedObject var viewModel: RMCharacterDetailViewModel
    
    let columns = [GridItem(.flexible(minimum: 100))]
    
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                VStack {
                    HStack {
                        Spacer()
                        AsyncImage(url: viewModel.imageURL)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                            .shadow(radius: 5, x: 0, y: 3)
                            .padding()
                        Spacer()
                    }
                    VStack {
                        NameValueField(name: "Name: ", value: viewModel.name, font: .title2)
                        NameValueField(name: "Status: ", value: viewModel.status.string, font: .title2)
                        NameValueField(name: "Specie: ", value: viewModel.species, font: .title2)
                        NameValueField(name: "Type: ", value: viewModel.type, font: .title2)
                        NameValueField(name: "Gender: ", value: viewModel.gender.rawValue, font: .title2)
                        NameValueField(name: "Origin: ", value: viewModel.origin, font: .title2)
                        NameValueField(name: "Location: ", value: viewModel.location, font: .title2)
                    }
                    .padding(.leading)
                    Rectangle()
                        .frame(width: 320, height: 5)
                        .padding()
                    Text(NSLocalizedString("Episodes", comment: ""))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer(minLength: 10)
                    LazyVGrid(columns: columns, content: {
                        ForEach(viewModel.characterIds, id: \.self) { num in
                            
                        }
                    })
                    
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct RMCharacterDetailView_preview: PreviewProvider {
    static var previews: some View {
        RMCharacterDetailView(viewModel: .init(character: .init(id: 3,
                                                                name: "Summer Smith",
                                                                status: .alive,
                                                                species: "Human",
                                                                type: "",
                                                                gender: .female,
                                                                origin: .init(id: 20, name: "Earth (Replacement Dimension)"),
                                                                location: .init(id: 20, name: "Earth (Replacement Dimension)"),
                                                                image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
                                                                episode: [])))
    }
}

struct NameValueField: View {
    
    let name: String
    let value: String
    let font: Font
    
    var body: some View {
        HStack(alignment: .top) {
            Text(name)
                .font(font)
                .fontWeight(.bold)
            Text(value)
                .font(font)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
        .padding(.top, 1)
    }
}

