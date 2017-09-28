package ar.edu.unq.uis.domino.appmodel

import ar.edu.unq.uis.domino.model.Plato
import ar.edu.unq.uis.domino.repo.Repositories
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import java.util.List
import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.model.Tamanio
import org.uqbar.commons.model.utils.ObservableUtils
import ar.edu.unq.uis.domino.model.Pedido
import ar.edu.unq.uis.domino.model.IngredienteDistribuido
import java.util.ArrayList

@Accessors
@TransactionalAndObservable
class PlatoAppModel extends ConIngredienteAppModel<Plato>{
	
	new(Pedido pedido){
		this.elemento = new Plato(getPizzas.head, getTamanios.head, pedido)
	}
	
	new (Plato plato){
		this.elemento = plato
	}
	
	override getRepository() {
		Repositories.getPlatos()
	}
	
	def List<Pizza> getPizzas(){
		Repositories.getPizzas.allInstances
	}
	
	def List<Tamanio> getTamanios(){
		Tamanio.tamanios
	}
	
	override agregarIngrediente(){
//		val newIngredientes = new ArrayList<IngredienteDistribuido>()
//		newIngredientes.addAll(elemento.ingredientes)
//		newIngredientes.add(new IngredienteDistribuido(ingredienteSeleccionado, distribucionSeleccionada))
//		elemento.ingredientes = newIngredientes

		elemento.ingredientes.add(new IngredienteDistribuido(ingredienteSeleccionado, distribucionSeleccionada))
		ObservableUtils.firePropertyChanged(elemento, "ingredientes", elemento.ingredientes)		
		
	}
	
}