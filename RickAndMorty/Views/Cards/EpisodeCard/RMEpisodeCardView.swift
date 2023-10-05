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
        
        VStack(alignment: .leading) {
            NameValueField(name: "Name: ", value: viewModel.name, font: .subheadline)
            NameValueField(name: "Air Date: ", value: viewModel.airDate, font: .subheadline)
            NameValueField(name: "Episode: ", value: viewModel.episode, font: .subheadline)
        }
        .padding([.leading, .top, .bottom])
        .background(Color(uiColor: .systemGroupedBackground))
        .cornerRadius(8)
    }
}

struct EpisodeCardView_Preview: PreviewProvider {
    static var previews: some View {
        RMEpisodeCardView(viewModel: RMEpisodeCardViewModel.init(id: 1))
    }
}
