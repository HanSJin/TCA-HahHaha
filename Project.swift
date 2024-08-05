import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeModule(
    name: "MySample",
    platform: .iOS,
    product: .app,
    packages: [
        .ComposableArchitecture,
        .RxSwift,
        .Alamofire,
    ],
    dependencies: [
        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.RxRelay,
        .SPM.Alamofire,
        .SPM.ComposableArchitecture,
    ],
    sources: [
        "Targets/MySample/Sources/**"
    ],
    resources: [
        "Targets/MySample/Resources/**"
    ],
    infoPlist: .file(path: "Targets/MySample/Support/Info.plist")
)
