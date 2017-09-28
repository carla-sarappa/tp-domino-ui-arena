package ar.edu.unq.uis.runnable

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import ar.edu.unq.uis.domino.repo.RepoPizza
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.repo.RepoIngredientes
import ar.edu.unq.uis.domino.model.Distribucion
import ar.edu.unq.uis.domino.repo.RepoDistribucion
import ar.edu.unq.uis.domino.model.Estado
import ar.edu.unq.uis.domino.repo.RepoPedido
import ar.edu.unq.uis.domino.model.Pedido
import ar.edu.unq.uis.domino.model.Cliente
import ar.edu.unq.uis.domino.model.Delivery
import ar.edu.unq.uis.domino.model.RetiraPorElLocal
import ar.edu.unq.uis.domino.model.Plato
import ar.edu.unq.uis.domino.repo.RepoPlato
import ar.edu.unq.uis.domino.model.Tamanio
import ar.edu.unq.uis.domino.repo.Repositories
import ar.edu.unq.uis.domino.repo.RepoCliente

class DominoBootstrap extends CollectionBasedBootstrap {
	
	new() {
		Repositories.init
	}
	
	override run() {
		val repoPizza = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
		val calabresa = repoPizza.createPromo("Calabresa", 40.0)
		
		repoPizza => [
			createPromo("Capresse", 15.0)
			createPromo("Palmitos", 20.0)
			createPromo("Jamon y queso", 25.0)
			createPromo("Jamon y morrones", 30.0)
			createPromo("Anana", 35.0)
		]
		
		
		val repoIngredientes = ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
		
		repoIngredientes => [
			createIngrediente("Tomate seco", 1.0)
			createIngrediente("Extra queso", 1.0)
			createIngrediente("Jamon crudo", 1.0)
			createIngrediente("Provolone rallado", 1.0)
			createIngrediente("Anchoas sueltas", 1.0)
			createIngrediente("Salame rodajas", 1.0)
		]
		
		val repoDistribucion = ApplicationContext.instance.getSingleton(typeof(Distribucion)) as RepoDistribucion
		
		repoDistribucion => [
			createDistribucion("Toda la pizza")
			createDistribucion("Mitad izquierda")
			createDistribucion("Mitad derecha")
		]
		
		val repoCliente = ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoCliente
		repoCliente => [
			createCliente("carla11", "carla11@gmail.com", "Carla 11")
			createCliente("carla12", "carla12@gmail.com", "Carla 12")
		]		
		
		
		val cliente = new Cliente("carla.sarappa","c@c.c", "Carla Sarappa")
		cliente.setNombre("Carla")
	
		val repoPedido = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedido
		val pedido4 = repoPedido.createPedido(cliente, new RetiraPorElLocal, "pedido 4")
		val pedido5 = repoPedido.createPedido(cliente, new RetiraPorElLocal, "pedido 5")
		
		
		repoPedido => [
			createPedido(cliente, new RetiraPorElLocal, "pedido cliente 1")
			createPedido(cliente, new Delivery("calle falsa 123"), "pedido cliente 2")
			createPedido(cliente, new RetiraPorElLocal, "pedido cliente 3")
		]
		
		
		val repoPlato = ApplicationContext.instance.getSingleton(typeof(Plato)) as RepoPlato
		val calabresaGrande = repoPlato.createPlato(calabresa, Tamanio.FAMILIAR, pedido4)
		
		repoPlato => [
			createPlato(calabresa, Tamanio.GRANDE, pedido5)
			createPlato(calabresa, Tamanio.CHICA, pedido5)
			createPlato(calabresa, Tamanio.PORCION, pedido5)
			
		]
	}
	
}