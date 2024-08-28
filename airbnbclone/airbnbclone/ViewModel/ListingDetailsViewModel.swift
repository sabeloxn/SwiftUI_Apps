//
//  ListingDetailsViewModel.swift
//  airbnbclone
//
//  Created by Tu Sabe Oeste on 2024/08/27.
//

import AirbnbcloneAPI
import SwiftUI
import Apollo

class ListingDetailsViewmodel: ObservableObject {
    
    let listingID: AirbnbcloneAPI.ID

    @Published var listing: ListingDetailsQuery.Data.ListingAndReview?

    init(listingID: AirbnbcloneAPI.ID) {
        self.listingID = listingID
    }
    
    func loadListingDetails() {
        guard listingID != listing?._id else {
                return
            }
        
        Network.shared.apollo.fetch(query: ListingDetailsQuery(id: listingID)) { [weak self] result in
                guard let self = self else {
                    return
                }

                switch result {
                case .success(let graphQLResult):
                    if let listing = graphQLResult.data?.listingAndReview {
                        self.listing = listing
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
