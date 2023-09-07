//
//  CharacterCard.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 6/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct RMCharacterCardView: View {
    
    var viewModel: RMCharacterCardViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack() {
                WebImage(url: viewModel.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                ZStack() {
                    Text(viewModel.name)
                        .foregroundStyle(.primary)
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3...5)
                        .multilineTextAlignment(.center)
                }
            }
            .border(.black)
            .cornerRadius(3)
        }
        .padding([.leading, .trailing], 5)
    }
}

#Preview {
    RMCharacterCardView(viewModel: .init(id: 1))
}
