import SwiftUI

struct Explore: View {
    @StateObject private var vm = IconsViewModel()
    var body: some View {
        NavigationStack {
            HStack{
                Image(systemName: "magnifyingglass")
                    .fontWeight(.semibold)
                VStack(alignment: .leading, content: {
                    
                        Text("Where to?")
                        .fontWeight(.semibold)
                        .font(.system(size: 12))
                        Text("Anywhere \u{2022} Any week \u{2022} Add guests")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                })
                Spacer()
            }
            .frame(width: 325)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 9)
            
            VStack{
                ScrollView(.horizontal){
                    VStack{
                        Image(systemName: "ticket")
                        Text("Icons")
                            .fontWeight(.semibold)
                            .font(.system(size: 11))
                    }
                }
                .padding(.leading)
                List {
                    ForEach(0..<vm.listings.count, id: \.self) { index in
                        NavigationLink(destination: ListingDetailsView(listingID: vm.listings[index]._id!)
                                                                .toolbar(.hidden, for: .navigationBar)
                                                                .toolbar(.hidden, for: .tabBar)) {
                            IconRow(listing: vm.listings[index])
                        }
                    }
                }
                .scrollIndicators(.hidden)
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

