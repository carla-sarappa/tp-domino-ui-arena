package ar.edu.unq.uis.runnable

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import ar.edu.unq.uis.domino.repo.RepoPizza
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.uis.domino.Pizza

class DominoBootstrap  extends CollectionBasedBootstrap {
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizza)
	}
	override run() {
		val repoPizza = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
		
		//val pizzaCapresse = repoPizza.createPromo("capresse",10.0)
		
		repoPizza => [
			createPromo("capresse", 15.0)
			
		]
		
	}

	
}