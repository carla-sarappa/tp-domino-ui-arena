package ar.edu.unq.uis.domino.appmodel

import ar.edu.unq.uis.domino.repo.Repositories
import ar.edu.unq.uis.domino.model.Pedido
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors

@TransactionalAndObservable
@Accessors
class PedidosCerradosAppModel {
	Pedido pedidoSeleccionado
	
	def getPedidos(){
		Repositories.getPedidos.allInstances
	}
	
	def eliminarSeleccionado() {
		if (pedidoSeleccionado == null){
			return
		}
		Repositories.getPedidos.delete(pedidoSeleccionado)
		pedidoSeleccionado = null
		refresh
	}
	
	def refresh(){
		ObservableUtils.firePropertyChanged(this, "pedidos", getPedidos)
	}
}