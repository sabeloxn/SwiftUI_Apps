import GraphqlAPI
import SwiftUI

struct ShipwreckDetailsView: View {
    
    @StateObject private var vm: ShipwreckDetailViewmodel
    
    init(shipwreckID: GraphqlAPI.ID) {
        _vm = StateObject(wrappedValue: ShipwreckDetailViewmodel(shipwreckID: shipwreckID))
    }
    
    var body: some View {
        VStack{
            if let shipwreck = vm.shipwreck {
                if let feature = shipwreck.feature_type {
                    Text(feature)
                }
            }
        }
        
        .padding(10)
        .navigationBarTitleDisplayMode(.inline)
        .appAlert($vm.appAlert)
    }
}

//#Preview {
//    ShipwreckDetailsView()
//}
