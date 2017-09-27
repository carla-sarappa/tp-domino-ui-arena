package ar.edu.unq.uis.domino.appmodel

import ar.edu.unq.uis.domino.model.Plato
import ar.edu.unq.uis.domino.repo.Repositories
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import java.util.List
import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.model.Tamanio
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class PlatoAppModel extends ElementoAppModel<Plato>{
	
	
	override getRepository() {
		Repositories.getPlatos()
	}
	
	def List<Pizza> getPizzas(){
		Repositories.getPizzas.allInstances
	}
	
	def List<Tamanio> getTamanios(){
		Tamanio.tamanios
	}
	

	
}