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
import ar.edu.unq.uis.domino.appmodel.PedidosCerradosAppModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.bindings.DateTransformer
import ar.edu.unq.uis.domino.adapters.FechaAdapter
import java.sql.Date

class PedidosCerradosWindow extends SimpleWindow<PedidosCerradosAppModel> {
	
		
	new(WindowOwner parent) {
		super(parent, new PedidosCerradosAppModel)
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Domino Pizza"

		
		super.createMainTemplate(mainPanel)
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Ver"
			onClick([|abrirEdicionPedido])
			
		]
		
		new Button(actionsPanel) => [
			caption = "Volver"
			onClick([|this.close])
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
			items <=> "pedidos"
			value <=> "pedidoSeleccionado"
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
			bindContentsToProperty("fecha").setTransformer(new FechaAdapter)
		]
		
		
		new Column<Pedido>(table) => [
			title = "Tiempo de espera"
			fixedSize = 300
			bindContentsToProperty("tiempoDeEspera").setTransformer[
				if (it == null) "--" else 
					if (it == 1) it + " min" else it + " mins"
			]
		]
	}
	
	def void abrirEdicionPedido(){
		new EditarPedidoWindow(this, modelObject.pedidoSeleccionado).open
	}
	
	
}