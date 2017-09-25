package ar.edu.unq.uis.domino.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.domino.model.Pizza
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils
import ar.edu.unq.uis.domino.repo.Repositories

@Accessors
@TransactionalAndObservable
class MenuAppModel {
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