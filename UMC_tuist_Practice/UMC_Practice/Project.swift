import ProjectDescription

let project = Project(
    name: "UMC_Practice",
    packages: [
        .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.10.0"))
    ],
    targets: [
        .target(
            name: "UMC_Practice",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.UMC-Practice",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["UMC_Practice/Sources/**"],
            resources: ["UMC_Practice/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "UMC_PracticeTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.UMC-PracticeTests",
            infoPlist: .default,
            sources: ["UMC_Practice/Tests/**"],
            resources: [],
            dependencies: [.target(name: "UMC_Practice")]
        ),
    ]
)
