package ar.edu.unq.uis.domino.window

import ar.edu.unq.uis.domino.appmodel.PedidosAbiertosAppModel
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
import ar.edu.unq.uis.domino.appmodel.PedidoAppModel
import org.uqbar.arena.windows.ErrorsPanel

class PedidosAbiertosWindow extends Dialog<PedidosAbiertosAppModel> {
		
	new(DominoApplication application) {
		super(application, new PedidosAbiertosAppModel)
	//	modelObject.refresh
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Pedidos abiertos"
	
		super.createMainTemplate(mainPanel)
	}
	
	override ErrorsPanel createErrorsPanel(Panel mainPanel) {
		return new ErrorsPanel(mainPanel, this.getTaskDescription(), 2);
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Pedidos abiertos"
		
		val horizontalPanel = new Panel(mainPanel)
		horizontalPanel.layout = new HorizontalLayout()		
			
		this.createResultsGrid(horizontalPanel)
		
		val verticalButtonPanel = new Panel(horizontalPanel)
		verticalButtonPanel.layout = new VerticalLayout()
		
		this.addPanelActions(verticalButtonPanel)
	}
	
	def addPanelActions(Panel panel) {
		addPanelControlPedido(panel)
		
		new Button(panel) => [
			caption = "Cancelar"
			onClick([|modelObject.cancelarSeleccionado])
			
		]
		new Button(panel) => [
			caption = "Editar"
			onClick([|abrirEdicionPedido])
		]
	}
	
	def addPanelControlPedido(Panel panel){
		val panelControlPedido = new Panel(panel)
		panelControlPedido.layout = new HorizontalLayout()	
		
		new Button(panelControlPedido) => [
			caption = "<<<"
			bindEnabledToProperty("pedidoSeleccionadoHasPrevious")
			onClick([|modelObject.retrocederEstado])
			
		]
		new Button(panelControlPedido) => [
			caption = ">>>"
			bindEnabledToProperty("pedidoSeleccionadoHasNext")
			
			onClick([|modelObject.avanzarEstado])
		]
	}
	
	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<Pedido>(mainPanel, typeof(Pedido)) => [
			items <=> "pedidos"
			value <=> "pedidoSeleccionado"
			numberVisibleRows = 4
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
			title = "Monto"
			fixedSize = 300
			bindContentsToProperty("monto")
		]
		
		new Column<Pedido>(table) => [
			title = "Hora"
			fixedSize = 300
			bindContentsToProperty("fecha")
		]
	}
	
	override def addActions(Panel mainPanel){
		new Button(mainPanel) => [
			caption = "Menu"
			onClick([|this.abrirMenu])
			
		]
		new Button(mainPanel) => [
			caption = "Pedidos cerrados"
			onClick([|this.abrirPedidosCerrados])
		]
		new Button(mainPanel) => [
			caption = "Salir"
			onClick([|this.close])
			
		]
	
	}
	
	def void abrirMenu() {
		val menu = new MenuWindow(this)
		menu.open
	}
	
	def void abrirPedidosCerrados(){
		val cerrados = new PedidosCerradosWindow(this)
		cerrados.open
	}
	
	def void abrirEdicionPedido(){
		val window = new EditarPedidoWindow(this, modelObject.pedidoSeleccionado)
		window.onAccept[ | modelObject.refresh]
		window.open
	}
	
	
}