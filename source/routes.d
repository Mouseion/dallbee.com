module routes;

import vibe.d;
import std.file;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	auto contentFile = "content/index.md";
	auto content = "Content could not be loaded";

	if (contentFile.exists && contentFile.isFile)
	{
    	content = readText(contentFile);
	}
    
    res.render!("index.dt", content);
}

URLRouter makeRoutes()
{
    auto router = new URLRouter;
    router.get("/", &index);
    router.get("*", serveStaticFiles("./public/"));

    return router;
}
