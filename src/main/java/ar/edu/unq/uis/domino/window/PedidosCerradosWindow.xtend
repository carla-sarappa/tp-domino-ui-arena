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
import ar.edu.unq.uis.domino.viewmodel.PedidosCerradosViewModel
import org.uqbar.arena.widgets.Button

class PedidosCerradosWindow extends SimpleWindow<PedidosCerradosViewModel> {
	
	new(DominoApplication application) {
		super(application, new PedidosCerradosViewModel)
	//	modelObject.refresh
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Domino Pizza"

		
		super.createMainTemplate(mainPanel)
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Ver"
			onClick([|])
			
		]
		
		new Button(actionsPanel) => [
			caption = "Volver"
			onClick([|])
			
		]
		
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Pedidos cerrados"
		
		val horizontalPanel = new Panel(mainPanel)
		horizontalPanel.layout = new HorizontalLayout()		
			
		this.createResultsGrid(horizontalPanel)
		
	}
	
	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<Pedido>(mainPanel, typeof(Pedido)) => [
			items <=> "pedidosCerrados"
			value <=> "pedidoCerradoSeleccionado"
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
			bindContentsToProperty("estado")
		]
		
		new Column<Pedido>(table) => [
			title = "Fecha"
			fixedSize = 300
			bindContentsToProperty("fecha")
		]
		
		new Column<Pedido>(table) => [
			title = "Tiempo de espera"
			fixedSize = 300
			bindContentsToProperty("tiempoDeEspera")
		]
	}
	
}