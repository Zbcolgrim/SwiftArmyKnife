//
//  Sunset.swift
//  SwiftArmyKnife
//
//  Created by Zachary Buffington on 3/14/22.
//

import SwiftUI

struct Sunset: View {
    @StateObject var viewModel = SunsetViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                Task {
                    await viewModel.fetchSunInfo()
                }
            }, label: {
                Image(systemName: "magnifyingglass")
            })

            if let sunInfo = viewModel.sunInfo {
                Text("Day Length: \(sunInfo.dayLength)")
                Text("Solar Noon: \(sunInfo.solarNoon)")
                Text("Sunrise: \(sunInfo.sunrise)")
                Text("Sunset: \(sunInfo.sunset)" )
        }
        

    }
}

struct Sunset_Previews: PreviewProvider {
    static var previews: some View {
        Sunset()
    }
}
}
