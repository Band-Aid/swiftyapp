import UIKit
import Pendo

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        print("AppDelegate: didFinishLaunchingWithOptions called")
        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        if let scheme = url.scheme, scheme.contains("pendo") {
            PendoManager.shared().initWith(url)
            print("AppDelegate: Pendo initialized with URL - \(url)")
            return true
        }

        // Handle other URL schemes if needed
        print("AppDelegate: Unhandled URL - \(url)")
        return true
    }
}
