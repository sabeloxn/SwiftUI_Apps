import SwiftUI

struct Explore: View {
    @StateObject private var vm = IconsViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView(.horizontal){
                    VStack{
                        Image(systemName: "ticket")
                        Text("Icons")
                            .font(.system(size: 9))
                        
                    }
                }
                .padding(.leading)
                List {
                    ForEach(0..<vm.listings.count, id: \.self) { index in
                        NavigationLink(destination: ListingDetailsView(listingID: vm.listings[index]._id!)) {
                            IconRow(listing: vm.listings[index])
                        }
                    }
                }
                .listRowSeparator(.hidden)
                .listStyle(.plain)
                .task {
                    vm.loadMorePlanets()
                }
            }
        }
    }
}
#Preview {
    Explore()
}

