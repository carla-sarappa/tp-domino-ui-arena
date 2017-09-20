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

class PedidosAbiertosWindow extends SimpleWindow<PedidosAbiertosViewModel> {
	
	new(DominoApplication application) {
		super(application, new PedidosAbiertosViewModel)
	//	modelObject.refresh
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Domino Pizza - Menu"
		taskDescription = "Elegi tu promo"

		
		super.createMainTemplate(mainPanel)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Pedidos abiertos"
		
		val horizontalPanel = new Panel(mainPanel)
		horizontalPanel.layout = new HorizontalLayout()		
			
		this.createResultsGrid(horizontalPanel)
		
		val verticalButtonPanel = new Panel(horizontalPanel)
		verticalButtonPanel.layout = new VerticalLayout()
		
	//	this.addPanelActions(verticalButtonPanel)
	}
	
	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<Pedido>(mainPanel, typeof(Pedido)) => [
			items <=> "promos"
			value <=> "promoSeleccionada"
			numberVisibleRows = 3
		]
		
		new Column<Pedido>(table) => [
			title = "Pedido"
			fixedSize = 300
			bindContentsToProperty("nombre")
		]

		new Column<Pedido>(table) => [
			title = "Estado"
			fixedSize = 300
			alignRight
			bindContentsToProperty("estado")
		]
		
		new Column<Pedido>(table) => [
			title = "Monto"
			fixedSize = 300
			alignRight
			bindContentsToProperty("monto")
		]
		
		new Column<Pedido>(table) => [
			title = "Hora"
			fixedSize = 300
			alignRight
			bindContentsToProperty("fecha")
		]
	}
	
}