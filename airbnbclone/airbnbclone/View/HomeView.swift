//
//  HomeView.swift
//  airbnbclone
//
//  Created by Tu Sabe Oeste on 2024/08/27.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab = 0
    @State private var searchText = ""
    var body: some View {
        VStack{
            TabView(selection: $selectedTab){
                    NavigationStack{
                        Explore()
                    }
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("Explore")}
                    .tag(0)
                    
                    NavigationStack{
                        WishlistView()
                    }
                    .tabItem{
                        Image(systemName: "heart")
                        Text("Wishlists")}
                    .tag(1)
                    
                    NavigationStack{
                        TripsView()
                    }
                    .tabItem {
                        Image("airbnblogo")
                        Text("Trips")
                    }
                    .tag(2)
                    NavigationStack{
                        InboxView()
                    }
                    .tabItem {
                        Image(systemName: "message")
                        Text("Inbox")
                    }
                    .tag(3)
                    
                    NavigationStack{
                        LoginView()
                    }
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profle")
                    }
                    .tag(4)
            }
        }
        .ignoresSafeArea()
        .searchable(text: $searchText, prompt: Text("Where to?"))

    }
}

#Preview {
    HomeView()
}
