//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by 한승진 on 8/2/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: [
//        .remote(
//            url: "https://github.com/Moya/Moya.git",
//            requirement: .upToNextMajor(from: "15.0.0")
//        )
    ],
    platforms: [.iOS]
)
