// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PlanetsQuery: GraphQLQuery {
  public static let operationName: String = "Planets"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Planets { planets { __typename name orderFromSun hasRings surfaceTemperatureC { __typename min max mean } mainAtmosphere _id } }"#
    ))

  public init() {}

  public struct Data: GraphqlAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("planets", [Planet?].self),
    ] }

    public var planets: [Planet?] { __data["planets"] }

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
        .field("surfaceTemperatureC", SurfaceTemperatureC?.self),
        .field("mainAtmosphere", [String?]?.self),
        .field("_id", String?.self),
      ] }

      public var name: String? { __data["name"] }
      public var orderFromSun: Int? { __data["orderFromSun"] }
      public var hasRings: Bool? { __data["hasRings"] }
      public var surfaceTemperatureC: SurfaceTemperatureC? { __data["surfaceTemperatureC"] }
      public var mainAtmosphere: [String?]? { __data["mainAtmosphere"] }
      public var _id: String? { __data["_id"] }

      /// Planet.SurfaceTemperatureC
      ///
      /// Parent Type: `SurfaceTemperatureC`
      public struct SurfaceTemperatureC: GraphqlAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.SurfaceTemperatureC }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("min", String?.self),
          .field("max", String?.self),
          .field("mean", Double?.self),
        ] }

        public var min: String? { __data["min"] }
        public var max: String? { __data["max"] }
        public var mean: Double? { __data["mean"] }
      }
    }
  }
}
