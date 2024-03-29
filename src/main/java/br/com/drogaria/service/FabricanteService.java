package br.com.drogaria.service;

import java.util.List;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import com.google.gson.Gson;

import br.com.drogaria.dao.FabricanteDAO;
import br.com.drogaria.domain.Fabricante;


//http://localhost:8080/Drogaria/rest/fabricante
@Path("fabricante")
public class FabricanteService {

	@GET
	public String listar() {
		FabricanteDAO fabricanteDAO = new FabricanteDAO();
		
		List<Fabricante> fabricantes = fabricanteDAO.listar();
		
		
		Gson gson = new Gson();
		String json = gson.toJson(fabricantes);
		
		
		return json;
	}
	
	
	//http://localhost:8080/Drogaria/rest/fabricante/{codigo}
	@GET
	@Path("{codigoParam}")
	public String buscar(@PathParam("codigoParam") Long codigo) {
		FabricanteDAO fabricanteDAO = new FabricanteDAO();
		
		Fabricante fabricante = fabricanteDAO.buscar(codigo);
		
		Gson gson = new Gson();
		String json = gson.toJson(fabricante);
		
		return json;
	}
	
	
	//http://localhost:8080/Drogaria/rest/fabricante/{codigoParam}
		@DELETE
		@Path("{codigoParam}")
		public String excluir(@PathParam("codigoParam") Long codigo) {
			FabricanteDAO fabricanteDAO = new FabricanteDAO();
			
			Fabricante fabricante = fabricanteDAO.buscar(codigo);
			fabricanteDAO.excluir(fabricante);
			
			Gson gson = new Gson();
			String saida = gson.toJson(fabricante);
			
			return saida;
		}
	
	//http://localhost:8080/Drogaria/rest/fabricante
	@POST
	public String salvar(String json) {
		Gson gson = new Gson();
		Fabricante fabricante = gson.fromJson(json, Fabricante.class);
		
		FabricanteDAO fabricanteDAO = new FabricanteDAO();
		fabricanteDAO.salvar(fabricante);
		
		String jsonSaida = gson.toJson(fabricante);
		
		return jsonSaida;
	}
	
	@PUT
	public String editar(String json) {
		Gson gson = new Gson();
		Fabricante fabricante = gson.fromJson(json, Fabricante.class);
		
		FabricanteDAO fabricanteDAO = new FabricanteDAO();
		fabricante = fabricanteDAO.buscar(fabricante.getCodigo());
		fabricanteDAO.editar(fabricante);
		
		String jsonSaida = gson.toJson(fabricante);
		
		return jsonSaida;
	}
	
	
	
	
	
	
}
