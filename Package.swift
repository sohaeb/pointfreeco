// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "PointFree",
  products: [
    .library(name: "PointFree", targets: ["PointFree"]),
    .library(name: "PointFreeTestSupport", targets: ["PointFreeTestSupport"]),
    .executable(name: "Runner", targets: ["Runner"]),
    .executable(name: "Server", targets: ["Server"]),
    .library(name: "Styleguide", targets: ["Styleguide"]),
    ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-prelude.git", .revision("5d5005d")),
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .revision("69b48c8")),
    .package(url: "https://github.com/pointfreeco/swift-web.git", .branch("update-nio")),
    .package(url: "https://github.com/pointfreeco/Ccmark.git", .branch("master")),
    .package(url: "https://github.com/vapor-community/postgresql.git", .exact("2.1.2")),
    ],
  targets: [
    .target(
      name: "PointFree",
      dependencies: [
        "ApplicativeRouter",
        "ApplicativeRouterHttpPipelineSupport",
        "Css",
        "CssReset",
        "Either",
        "Html",
        "HtmlCssSupport",
        "HttpPipeline",
        "HttpPipelineHtmlSupport",
        "Optics",
        "PostgreSQL",
        "Styleguide",
        "Tuple",
        "UrlFormEncoding",
        ]
    ),

    .testTarget(
      name: "PointFreeTests",
      dependencies: [
        "CssTestSupport",
        "HtmlTestSupport",
        "HttpPipelineTestSupport",
        "PointFree",
        "PointFreeTestSupport",
        ]
    ),

    .target(
      name: "PointFreeTestSupport",
      dependencies: [
        "Either",
        "PointFree",
        "Prelude",
        "SnapshotTesting",
        ]
    ),

    .target(
      name: "Runner",
      dependencies: ["PointFree"]),

    .target(
      name: "Server",
      dependencies: ["PointFree"]),

    .target(
      name: "Styleguide",
      dependencies: ["Html", "Css"]),

    .testTarget(
      name: "StyleguideTests",
      dependencies: ["Styleguide", "CssTestSupport", "PointFreeTestSupport"]),
    ],
  swiftLanguageVersions: [4]
)
