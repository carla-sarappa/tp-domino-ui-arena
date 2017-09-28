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
import ar.edu.unq.uis.domino.model.GmailSender
import java.util.Date
import ar.edu.unq.uis.domino.model.Cancelado
import ar.edu.unq.uis.domino.model.Entregado

class DominoBootstrap extends CollectionBasedBootstrap {
	
	new() {
		Repositories.init
		ApplicationContext.instance.configureSingleton(typeof(GmailSender), 
			new GmailSender("ciu.dominos.pizza@gmail.com", "interfaces2017"))    	
		
	}
	
	override run() {
		val repoPizza = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
		val calabresa = repoPizza.createPromo("Calabresa", 40.0)
		val napolitana = repoPizza.createPromo("Napolitana", 100.0)
		val margherita = repoPizza.createPromo("Margherita", 80.0)
		val cuatroQuesos = repoPizza.createPromo("Cuatro quesos", 20.0)
		
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
		
		
		val carlaSarappa = new Cliente("carla.sarappa","c@c.c", "Carla Sarappa")
		val gisele = new Cliente("escobargisele","escobargisele@g.com", "Gisele Escobar")
		val fede = new Cliente("fede11","fede@fede.c", "Fede")
		val maria = new Cliente("maria","maria@maria.com", "Maria Lopez")
	
		val repoPedido = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedido
		val pedido1 = repoPedido.createPedido(carlaSarappa, new RetiraPorElLocal, "Pedido 1")
		pedido1.fecha = new Date(System.currentTimeMillis - minutos(40))
		val pedido2 = repoPedido.createPedido(gisele, new RetiraPorElLocal, "Pedido 2")
		pedido2.fecha = new Date(System.currentTimeMillis - minutos(20))
		val pedido3 = repoPedido.createPedido(fede, new RetiraPorElLocal, "Pedido 3")
		val pedido4 = repoPedido.createPedido(carlaSarappa, new Delivery("calle falsa 123"), "Pedido 4")
		val pedido5 = repoPedido.createPedido(maria, new RetiraPorElLocal, "Pedido 5")
		val pedido6 = repoPedido.createPedido(maria, new Delivery("Lebenshon 44"), "Pedido 6")
		
		val pedido7 = repoPedido.createPedido(gisele, new RetiraPorElLocal, "Pedido 7")
		pedido7.fecha = new Date("2017/09/22")
		pedido7.estado = new Cancelado
		
		
		val pedido8 = repoPedido.createPedido(gisele, new RetiraPorElLocal, "Pedido 8")
		pedido8.fecha = new Date("2017/09/27")
		pedido8.estado = new Entregado
		pedido8.fechaCerrado = new Date()

		
		val repoPlato = ApplicationContext.instance.getSingleton(typeof(Plato)) as RepoPlato
		
		repoPlato => [
			createPlato(calabresa, Tamanio.FAMILIAR, pedido1)
			
			createPlato(napolitana, Tamanio.GRANDE, pedido2)
			createPlato(calabresa, Tamanio.CHICA, pedido2)
			createPlato(cuatroQuesos, Tamanio.PORCION, pedido2)
			
			createPlato(margherita, Tamanio.CHICA, pedido3)
			
			createPlato(napolitana, Tamanio.PORCION, pedido4)
			
			createPlato(cuatroQuesos, Tamanio.PORCION, pedido5)
		]
	}
	
	def minutos(int i) {
		i *60*1000 
	}
	
}