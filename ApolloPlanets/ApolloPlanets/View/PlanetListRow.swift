//
//  PlanetListRow.swift
//  ApolloPlanets
//
//  Created by Tu Sabe Oeste on 2024/07/11.
//

import SwiftUI
import GraphqlAPI
import SDWebImageSwiftUI

struct PlanetListRow: View {
    
    let planet: PlanetsQuery.Data.Planet
    private let placeholderImg = Image("placeholder")
    
    var body: some View {
        HStack {
            placeholderImg
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                HStack{
                    Text("#"+String(planet.orderFromSun ?? 0))
                    Text(planet.name ?? "Planet Name")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                }
                Text("Surface Temperature").font(.subheadline)
                HStack{
                    Text("min: ")
                    Text(planet.surfaceTemperatureC?.min ?? "")
                    Text("max: ")
                    Text(planet.surfaceTemperatureC?.max ?? "")
                    Text("avg: ")
                    Text(String(planet.surfaceTemperatureC?.mean ?? 0))
                }
                .foregroundStyle(.gray)
                .font(.subheadline)
                
            }
            Spacer()
        }
        .padding(4)
    }
}

//#Preview {
//    PlanetListRow()
//}
