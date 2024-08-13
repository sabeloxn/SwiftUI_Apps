import Foundation
import Apollo
import GraphqlAPI

class ShipwreckViewModel: ObservableObject {
    
    @Published var shipwrecks = [ShipwrecksQuery.Data.Shipwreck]()
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    
    init() {
        
    }
    func loadMoreShips() {
        Network.shared.apollo.fetch(query: ShipwrecksQuery())  { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let shipwrecksConnection = graphQLResult.data?.shipwrecks {
                    self.shipwrecks.append(contentsOf: shipwrecksConnection.compactMap({ $0 }))
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
