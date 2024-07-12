//
//  Network.swift
//  ApolloPlanets
//
//  Created by Tu Sabe Oeste on 2024/07/11.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:4000/")!)
}
