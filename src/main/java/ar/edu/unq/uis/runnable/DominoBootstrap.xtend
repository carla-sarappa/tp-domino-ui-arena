package ar.edu.unq.uis.runnable

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import ar.edu.unq.uis.domino.repo.RepoPizza
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.repo.RepoIngredientes
import ar.edu.unq.uis.domino.model.Distribucion
import ar.edu.unq.uis.domino.repo.RepoDistribucion

class DominoBootstrap extends CollectionBasedBootstrap {
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizza)
		ApplicationContext.instance.configureSingleton(typeof(Ingrediente), new RepoIngredientes)
		ApplicationContext.instance.configureSingleton(typeof(Distribucion), new RepoDistribucion)
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
			createIngrediente("Tomate seco")
			createIngrediente("Extra queso")
			createIngrediente("Jamon crudo")
			createIngrediente("Provolone rallado")
			createIngrediente("Anchoas sueltas")
			createIngrediente("Salame rodajas")
		]
		
		val repoDistribucion = ApplicationContext.instance.getSingleton(typeof(Distribucion)) as RepoDistribucion
		
		repoDistribucion => [
			createDistribucion("Toda la pizza")
			createDistribucion("Mitad izquierda")
			createDistribucion("Mitad derecha")
		]
	}
	
}