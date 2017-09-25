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
import ar.edu.unq.uis.domino.appmodel.EditarPedidoAppModel
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.model.Plato
import org.uqbar.arena.widgets.TextBox

class EditarPedidoWindow extends SimpleWindow<EditarPedidoAppModel>{
	
	
	new(DominoApplication application) {
		super(application, new EditarPedidoAppModel)
	//	modelObject.refresh
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Domino Pizza"

		
		super.createMainTemplate(mainPanel)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val panelEstado = new Panel(mainPanel)
		panelEstado.layout = new ColumnLayout(2)
		
		new Label(panelEstado).text = "Estado"
		
		new Selector(panelEstado) => [
            value <=> "ingredienteSeleccionado"
            
            val bindingItems = items <=> "estados"
     		bindingItems.adapter = new PropertyAdapter(typeof(Estado), "nombre")
            width = 220
            height = 220
		]	
		
		val tablaConBotonera = new Panel(mainPanel)
		tablaConBotonera.layout = new HorizontalLayout()
		createResultsGrid(tablaConBotonera)
		val botonera = new Panel(tablaConBotonera)
		botonera.layout = new VerticalLayout()
		crearBotonera(botonera)
		aclaracionesPanel(mainPanel)
		datosCliente(mainPanel)
		
	}
	
	def crearBotonera(Panel panel) {
		new Button(panel) => [
			caption = "Agregar"
			onClick([| ])	
		]

		new Button(panel) => [
			caption = "Editar"
			onClick([| ])
		]	
		new Button(panel) => [
			caption = "Eliminar"
			onClick([| ])	
		]

	}
	
	
	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<Plato>(mainPanel, typeof(Plato)) => [
			items <=> "platos"
			value <=> "platoSeleccionado"
			numberVisibleRows = 12
		]
		
		new Column<Plato>(table) => [
			title = "Nombre"
			fixedSize = 300
			bindContentsToProperty("pizzaBase.nombre")
		]

		new Column<Plato>(table) => [
			title = "Tamaño"
			fixedSize = 200
			alignRight
			bindContentsToProperty("tamanio")
		]
		
		new Column<Plato>(table) => [
			title = "Precio"
			fixedSize = 200
			alignRight
			bindContentsToProperty("precio")
		]
	}
	
	def aclaracionesPanel(Panel panel){
		new Label(panel).text = "Aclaraciones"
		new TextBox(panel) => [
		    value <=> "aclaraciones"
		    width = 800 
		]
		
	}
	def datosCliente(Panel panel){
		val columnas = new Panel(panel)
		columnas.layout = new ColumnLayout(2) 
		
		new Label(columnas).text = "Nombre: "

		new Label(columnas) => [
		    value <=> "cliente.nombre"
		]
		new Label(columnas).text = "Costo de envío: "

		new Label(columnas) => [
		    value <=> "formaDeEnvio.costoEnvio"
		]
		new Label(columnas).text = "Monto total: "

		new Label(columnas) => [
		    value <=> "monto"
		]
		new Label(columnas).text = "Fecha y hora: "

		new Label(columnas) => [
		    value <=> "fecha" // y hora
		]
		
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick([| ])	
		]

		new Button(actionsPanel) => [
			caption = "Cancelar"
			onClick([| ])
		]	
		
	}
	
	
}