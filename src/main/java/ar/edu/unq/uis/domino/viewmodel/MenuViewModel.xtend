package ar.edu.unq.uis.domino.viewmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.uis.domino.repo.RepoPizza
import ar.edu.unq.uis.domino.model.Pizza
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class MenuViewModel {
	Pizza promoSeleccionada
	
	def getPromos(){
		getRepoPizza.allInstances
	}
	
	def eliminarSeleccionado() {
		if (promoSeleccionada == null){
			return
		}
		getRepoPizza().delete(promoSeleccionada)
		promoSeleccionada = null
		refresh
	}

	def RepoPizza getRepoPizza() {
		ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
	}
	
	def refresh(){
		ObservableUtils.firePropertyChanged(this, "promos", getPromos)
	}
	
}