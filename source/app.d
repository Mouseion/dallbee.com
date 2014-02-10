import vibe.d;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
    res.render!("index.dt", req);
}

shared static this()
{
    auto router = new URLRouter;
    router.get("/", &index);

    auto settings = new HTTPServerSettings;
    settings.port = 8080;

    listenHTTP(settings, router);
}
