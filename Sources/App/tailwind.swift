//
//  tailwind.swift
//
//
//  Created by Szabolcs Tóth on 19.01.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import SwiftyTailwind
import TSCBasic
import Vapor

func tailwind(_ app: Application) async throws {
  let resourecesDirectory = try AbsolutePath(validating: app.directory.resourcesDirectory)
  let publicDirectory = try AbsolutePath(validating: app.directory.publicDirectory)

  let tailwind = SwiftyTailwind()
  try await tailwind.run(
    input: .init(validating: "Styles/app.css", relativeTo: resourecesDirectory),
    output: .init(validating: "styles/app.generated.css", relativeTo: publicDirectory),
    options: .content("\(app.directory.viewsDirectory)**/*.leaf")
  )
}
