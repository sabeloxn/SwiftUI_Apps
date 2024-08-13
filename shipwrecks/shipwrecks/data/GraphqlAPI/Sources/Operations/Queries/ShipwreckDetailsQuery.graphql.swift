// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ShipwreckDetailsQuery: GraphQLQuery {
  public static let operationName: String = "ShipwreckDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ShipwreckDetails($id: ID!) { shipwreck(ID: $id) { __typename recrd vesslterms feature_type chart latdec londec gp_quality sounding_type quasou watlev coordinates _id } }"#
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
      .field("shipwreck", Shipwreck.self, arguments: ["ID": .variable("id")]),
    ] }

    public var shipwreck: Shipwreck { __data["shipwreck"] }

    /// Shipwreck
    ///
    /// Parent Type: `Shipwrecks`
    public struct Shipwreck: GraphqlAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Shipwrecks }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("recrd", String?.self),
        .field("vesslterms", String?.self),
        .field("feature_type", String?.self),
        .field("chart", String?.self),
        .field("latdec", String?.self),
        .field("londec", String?.self),
        .field("gp_quality", String?.self),
        .field("sounding_type", String?.self),
        .field("quasou", String?.self),
        .field("watlev", String?.self),
        .field("coordinates", [String?]?.self),
        .field("_id", String?.self),
      ] }

      public var recrd: String? { __data["recrd"] }
      public var vesslterms: String? { __data["vesslterms"] }
      public var feature_type: String? { __data["feature_type"] }
      public var chart: String? { __data["chart"] }
      public var latdec: String? { __data["latdec"] }
      public var londec: String? { __data["londec"] }
      public var gp_quality: String? { __data["gp_quality"] }
      public var sounding_type: String? { __data["sounding_type"] }
      public var quasou: String? { __data["quasou"] }
      public var watlev: String? { __data["watlev"] }
      public var coordinates: [String?]? { __data["coordinates"] }
      public var _id: String? { __data["_id"] }
    }
  }
}
