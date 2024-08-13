import GraphqlAPI
import SwiftUI
import Apollo

class ShipwreckDetailViewmodel: ObservableObject {
    
    let shipwreckID: GraphqlAPI.ID

    @Published var shipwreck: ShipwreckDetailsQuery.Data.Shipwreck?
    @Published var isShowingLogin = false
    @Published var appAlert: AppAlert?

    init(shipwreckID: GraphqlAPI.ID) {
        self.shipwreckID = shipwreckID
    }
    
    func loadShipwreckDetails() {
        guard shipwreckID != shipwreck?._id else {
                return
            }
        
        Network.shared.apollo.fetch(query: ShipwreckDetailsQuery(id: shipwreckID)) { [weak self] result in
                guard let self = self else {
                    return
                }

                switch result {
                case .success(let graphQLResult):
                    if let shipwreck = graphQLResult.data?.shipwreck {
                        self.shipwreck = shipwreck
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
