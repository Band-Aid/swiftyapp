//
//  swiftyappApp.swift
//  swiftyapp
//
//  Created by Daichi Ishida on 2024/11/20.
//

import SwiftUI
import Pendo

@main

struct swiftyappApp: App {
    init(){
        initPendo()
    }
   
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: handleURL)
        }
       
    }
}


func handleURL(_ url: URL) {
    if url.scheme?.contains("pendo") == true {
        PendoManager.shared().initWith(url)
        print("PendoManager initialized with URL: \(url)")
    } else {
        print("Unhandled URL: \(url)")
    }
}
func initPendo(){

    PendoManager.shared().setup("")
    let visitorId = "John Doe"
     let accountId = "ACME"
    let visitorData: [String: any Hashable] = ["age": 27, "country": "USA"]
    let accountData: [String: any Hashable] = ["Tier": 1, "size": "Enterprise"]
     PendoManager.shared().startSession(visitorId, accountId: accountId, visitorData: visitorData, accountData: accountData)
     print("Hello, Pendo!")
}

