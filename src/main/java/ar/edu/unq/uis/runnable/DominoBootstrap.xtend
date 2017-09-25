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
import ar.edu.unq.uis.domino.repo.RepoEstado
import ar.edu.unq.uis.domino.repo.RepoPedido
import ar.edu.unq.uis.domino.model.Pedido
import ar.edu.unq.uis.domino.model.Cliente
import ar.edu.unq.uis.domino.model.Delivery
import ar.edu.unq.uis.domino.model.RetiraPorElLocal

class DominoBootstrap extends CollectionBasedBootstrap {
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizza)
		ApplicationContext.instance.configureSingleton(typeof(Ingrediente), new RepoIngredientes)
		ApplicationContext.instance.configureSingleton(typeof(Distribucion), new RepoDistribucion)
		ApplicationContext.instance.configureSingleton(typeof(Estado), new RepoEstado)
		ApplicationContext.instance.configureSingleton(typeof(Pedido), new RepoPedido)
	}
	
	override run() {
		val repoPizza = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
		
		repoPizza => [
			createPromo("Capresse", 15.0)
			createPromo("Palmitos", 20.0)
			createPromo("Jamon y queso", 25.0)
			createPromo("Jamon y morrones", 30.0)
			createPromo("Anana", 35.0)
			createPromo("Calabresa", 40.0)
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
		
		val repoEstado = ApplicationContext.instance.getSingleton(typeof(Estado)) as RepoEstado
		
		repoEstado => [
			createEstado("Preparando")
			createEstado("Listo para retirar")
			createEstado("Listo para enviar")
			createEstado("En viaje")
			createEstado("Entregado")
			createEstado("Cancelado")
		]
		
		val cliente = new Cliente("Carla","c@c.c")
	
		val repoPedido = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedido
		
		repoPedido => [
			createPedido(cliente, new RetiraPorElLocal, "pedido cliente 1")
			createPedido(cliente, new Delivery("calle falsa 123"), "pedido cliente 2")
			createPedido(cliente, new RetiraPorElLocal, "pedido cliente 3")
		]
	}
	
	
}