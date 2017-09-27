package ar.edu.unq.uis.domino.appmodel

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.domino.repo.Repositories
import org.uqbar.commons.model.utils.ObservableUtils
import ar.edu.unq.uis.domino.model.Pedido

@Accessors
@Observable
class PedidosAbiertosAppModel {
	
	Pedido pedidoSeleccionado
	
	def getPedidos(){
		Repositories.getPedidos.allInstances
	}
	
	def cancelarSeleccionado() {
		if (pedidoSeleccionado == null){
			return
		}
		pedidoSeleccionado.cancelar()
		refresh
	}
	
	def refresh(){
		ObservableUtils.firePropertyChanged(this, "pedidos", getPedidos)
	}
	
}