//
//  Tabbar_Controller.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 12/01/2023.
//

import Foundation
import Network

extension Tabbar_View {
    
    func CheckInternetConnection(){

        let MONITOR = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor_INTERNET_CONNECTION")

        var local_status: NWPath.Status = .satisfied

        MONITOR.pathUpdateHandler = { path in

            // Monitor runs on a background thread so we need to publish
            // on the main thread
            DispatchQueue.main.async {

                if local_status != path.status {

                    local_status = path.status

                   // var sender = CombineNotificationSender("CONNECTED")

                    if path.status == .satisfied {

                        //AVOID DUPLICATE NOTIFCATION
                       // self.monitor.cancel()

                        print("We're connected!")

                        self.monitor.status = .connected

                       // sender = CombineNotificationSender("CONNECTED")

                    } else {
                        print("No connection.")

                        self.monitor.status = .disconnected

                       // sender = CombineNotificationSender("DISCONNECTED")
                    }

                   // NotificationCenter.default.post(name: CombineNotificationSender.combineNotification, object: sender)
                }
            }
        }
        MONITOR.start(queue: queue)
    }
}
