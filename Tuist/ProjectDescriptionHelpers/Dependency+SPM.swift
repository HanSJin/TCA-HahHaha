//
//  Dependency+SPM.swift
//  ProjectDescriptionHelpers
//
//  Created by 한승진 on 8/2/24.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension Package {
    
    static let RxSwift = Package.remote(
        url: "https://github.com/ReactiveX/RxSwift.git",
        requirement: .exact("6.5.0")
    )
    static let Alamofire = Package.remote(
        url: "https://github.com/Alamofire/Alamofire.git",
        requirement: .exact("5.9.1")
    )
    static let ComposableArchitecture = Package.remote(
        url: "https://github.com/pointfreeco/swift-composable-architecture.git",
        requirement: .exact("1.12.1")
    )
}

public extension TargetDependency.SPM {
    static let RxSwift = TargetDependency.package(product: "RxSwift")
    static let RxCocoa = TargetDependency.package(product: "RxCocoa")
    static let RxRelay = TargetDependency.package(product: "RxRelay")
    static let Alamofire = TargetDependency.package(product: "Alamofire")
    static let ComposableArchitecture = TargetDependency.package(product: "ComposableArchitecture")
}
