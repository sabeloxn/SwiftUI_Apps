import SwiftUI
import GraphqlAPI
import MapKit

struct ShipWreckRowView: View {
    
    let shipwrecks: ShipwrecksQuery.Data.Shipwreck
    @StateObject private var vm = ShipwreckViewModel()
    var body: some View {
        let long = Double(shipwrecks.londec ?? "0.0") ?? 0.0
        let lat = Double(shipwrecks.latdec ?? "0.0") ?? 0.0
        let coords = shipwrecks.coordinates?.compactMap { $0 }
        
        NavigationStack{
            VStack{
                Text("\(coords ?? [""])")
                    .font(.system(size: 10))
                    .foregroundStyle(.secondary)
                Map(){
                    Marker("\(shipwrecks.chart ?? "")", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
                }
                .frame(height: 200)
            }
        }
    }
}

//#Preview {
//    ShipWreckRowView()
//}
