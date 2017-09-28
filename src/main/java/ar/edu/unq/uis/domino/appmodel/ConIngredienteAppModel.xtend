package ar.edu.unq.uis.domino.appmodel

import ar.edu.unq.uis.domino.model.ConIngrediente
import ar.edu.unq.uis.domino.model.Distribucion
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.model.IngredienteDistribuido
import ar.edu.unq.uis.domino.repo.Repositories
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
abstract class ConIngredienteAppModel<T extends Entity & ConIngrediente> extends ElementoAppModel<T>{
	
	Ingrediente ingredienteSeleccionado
	Distribucion distribucionSeleccionada
	IngredienteDistribuido seleccionado
	
	new(){
		ingredienteSeleccionado = getIngredientes.head
		distribucionSeleccionada = getDistribuciones.head
	}
	
	
	def getIngredientes(){
		Repositories.getIngredientes().allInstances
	}
	
	def getDistribuciones(){
		Repositories.getDistribuciones.allInstances
	}
	
	def eliminarSeleccionado() {
		elemento.ingredientes = elemento.ingredientes.filter [it != seleccionado].toList
		seleccionado = null
		refresh
	}
	
	def refresh(){
		ObservableUtils.firePropertyChanged(this, "ingredientes")
		ObservableUtils.firePropertyChanged(this, "seleccionado")
		ObservableUtils.firePropertyChanged(this, "puedeQuitarIngrediente")
		ObservableUtils.firePropertyChanged(this, "puedeAgregarIngrediente")
	}
	
	abstract def void agregarIngrediente()
	
	@Dependencies("seleccionado")
	def Boolean getPuedeQuitarIngrediente(){
		return seleccionado != null
	}
	
	@Dependencies("ingredienteSeleccionadoNotNull", "distribucionSeleccionadaNotNull")
	def Boolean getPuedeAgregarIngrediente(){
		getIngredienteSeleccionadoNotNull() && getDistribucionSeleccionadaNotNull()
	}
	
	@Dependencies("distribucionSeleccionada")
	def Boolean getDistribucionSeleccionadaNotNull() {
		distribucionSeleccionada != null
	}
	
	@Dependencies("ingredienteSeleccionado")
	def Boolean getIngredienteSeleccionadoNotNull() {
		ingredienteSeleccionado != null
	}

}