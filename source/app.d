import vibe.d;
import routes;
//import markd; // Markdown parser - todo
//import std.utf; // Should really add utf checking.

shared static this()
{
    auto router = makeRoutes();

    auto settings = new HTTPServerSettings;
    settings.port = 8080;

    listenHTTP(settings, router);
}
