//
//  SunsetViewModel.swift
//  SwiftArmyKnife
//
//  Created by Zachary Buffington on 3/14/22.
//

import Foundation
import UIKit

@MainActor
class SunsetViewModel: ObservableObject {
    @Published var sunInfo: SunInfo?
    
    func fetchSunInfo() async {
        guard let url = URL(string: "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let sun = try decoder.decode(Sun.self, from: data)
            self.sunInfo = sun.results
           
            
        } catch {
            print(error )
        }
    }
}

