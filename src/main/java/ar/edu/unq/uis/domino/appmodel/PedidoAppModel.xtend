package ar.edu.unq.uis.domino.appmodel

import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.utils.ObservableUtils
import ar.edu.unq.uis.domino.repo.RepoIngredientes
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.model.Pizza
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.domino.model.Distribucion
import ar.edu.unq.uis.domino.repo.RepoDistribucion
import ar.edu.unq.uis.domino.repo.RepoPlato
import ar.edu.unq.uis.domino.model.IngredienteDistribuido
import org.uqbar.commons.model.annotations.Dependencies
import ar.edu.unq.uis.domino.repo.Repositories
import ar.edu.unq.uis.domino.model.Pedido
import ar.edu.unq.uis.domino.model.Plato
import java.util.List
import java.util.ArrayList

@Accessors
@TransactionalAndObservable
class PedidoAppModel extends ElementoAppModel<Pedido>{
	Plato platoSeleccionado
	Double monto
	List<Plato> platos
		
	override getRepository() {
		Repositories.getPedidos()
	}
	
	def calcular() {
		monto = elemento.monto
		platos = new ArrayList()
		platos = getPlatosFromRepo()
		ObservableUtils.firePropertyChanged(this, "platos")
	}
	
	def getPlatosFromRepo(){
//		elemento.platos
		Repositories.getPlatos().allInstances.filter [it.pedido == elemento].toList
	}

	def eliminarSeleccionado() {
		if (platoSeleccionado == null){
			return
		}
		Repositories.getPlatos().delete(platoSeleccionado)
		calcular
	}
	
}