//
//  PlanetListViewModel.swift
//  ApolloPlanets
//
//  Created by Tu Sabe Oeste on 2024/07/11.
//

import Foundation
import Apollo
import GraphqlAPI

class PlanetListViewModel: ObservableObject {
    
    @Published var planets = [PlanetsQuery.Data.Planet]()
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    
    init() {
        
    }
    func loadMorePlanets() {
        // TODO (Section 6 - https://www.apollographql.com/docs/ios/tutorial/tutorial-connect-queries-to-ui#configure-launchlistviewmodel)
        Network.shared.apollo.fetch(query: PlanetsQuery())  { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let planetConnection = graphQLResult.data?.planets {
                    self.planets.append(contentsOf: planetConnection.compactMap({ $0 }))
                }

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
}

