//
//  DogFacts.swift
//  SwiftArmyKnife
//
//  Created by Zachary Buffington on 3/14/22.
//

import SwiftUI

struct DogFacts: View {
    @StateObject var viewModel = DogFactViewModel()
    var body: some View {
        HStack {
            Text(viewModel.randomFact)
            Button(action: {
                Task {
                    await viewModel.fetchDogFact()
                }
            }, label: {
                Image(systemName: "magnifyingglass")
            })
        }
        .padding()

    }
}

struct DogFacts_Previews: PreviewProvider {
    static var previews: some View {
        DogFacts()
    }
}
