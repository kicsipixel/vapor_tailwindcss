import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // use Leaf
    app.views.use(.leaf)
    
    // use Tailwind CSS
    try await tailwind(app)
    
    // register routes
    try routes(app)
}
