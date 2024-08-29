// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ListingDetailsQuery: GraphQLQuery {
  public static let operationName: String = "ListingDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ListingDetails($id: ID!) { listingAndReview(ID: $id) { __typename _id name host { __typename host_name host_about host_identity_verified host_has_profile_pic host_picture_url host_listings_count } summary address { __typename location { __typename coordinates is_location_exact type } street } neighborhood_overview accommodates price images { __typename picture_url } minimum_nights maximum_nights guests_included } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: AirbnbcloneAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AirbnbcloneAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("listingAndReview", ListingAndReview.self, arguments: ["ID": .variable("id")]),
    ] }

    public var listingAndReview: ListingAndReview { __data["listingAndReview"] }

    /// ListingAndReview
    ///
    /// Parent Type: `Listingsandreviews`
    public struct ListingAndReview: AirbnbcloneAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AirbnbcloneAPI.Objects.Listingsandreviews }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("_id", String?.self),
        .field("name", String?.self),
        .field("host", Host?.self),
        .field("summary", String?.self),
        .field("address", Address?.self),
        .field("neighborhood_overview", String?.self),
        .field("accommodates", Int?.self),
        .field("price", Double?.self),
        .field("images", Images?.self),
        .field("minimum_nights", String?.self),
        .field("maximum_nights", String?.self),
        .field("guests_included", Int?.self),
      ] }

      public var _id: String? { __data["_id"] }
      public var name: String? { __data["name"] }
      public var host: Host? { __data["host"] }
      public var summary: String? { __data["summary"] }
      public var address: Address? { __data["address"] }
      public var neighborhood_overview: String? { __data["neighborhood_overview"] }
      public var accommodates: Int? { __data["accommodates"] }
      public var price: Double? { __data["price"] }
      public var images: Images? { __data["images"] }
      public var minimum_nights: String? { __data["minimum_nights"] }
      public var maximum_nights: String? { __data["maximum_nights"] }
      public var guests_included: Int? { __data["guests_included"] }

      /// ListingAndReview.Host
      ///
      /// Parent Type: `Host`
      public struct Host: AirbnbcloneAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AirbnbcloneAPI.Objects.Host }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("host_name", String?.self),
          .field("host_about", String?.self),
          .field("host_identity_verified", Bool?.self),
          .field("host_has_profile_pic", Bool?.self),
          .field("host_picture_url", String?.self),
          .field("host_listings_count", Int?.self),
        ] }

        public var host_name: String? { __data["host_name"] }
        public var host_about: String? { __data["host_about"] }
        public var host_identity_verified: Bool? { __data["host_identity_verified"] }
        public var host_has_profile_pic: Bool? { __data["host_has_profile_pic"] }
        public var host_picture_url: String? { __data["host_picture_url"] }
        public var host_listings_count: Int? { __data["host_listings_count"] }
      }

      /// ListingAndReview.Address
      ///
      /// Parent Type: `Address`
      public struct Address: AirbnbcloneAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AirbnbcloneAPI.Objects.Address }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("location", Location?.self),
          .field("street", String?.self),
        ] }

        public var location: Location? { __data["location"] }
        public var street: String? { __data["street"] }

        /// ListingAndReview.Address.Location
        ///
        /// Parent Type: `Location`
        public struct Location: AirbnbcloneAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AirbnbcloneAPI.Objects.Location }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("coordinates", [Double?]?.self),
            .field("is_location_exact", Bool?.self),
            .field("type", String?.self),
          ] }

          public var coordinates: [Double?]? { __data["coordinates"] }
          public var is_location_exact: Bool? { __data["is_location_exact"] }
          public var type: String? { __data["type"] }
        }
      }

      /// ListingAndReview.Images
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
