package ar.edu.unq.uis.domino.viewmodel

import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.utils.ObservableUtils
import ar.edu.unq.uis.domino.repo.RepoIngredientes
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.model.Pizza
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@TransactionalAndObservable
class PizzaViewModel {
	
	Pizza pizza = new Pizza()
	Ingrediente ingredienteSeleccionado
	
	
	def getIngredientes(){
		getRepoIngredientes.allInstances
	}
	
	def eliminarSeleccionado() {
		if (ingredienteSeleccionado == null){
			return
		}
		getRepoIngredientes().delete(ingredienteSeleccionado)
		ingredienteSeleccionado = null
		refresh
	}

	def RepoIngredientes getRepoIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
	}
	
	def refresh(){
		ObservableUtils.firePropertyChanged(this, "ingredientes", getIngredientes)
	}
	
	
}