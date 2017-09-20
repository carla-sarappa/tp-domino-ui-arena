package ar.edu.unq.uis.domino.window

import ar.edu.unq.uis.domino.viewmodel.PedidosAbiertosViewModel
import org.uqbar.arena.windows.SimpleWindow
import ar.edu.unq.uis.runnable.DominoApplication
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.uis.domino.model.Pedido
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Column
import ar.edu.unq.uis.domino.model.Estado
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import ar.edu.unq.uis.domino.viewmodel.EditarPedidoViewModel
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Selector

class EditarPedidoWindow extends Dialog<EditarPedidoViewModel>{
	
	
	new(DominoApplication application) {
		super(application, new EditarPedidoViewModel)
	//	modelObject.refresh
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Domino Pizza"

		
		super.createMainTemplate(mainPanel)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val estado = new Panel(mainPanel)
		estado.layout = new HorizontalLayout()
		
		new Label(estado).text = "Estado"
		
		new Selector(estado) => [
            value <=> "ingredienteSeleccionado"
            
            val bindingItems = items <=> "estados"
     		bindingItems.adapter = new PropertyAdapter(typeof(Estado), "nombre")
            width = 220
            height = 220
		]	
		
		
	}
	
	
}