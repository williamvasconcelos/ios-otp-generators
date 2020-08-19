// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OTPGenerator",
    products: [
        .library(name: "OTPGenerator", targets: ["OTPGenerator"]),
    ],dependencies: [],
    targets: [
        .target(name: "OTPGenerator", path: "OTPGenerator"),
    ]
)
