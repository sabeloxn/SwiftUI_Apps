import SwiftUI

struct ShipwreckListView: View {
    
    @StateObject private var vm = ShipwreckViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<vm.shipwrecks.count, id: \.self) { index in
                    NavigationLink(destination: ShipwreckDetailsView(shipwreckID:  vm.shipwrecks[index]._id!)) {
                        ShipWreckRowView(shipwrecks: vm.shipwrecks[index])
                    }
                }
            }
            .listStyle(.plain)
            .task {
                vm.loadMoreShips()
            }
            .navigationTitle("No Float Boats 🛳️")
            .appAlert($vm.appAlert)
        }
        .notificationView(message: $vm.notificationMessage)
    }
}

#Preview {
    ShipwreckListView()
}
