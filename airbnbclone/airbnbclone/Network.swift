//
//  Network.swift
//  airbnbclone
//
//  Created by Tu Sabe Oeste on 2024/08/27.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:4000/")!)
}

