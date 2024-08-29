//
//  ListingDetailsView.swift
//  airbnbclone
//
//  Created by Tu Sabe Oeste on 2024/08/27.
//

import SwiftUI
import AirbnbcloneAPI
import MapKit

struct ListingDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm: ListingDetailsViewmodel
        
    init(listingID: AirbnbcloneAPI.ID) {
        _vm = StateObject(wrappedValue: ListingDetailsViewmodel(listingID: listingID))
    }
    var body: some View {
       
        NavigationStack{
            ScrollView{
                
                VStack{
                    if let listing = vm.listing {
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
                        .ignoresSafeArea()
                        .frame(height: 300)
                        VStack{
                            //
                            HStack{
                                //live button
                                
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "chevron.backward")
                                        .fontWeight(.semibold)
                                        .tint(.darkGray)
                                        .font(.system(size: 14))
                                }
                                .frame(width: 20, height: 20)
                                .padding(.all, 8)
                                .background(.lightGray)
                                .cornerRadius(45)
                                
                                Spacer()
                                //share button
                                Button {
                                    print()
                                } label: {
                                    Image(systemName: "square.and.arrow.up")
                                        .fontWeight(.semibold)
                                        .tint(.darkGray)
                                        .font(.system(size: 14))
                                }
                                .frame(width: 20, height: 20)
                                .padding(.all, 8)
                                .background(.lightGray)
                                .cornerRadius(45)
                                //share button
                                Button {
                                    print()
                                } label: {
                                    Image(systemName: "heart")
                                        .fontWeight(.semibold)
                                        .tint(.darkGray)
                                        .font(.system(size: 14))
                                }
                                .frame(width: 20, height: 20)
                                .padding(.all, 8)
                                .background(.lightGray)
                                .cornerRadius(45)
                            }//Hstack
                            .padding(.horizontal)
                            .padding(.top, 50)
                            Spacer()
                        }
//                        .padding(.leading, 12)
                        Spacer()
                        }

                        
                        VStack(alignment: .leading){
                            Text(listing.name!)
                                .font(.system(size: 22))
                                .fontWeight(.semibold)
                            Text((listing.address?.street!)!)
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                        Divider()//hosted by
                        VStack(alignment: .leading){
                            HStack{
                                AsyncImage(url: URL(string: listing.host?.host_picture_url ?? "")) { image in
                                    image.resizable()
                                } placeholder: {
                                Image(systemName: "person")
                                }
                                .frame(width: 35, height: 35)
                                .clipShape(.capsule(style: .circular))
                                VStack(alignment: .leading){
                                    Text("Hosted by \(listing.host?.host_name! ?? "")")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                    Text("\(listing.host?.host_about! ?? "")")
                                        .font(.system(size: 10))
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 12)
                        Divider()
                        //meet your host
                        VStack (alignment: .leading){
                            HStack{
                                Text("Meet your host")
                                    .font(.system(size: 18))
                                Spacer()
                            }
                            .padding(.horizontal, 12)
                        }
                        VStack{
                            AsyncImage(url: URL(string: listing.host?.host_picture_url ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                            Image(systemName: "person")
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(.capsule(style: .circular))
                            Text("\(listing.host?.host_name! ?? "")")
                                .font(.title)
                                .fontWeight(.semibold)
                            Text("\(listing.host?.host_listings_count! ?? 0) Listings")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                            
                        }
                        .frame(width: 300, height: 150)
                        .padding()
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(radius: 6)
                        
                        VStack{
                            Text("\(listing.host?.host_about! ?? "")")
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 12)
                        Divider()
                        //where you'll be
                        HStack{
                            Text("Where you'll be")
                                .font(.system(size: 18))
                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        VStack{
                            Map(){
                                let coords = listing.address?.location?.coordinates?.compactMap { $0 }
//                                Marker("\(coords?.first ?? 0.0)", coordinate:
//                                        CLLocationCoordinate2D(latitude: listing.address?.location?.coordinates?[1] ?? 0.0,
//                                                               longitude: listing.address?.location?.coordinates?[0] ?? 0.0))
                                Marker("\(listing.address?.street ?? "")", coordinate:
                                        CLLocationCoordinate2D(latitude: 21.28634,
                                                               longitude: -157.83919))
                            }
                            .padding()
                            .frame(height: 250)
                        }
                        Divider()
                        //Neighbourhood overview
                        HStack{
                            Text("Neighbourhood overview")
                                .font(.system(size: 18))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        HStack{
                            VStack(alignment: .leading){
                                Text("\(listing.neighborhood_overview!)")
                                    .font(.system(size: 14))
                            }
                            .padding()
                            Spacer()
                        }
                        Divider()
                        //The basics
                        HStack{
                            Text("The basics")
                                .font(.system(size: 18))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        HStack{
                            VStack(alignment: .leading){
                                Text("\(listing.minimum_nights!) minimum night stay ")
                                    .font(.system(size: 14))
                                Text("\(listing.maximum_nights!) maximum night stay ")
                                    .font(.system(size: 14))
                                Text("\(listing.guests_included!) guests maximum ")
                                    .font(.system(size: 14))
                                NavigationLink {
                                    
                                } label: {
                                    Text("Show more")
                                        .underline()
                                        .font(.system(size:12))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                }

                            }
                            .padding()
                            Spacer()
                        }
                        Divider()
                        //Safety & property
                        HStack{
                            Text("Safety & property")
                                .font(.system(size: 18))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 12)
//                        HStack{
//                            VStack{
//                                Text("\(listing.minimum_nights!) minimum night stay ")
//                                    .font(.system(size: 14))
//                                Text("\(listing.maximum_nights!) maximum night stay ")
//                                    .font(.system(size: 14))
//                                Text("\(listing.accommodates!) guests maximum ")
//                                    .font(.system(size: 14))
//                                NavigationLink {
//                                    
//                                } label: {
//                                    Text("Show more")
//                                        .font(.system(size:12))
//                                        .fontWeight(.semibold)
//                                }
//
//                            }
//                            Spacer()
//                        }
                        Spacer()
                    }//end if
                }//main vstack
                .ignoresSafeArea()
                .task {
                    vm.loadListingDetails()
                }//task
            }//scrollview
            .ignoresSafeArea()
            ZStack{
                if let listing = vm.listing {
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Text("$\(String(format:"%.2f", listing.price ?? 0.0))")
                                    .fontWeight(.semibold)
                                Text("per guest")
                                    .font(.caption)
                            }
                            
                            Text("Closes \(Date.now.formatted(date: .abbreviated, time: .shortened))")
                                .font(.caption)
                        }
                        Spacer()
                        Button {
                            print("request")
                        } label: {
                            Text("Request")
                                .foregroundStyle(.white)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            
                        }
                        .frame(width: 100, height: 5)
                        .padding()
                        .background(.pink)
                        .cornerRadius(5)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                    .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(.secondary, lineWidth: 0.2)
                        )
                }//end if
            }//Tab zstack
            .padding(.bottom, -50)
        }//navigation stack
//        .toolbar{
//                ToolbarItemGroup(placement: .topBarTrailing) {
//                    //share button
//                    Button {
//                        print()
//                    } label: {
//                        Image(systemName: "square.and.arrow.up")
//                           
//                    }
//                    .padding()
//                    .cornerRadius(25)
//                    //like button
//                    Button {
//                        print()
//                    } label: {
//                        Image(systemName: "heart")
//                           
//                    }
//                    .padding()
//                    .cornerRadius(25)
//                }
//        }
    }
}

#Preview {
    ListingDetailsView(listingID: "1001265")
}
