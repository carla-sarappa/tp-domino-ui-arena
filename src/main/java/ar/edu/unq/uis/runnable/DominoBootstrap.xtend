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
		
		repoPizza => [
			createPromo("capresse", 15.0)
			createPromo("palmitos",20.0)
			createPromo("jamonYQueso", 25.0)
			createPromo("jamonYMorrones", 30.0)
			createPromo("anana",35.0)
			createPromo("calabresa", 40.0)
		]
		
	}

	
}