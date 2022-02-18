//
//  ImageFetcherModel.swift
//  SwiftArmyKnife
//
//  Created by Zachary Buffington on 2/16/22.
//

import Foundation
import UIKit

@MainActor
class ImageFetcherModel: ObservableObject {
    @Published var randomImage: UIImage?
    
    func fetchRandomImage() async {
        // get url
        guard let url = URL(string: "https://source.unsplash.com/random") else { return }
        
        // check for error
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let image = UIImage(data: data)
            self.randomImage = image
        } catch {
            print(error)
        }
        
    }
}
