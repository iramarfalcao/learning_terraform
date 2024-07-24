package com.iramarfalcao;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;

import static jakarta.ws.rs.core.MediaType.TEXT_PLAIN;

@Path("/")
public class GreetingResource {

    @GET
    @Produces(TEXT_PLAIN)
    public String app() {
        return "Application running...";
    }
}
