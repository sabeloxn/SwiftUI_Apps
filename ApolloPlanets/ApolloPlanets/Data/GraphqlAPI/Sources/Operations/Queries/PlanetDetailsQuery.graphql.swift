// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PlanetDetailsQuery: GraphQLQuery {
  public static let operationName: String = "PlanetDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query PlanetDetails($id: ID!) { planet(ID: $id) { __typename name orderFromSun hasRings mainAtmosphere _id } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: GraphqlAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("planet", Planet.self, arguments: ["ID": .variable("id")]),
    ] }

    public var planet: Planet { __data["planet"] }

    /// Planet
    ///
    /// Parent Type: `Planets`
    public struct Planet: GraphqlAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Planets }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String?.self),
        .field("orderFromSun", Int?.self),
        .field("hasRings", Bool?.self),
        .field("mainAtmosphere", [String?]?.self),
        .field("_id", String?.self),
      ] }

      public var name: String? { __data["name"] }
      public var orderFromSun: Int? { __data["orderFromSun"] }
      public var hasRings: Bool? { __data["hasRings"] }
      public var mainAtmosphere: [String?]? { __data["mainAtmosphere"] }
      public var _id: String? { __data["_id"] }
    }
  }
}
