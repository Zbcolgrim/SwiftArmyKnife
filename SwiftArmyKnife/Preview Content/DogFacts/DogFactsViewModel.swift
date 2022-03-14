//
//  DogFactsViewModel.swift
//  SwiftArmyKnife
//
//  Created by Zachary Buffington on 3/14/22.
//

import Foundation

@MainActor
class DogFactViewModel: ObservableObject {
    private var facts: [Fact] = []
    @Published var randomFact: String = ""
    func fetchDogFact() async {
        if !facts.isEmpty {
            randomFact = facts.randomElement()?.fact ?? ""
            return
        }
        
        guard let url = URL(string: "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let facts = try decoder.decode([Fact].self, from: data)
            self.facts = facts
            self.randomFact = facts.randomElement()?.fact ?? ""
        } catch {
            print(error)
        }
    }
}
