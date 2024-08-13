//
//  PlanetListView.swift
//  ApolloPlanets
//
//  Created by Tu Sabe Oeste on 2024/07/11.
//

import SwiftUI

struct PlanetListView: View {
    @StateObject private var viewModel = PlanetListViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<viewModel.planets.count, id: \.self) { index in
                    PlanetListRow(planet: viewModel.planets[index])
                }
            }
            .listStyle(.plain)
            .task {
                viewModel.loadMorePlanets()
            }
            .navigationTitle("Our Planets 🪐👽")
            .appAlert($viewModel.appAlert)
        }
        .notificationView(message: $viewModel.notificationMessage)
    }
}

#Preview {
    PlanetListView()
}
