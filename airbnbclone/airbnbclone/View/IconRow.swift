//
//  IconRow.swift
//  airbnbclone
//
//  Created by Tu Sabe Oeste on 2024/08/27.
//

import SwiftUI
import AirbnbcloneAPI

struct IconRow: View {
    
    let listing: IconsQuery.Data.ListingsAndReview
    
    var body: some View {
        
        NavigationStack{
            VStack{
                ZStack{
                    //image tabview
                    VStack{
                        TabView{
                            AsyncImage(url: URL(string: listing.images?.picture_url ?? "icon image")) { image in
                                image.resizable()
                            } placeholder: {
                            Image(systemName: "house")
                            }
                            .cornerRadius(5.0)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    ZStack(alignment: .leading){
                        //
                        HStack(alignment: .top){
                            
                            //live button
                            Button {
                                print()
                            } label: {
                                Text("Live")
                            }
                            .padding()
                            .background(.lightGray)
                            .cornerRadius(5)
                            
                            Spacer()
                            //share button
                            Button {
                                print()
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                                   
                            }
                            .padding()
                            .background(.lightGray)
                            .cornerRadius(5)
                        }
                        .padding()
                        .frame(height: 300)
                        Spacer()
                    }
                    .zIndex(3)
                    .padding(.leading, 12)
                }//zstack
                .frame(height: 300)
            }//vstack
            //listing caption
            HStack{
                VStack(alignment: .leading){
                    Text("\(listing.name ?? "")")
                        .fontWeight(.semibold)
                    Text("Hosted by \(listing.host?.host_name ?? "")")
                        .foregroundStyle(.secondary)
                    HStack{
                        Text("$\(String(format:"%.2f",listing.price ?? 0.0))")
                            .fontWeight(.semibold)
                        Text("per guest")
                            .font(.caption)
                    }
                }
                .font(.caption)
                Spacer()
            }
            .padding(.leading, 12)

        }//navigation view

    }
}

//#Preview {
//    IconRow(listing: <#IconsQuery.Data.ListingsAndReview#>)
//}
