package restProject;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import javax.xml.bind.JAXBElement;

import restProject.LoadMovie;
import restProject.SendMovie;

public class SendMovieResource {
    @Context
    UriInfo uriInfo;
    @Context
    Request request;
    String id;
    public SendMovieResource(UriInfo uriInfo, Request request, String id) {
        this.uriInfo = uriInfo;
        this.request = request;
        this.id = id;
    }
    /*public SendMovieResource(UriInfo uriInfo, Request request, String cinema) {
        this.uriInfo = uriInfo;
        this.request = request;
        this.cinema = cinema;
    }*/

    //Application integration
    @GET
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public SendMovie getSendMovie() {
    	SendMovie sendMovie = LoadMovie.instance.getModel().get(id);
        if(sendMovie==null)
            throw new RuntimeException("Get: SendMovie with " + id +  " not found");
        return sendMovie;
    }

    // for the browser
    @GET
    @Produces(MediaType.TEXT_XML)
    public SendMovie getSendMovieHTML() {
    	SendMovie sendMovie = LoadMovie.instance.getModel().get(id);
        if(sendMovie==null)
            throw new RuntimeException("Get: SendMovie with " + id +  " not found");
        return sendMovie;
    }

    @PUT
    @Consumes(MediaType.APPLICATION_XML)
    public Response putSendMovie(JAXBElement<SendMovie> sendMovie) {
    	SendMovie c = sendMovie.getValue();
        return putAndGetResponse(c);
    }

    @DELETE
    public void deleteSendMovie() {
    	SendMovie c = LoadMovie.instance.getModel().remove(id);
        if(c==null)
            throw new RuntimeException("Delete: SendMovie with " + id +  " not found");
    }

    private Response putAndGetResponse(SendMovie sendMovie) {
        Response res;
        if(LoadMovie.instance.getModel().containsKey(sendMovie.getId())) {
            res = Response.noContent().build();
        } else {
            res = Response.created(uriInfo.getAbsolutePath()).build();
        }
        LoadMovie.instance.getModel().put(sendMovie.getId(), sendMovie);
        return res;
    }



}