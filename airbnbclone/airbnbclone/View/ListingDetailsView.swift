//
//  ListingDetailsView.swift
//  airbnbclone
//
//  Created by Tu Sabe Oeste on 2024/08/27.
//

import SwiftUI
import AirbnbcloneAPI

struct ListingDetailsView: View {
    
    @StateObject private var vm: ListingDetailsViewmodel
        
    init(listingID: AirbnbcloneAPI.ID) {
        _vm = StateObject(wrappedValue: ListingDetailsViewmodel(listingID: listingID))
    }
    var body: some View {
        if let listing = vm.listing {
//            if let feature = shipwreck.feature_type {
//                Text(feature)
//            }
            ZStack{
                //image tabview
                TabView{
                    AsyncImage(url: URL(string: listing.images?.picture_url ?? "icon image")) { image in
                        image.resizable()
                    } placeholder: {
                    Image(systemName: "house")
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                    .cornerRadius(5.0)
                }
                //
                HStack(alignment: .top){
                    //live button
                    Button {
                        print()
                    } label: {
                        Text("Live")
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(5)
                    
                    Spacer()
                    //share button
                    Button {
                        print()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                           
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(5)
                }
                .padding()
                .frame(height: 300)
                
            }//zstack
            .ignoresSafeArea()
            .padding()
            .frame(height: 300)
        }

    }
}

//#Preview {
//    ListingDetailsView()
//}
