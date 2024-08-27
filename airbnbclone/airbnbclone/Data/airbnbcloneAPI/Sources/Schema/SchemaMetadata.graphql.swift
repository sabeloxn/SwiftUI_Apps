// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AirbnbcloneAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AirbnbcloneAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AirbnbcloneAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AirbnbcloneAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return AirbnbcloneAPI.Objects.Query
    case "listingsandreviews": return AirbnbcloneAPI.Objects.Listingsandreviews
    case "host": return AirbnbcloneAPI.Objects.Host
    case "images": return AirbnbcloneAPI.Objects.Images
    case "address": return AirbnbcloneAPI.Objects.Address
    case "location": return AirbnbcloneAPI.Objects.Location
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
