package ar.edu.unq.uis.domino.appmodel

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.domino.repo.Repositories
import org.uqbar.commons.model.utils.ObservableUtils
import ar.edu.unq.uis.domino.model.Pedido
import java.util.List
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@Observable
class PedidosAbiertosAppModel {
	
	Pedido pedidoSeleccionado
	
	@Dependencies("pedidoSeleccionado")
	def Boolean getPedidoSeleccionadoHasNext(){
		pedidoSeleccionado != null && pedidoSeleccionado.estado.hasNext
	}
	
	@Dependencies("pedidoSeleccionado")
	def Boolean getPedidoSeleccionadoHasPrevious(){
		pedidoSeleccionado != null && pedidoSeleccionado.estado.hasPrevious
	}
	
	def List<Pedido> getPedidos(){
		Repositories.getPedidos.allInstances.filter[estado.abierto].toList()
	}
	
	def cancelarSeleccionado() {
		if (pedidoSeleccionado == null){
			return
		}
		pedidoSeleccionado.cancelar()
		pedidoSeleccionado = null
		refresh
	}
	
	def refresh(){
		ObservableUtils.firePropertyChanged(this, "pedidos", getPedidos)
		ObservableUtils.firePropertyChanged(this, "pedidoSeleccionado")
	}
	
	def avanzarEstado() {
		pedidoSeleccionado.estadoSiguiente
		refresh
	}
	
	def retrocederEstado() {
		pedidoSeleccionado.estadoAnterior
		refresh
	}
	
	
}