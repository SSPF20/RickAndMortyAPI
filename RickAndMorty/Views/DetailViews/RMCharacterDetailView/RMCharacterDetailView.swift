//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 11/08/23.
//

import Foundation
import SwiftUI

struct RMCharacterDetailView: View {
    
    var viewModel: RMCharacterDetailViewModel
    
    let rows = [GridItem(.flexible(minimum: 100))]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    Spacer()
                    AsyncImage(url: viewModel.imageURL)
                        .clipShape(.circle)
                        .shadow(radius: 5, x: 0, y: 3)
                        .padding()
                    Spacer()
                }
                HStack {
                    setupStatus(title: viewModel.status.string,
                                color: viewModel.status)
                    setupGender(imageName: viewModel.gender)
                }
                
                VStack {
                    characterProperties()
                }
                .padding(.top)
                Rectangle()
                    .frame(width: 320, height: 5)
                    .padding()
                Text(NSLocalizedString("Episodes", comment: ""))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer(minLength: 10)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, content: {
                        ForEach(viewModel.characterIds, id: \.self) { num in
                            RMEpisodeCardView(viewModel: .init(id: num))
                        }
                    })
                }
            }
            .padding()
            Spacer()
        }
    }
    
    @ViewBuilder
    private func setupStatus(title: String, color: RMCharacter.Status) -> some View {
        Text(title)
            .frame(maxWidth: 85, minHeight: 40)
            .foregroundStyle(.background)
            .font(.headline)
            .background(color.color)
            .clipShape(.buttonBorder)
        
    }
    
    @ViewBuilder
    private func setupGender(imageName: RMCharacter.Gender) -> some View {
        if imageName == .unknown {
            Image(systemName: "questionmark")
                .font(.title)
                .bold()
                .foregroundStyle(imageName.imageColor)
                .padding(.leading)
        } else {
            Image(imageName.imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(imageName.imageColor)
                .padding(.leading)
        }
    }
    
    @ViewBuilder
    private func characterProperties() -> some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .foregroundStyle(.brown.opacity(0.1))
            VStack {
                Text(viewModel.name)
                    .font(.title)
                    .bold()
                    .padding()
                VStack {
                    Text(viewModel.species)
                        .padding(.bottom)
                    Text("Origin: \(viewModel.origin)")
                        .padding(.bottom)
                    Text("Location: \(viewModel.location)")
                        .padding(.bottom)
                }
                .font(.headline)
            }
        }
        .padding(.horizontal)
    }
}

struct RMCharacterDetailView_preview: PreviewProvider {
    static var previews: some View {
        RMCharacterDetailView(viewModel: .init(character: .toxicRick))
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

