module routes;

import vibe.d;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
    //auto pageTitle = readText("test.md");
    res.render!("index.dt");
}

void resume(HTTPServerRequest req, HTTPServerResponse res)
{
    res.render!("resume.dt", req);
}

URLRouter makeRoutes()
{
    auto router = new URLRouter;
    router.get("/", &index);
    router.get("/resume", &resume);
    router.get("*", serveStaticFiles("./public/"));

    return router;
}
