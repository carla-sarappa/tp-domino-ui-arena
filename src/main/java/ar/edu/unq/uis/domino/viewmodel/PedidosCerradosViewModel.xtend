package ar.edu.unq.uis.domino.viewmodel

import ar.edu.unq.uis.domino.repo.Repositories
import ar.edu.unq.uis.domino.model.Pedido
import org.uqbar.commons.model.utils.ObservableUtils

class PedidosCerradosViewModel {
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