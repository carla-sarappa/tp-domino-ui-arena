package ar.edu.unq.uis.domino.viewmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.uis.domino.repo.RepoPizza
import ar.edu.unq.uis.domino.model.Pizza
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils
import ar.edu.unq.uis.domino.repo.Repositories

@Accessors
@TransactionalAndObservable
class MenuViewModel {
	Pizza promoSeleccionada
	
	def getPromos(){
		Repositories.getPizzas.allInstances
	}
	
	def eliminarSeleccionado() {
		if (promoSeleccionada == null){
			return
		}
		Repositories.getPizzas.delete(promoSeleccionada)
		promoSeleccionada = null
		refresh
	}
	
	def refresh(){
		ObservableUtils.firePropertyChanged(this, "promos", getPromos)
	}
}