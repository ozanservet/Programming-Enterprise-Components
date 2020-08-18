package com.restdriverapp;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import entities.Driver;

@Path("driver")
public class DriverResource
{
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Driver getDriver()
	{
		System.out.println("getDriver called");
		Driver d1 = new Driver();
		d1.setId(8);
		d1.setPassword("123456");
		return d1;
		
	}
	
	@GET
	@Path("/signin/{did}/{dpass}")
	public String getDriver(@PathParam("dpass") String dpass, @PathParam("did") int did)
	{
	
		if(did == 8 && dpass.equals("123456"))
		{
			return "logged in";
		}
		else
		{
			return "username or password wrong!";
		}	
	}
	
	@GET
	@Path("/daylog")
	public String getDayLog()
	{
		return "daylog ON.";
	}
		
	@GET
	@Path("/journeylog")
	public String getJourneyLog()
	{
		return "journey ON.";
	}
	
}
