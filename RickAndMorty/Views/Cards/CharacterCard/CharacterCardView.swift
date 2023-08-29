//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 25/08/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CharacterCardView: View {
    
    @State var star = false
    
    @ObservedObject var viewModel: RMCharacterDetailViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                VStack {
                    CharacterImage(url: viewModel.imageURL, caption: viewModel.species)
                    Spacer()
                }
                VStack(alignment: .leading) {
                    NameValueField(name: "Name:", value: viewModel.name, font: .subheadline)
                        .padding(.top)
                    Spacer()
                    Text("Last location:")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                        .bold()
                    Text(viewModel.location)
                        .font(.subheadline)
                        .bold()
                        .padding(.bottom)
                }
                VStack {
                    Button(action: {
                        self.star.toggle()
                    },
                           label: {
                        if star {
                            Image(systemName: "star.fill")
                        } else {
                            Image(systemName: "star")
                        }
                    })
                    .foregroundColor(.yellow)
                    .font(.title)
                    .padding(.top)
                    Spacer()
                    Capsule()
                        .fill(.green)
                        .overlay(
                            Text(viewModel.status.string))
                        .font(.subheadline)
                        .frame(width: 60, height: 30)
                        .padding(.bottom)
                }
                .padding(.trailing)
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(8)
        }
    }
}

struct CharacterImage: View {
    
    let url: URL?
    let caption: String
    
    var body: some View {
        ZStack {
            WebImage(url: url)
                .resizable()
            VStack {
                Spacer()
                HStack {
                    Rectangle()
                        .foregroundStyle(.black)
                        .opacity(0.3)
                        .overlay(
                            Text(caption)
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .lineLimit(2)
                        )
                        .frame(height: 20)
                }
                .backgroundStyle(.primary)
            }
        }
        .cornerRadius(8)
        .frame(maxWidth: 100, maxHeight: 100)
        .padding(4)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        return CharacterCardView(viewModel: RMCharacterDetailViewModel(character:
                .init(id: 1,
                      name: "Rick Sanchez",
                      status: .alive,
                      species: "Human",
                      type: "",
                      gender: .male,
                      origin: .init(id: 2, name: "Earth"),
                      location: .init(id: 2, name: "EarthC"),
                      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                      episode: [])))
        
    }
}
