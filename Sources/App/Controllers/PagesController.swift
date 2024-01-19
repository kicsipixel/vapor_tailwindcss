//
//  PagesController.swift
//
//
//  Created by Szabolcs Tóth on 19.01.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import Leaf
import Vapor

struct PagesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: index)
    }
    
    func index(_ req: Request) -> EventLoopFuture<View> {
        return req.view.render("index")
    }
}
