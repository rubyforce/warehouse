@package_types.factory "PackageType", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class PackageType extends RailsResource
      @configure
        url: '/admin/package_types'
        name: 'package_type'
]
