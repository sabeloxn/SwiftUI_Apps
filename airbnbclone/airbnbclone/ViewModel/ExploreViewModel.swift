//
//  ExploreViewModel.swift
//  airbnbclone
//
//  Created by Tu Sabe Oeste on 2024/08/27.
//

import Foundation
import Apollo
import AirbnbcloneAPI

class IconsViewModel: ObservableObject {
    
    @Published var listings = [IconsQuery.Data.ListingsAndReview]()
    
    init() {
        
    }
    func loadMorePlanets() {
        Network.shared.apollo.fetch(query: IconsQuery(id: ""))  { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let airbnbConnection = graphQLResult.data?.listingsAndReviews {
                    self.listings.append(contentsOf: airbnbConnection.compactMap({ $0 }))
                }

                if let errors = graphQLResult.errors {
                    print("DEBUG: \(errors)")
                }
            case .failure(let error):
                print("DEBUG:Failure: \(error)")
            }
        }
    }
}
