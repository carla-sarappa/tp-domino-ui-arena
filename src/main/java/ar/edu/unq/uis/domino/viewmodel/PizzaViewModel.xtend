package ar.edu.unq.uis.domino.viewmodel

import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.utils.ObservableUtils
import ar.edu.unq.uis.domino.repo.RepoIngredientes
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.model.Pizza
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.domino.model.Distribucion
import ar.edu.unq.uis.domino.repo.RepoDistribucion
import ar.edu.unq.uis.domino.model.IngredienteDistribuido
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@TransactionalAndObservable
class PizzaViewModel {
	
	Pizza pizza = new Pizza()
	Ingrediente ingredienteSeleccionado
	Distribucion distribucionSeleccionada
	
	
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
	
	def RepoDistribucion getRepoDistribuciones(){
		ApplicationContext.instance.getSingleton(typeof(Distribucion)) as RepoDistribucion
	}
	
	def getDistribuciones(){
		getRepoDistribuciones().allInstances
	}
	
	def agregarIngrediente() {
		val nuevo = new IngredienteDistribuido(ingredienteSeleccionado, distribucionSeleccionada)
		pizza.agregarIngrediente(nuevo)
		ObservableUtils.firePropertyChanged(pizza, "ingredientes", pizza.ingredientes)		
	}
	
	@Dependencies("ingredienteSeleccionado", "distribucionSeleccionada")
	def isPuedeAgregarIngrediente(){
		ingredienteSeleccionado != null && distribucionSeleccionada != null
	}
	
	
}