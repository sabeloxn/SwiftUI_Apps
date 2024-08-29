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
                VStack{
                    ZStack{
                        VStack{
                            //image tabview
                            TabView{
                                AsyncImage(url: URL(string: listing.images?.picture_url ?? "icon image")) { image in
                                    image.resizable()
                                } placeholder: {
                                Image(systemName: "house")
                                }
                                .frame(width: 325, height: 275)
                                .cornerRadius(5.0)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        VStack{
                            //
                            HStack{
                                //live button
                                
                                Button {
                                    print()
                                } label: {
                                    Text("Live")
                                        .font(.system(size: 14))
                                }
                                .frame(width: 40)
                                .padding(.all, 5)
                                .background(.lightGray)
                                .cornerRadius(15)
                                
                                Spacer()
                                //share button
                                Button {
                                    print()
                                } label: {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 14))
                                }
                                .padding(.all, 5)
                                .background(.lightGray)
                                .cornerRadius(25)
                            }//Hstack
                            .padding(.horizontal, 50)
                            .padding(.top, 20)
                            Spacer()
                        }
                        Spacer()
                    }//zstack
                    .frame(width: 350, height: 300)
                    Spacer()
                }//vstack
                .padding(.bottom, -20)
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
                }//hstack
                .padding(.bottom, 15)
                .padding(.leading, 12)
            }//main vstack
            .padding(.leading, 12)
        }//navigation stack
    }
}

//#Preview {
//    IconRow(listing: )
//}
