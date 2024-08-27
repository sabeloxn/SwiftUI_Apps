// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class IconsQuery: GraphQLQuery {
  public static let operationName: String = "Icons"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Icons($id: ID) { listingsAndReviews(ID: $id) { __typename _id listing_url name price host { __typename host_name } images { __typename picture_url } } }"#
    ))

  public var id: GraphQLNullable<ID>

  public init(id: GraphQLNullable<ID>) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: AirbnbcloneAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AirbnbcloneAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("listingsAndReviews", [ListingsAndReview?].self, arguments: ["ID": .variable("id")]),
    ] }

    public var listingsAndReviews: [ListingsAndReview?] { __data["listingsAndReviews"] }

    /// ListingsAndReview
    ///
    /// Parent Type: `Listingsandreviews`
    public struct ListingsAndReview: AirbnbcloneAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AirbnbcloneAPI.Objects.Listingsandreviews }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("_id", String?.self),
        .field("listing_url", String?.self),
        .field("name", String?.self),
        .field("price", Double?.self),
        .field("host", Host?.self),
        .field("images", Images?.self),
      ] }

      public var _id: String? { __data["_id"] }
      public var listing_url: String? { __data["listing_url"] }
      public var name: String? { __data["name"] }
      public var price: Double? { __data["price"] }
      public var host: Host? { __data["host"] }
      public var images: Images? { __data["images"] }

      /// ListingsAndReview.Host
      ///
      /// Parent Type: `Host`
      public struct Host: AirbnbcloneAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AirbnbcloneAPI.Objects.Host }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("host_name", String?.self),
        ] }

        public var host_name: String? { __data["host_name"] }
      }

      /// ListingsAndReview.Images
      ///
      /// Parent Type: `Images`
      public struct Images: AirbnbcloneAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AirbnbcloneAPI.Objects.Images }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("picture_url", String?.self),
        ] }

        public var picture_url: String? { __data["picture_url"] }
      }
    }
  }
}
