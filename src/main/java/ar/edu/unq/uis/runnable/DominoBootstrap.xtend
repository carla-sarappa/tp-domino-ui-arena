package ar.edu.unq.uis.runnable

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import ar.edu.unq.uis.domino.repo.RepoPizza
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.uis.domino.Pizza

class DominoBootstrap extends CollectionBasedBootstrap {
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizza)
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
		
	}

	
}