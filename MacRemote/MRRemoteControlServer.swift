//
//  MRRemoteControlServer.swift
//  MacRemote
//
//  Created by Tom Hu on 6/13/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa
import CocoaAsyncSocket

enum PacketTag: Int {
    case Header = 1
    case Body = 2
}

class MRRemoteControlServer: NSObject, GCDAsyncSocketDelegate {
    
    private var service: NSNetService!
    private var socket: GCDAsyncSocket!
    
    private lazy var bounjourHandler: MRBonjourHandler! = MRBonjourHandler()
    
    // MARK: - Life Circle
    override init() {
        super.init()
        
        self.startBroadCasting()
    }
    
    func startBroadCasting() {
        self.socket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        
        var error: NSError?
        if self.socket.acceptOnPort(0, error: &error) {
            self.service = NSNetService(domain: "local.", type: "_macremote._tcp.", name: NSHost.currentHost().name!, port: Int32(self.socket.localPort))
            self.service.delegate = self.bounjourHandler
            self.service.publish()
        } else {
            println("Unable to create socket. Error \(error)")
        }
    }
    
}
