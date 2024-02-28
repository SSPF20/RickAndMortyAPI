//
//  EpisodeCard.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 25/08/23.
//

import SwiftUI

struct RMEpisodeCardView: View {
    
    var viewModel: RMEpisodeCardViewModel
    
    var body: some View {
        
        HStack(alignment: .center) {
            Text(viewModel.episode)
                .font(.headline)
        }
        .padding()
        .background(Color(uiColor: .systemGroupedBackground))
        .cornerRadius(8)
    }
}

struct EpisodeCardView_Preview: PreviewProvider {
    static var previews: some View {
        RMEpisodeCardView(viewModel: RMEpisodeCardViewModel.init(id: 34))
    }
}
