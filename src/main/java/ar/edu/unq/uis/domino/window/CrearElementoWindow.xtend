package ar.edu.unq.uis.domino.window

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.uis.domino.viewmodel.PizzaViewModel
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.model.Distribucion
import org.uqbar.arena.widgets.Button
import ar.edu.unq.uis.domino.model.IngredienteDistribuido
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.bindings.NotNullObservable

class CrearElementoWindow extends Dialog<PizzaViewModel>{
	
	new(WindowOwner owner, PizzaViewModel model) {
		super(owner, model)
	}
	
	new(MenuWindow window) {
		super(window, new PizzaViewModel)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)
		new Label(form).text = "Nombre"
		
		new TextBox(form) => [
			value <=> "pizza.nombre"
			width = 200	
		]
		
		new Label(form).text = "Precio"
			
		new NumericField(form) => [
			value <=> "pizza.precioBase"
			width = 100
		]	
		crearPanelListas(mainPanel)
		crearTablaIngredientesAgregados(mainPanel)
	}
	
	def crearPanelListas(Panel mainPanel){
		val listas = new Panel(mainPanel).layout = new HorizontalLayout
		
		new Selector(listas) => [
            value <=> "ingredienteSeleccionado"
            
            val bindingItems = items <=> "ingredientes"
     		bindingItems.adapter = new PropertyAdapter(typeof(Ingrediente), "nombre")
            width = 220
            height = 220
		]	
		
		new Selector(listas) => [
            value <=> "distribucionSeleccionada"
            val bindingItems = items <=> "distribuciones"
     		bindingItems.adapter = new PropertyAdapter(typeof(Distribucion), "nombre")
            width = 220
            height = 220
		]	
		
		new Button(listas) => [
			caption = "Agregar ingrediente a la pizza"
			onClick([|modelObject.agregarIngrediente])
			//visible <=> "puedeAgregarIngrediente"
			bindVisible(new NotNullObservable("ingredienteSeleccionado"))
			//bindVisible(new NotNullObservable("distribucionSeleccionada"))
			disableOnError
		]
	}
	
	
	
	def protected crearTablaIngredientesAgregados(Panel mainPanel) {
		val table = new Table<IngredienteDistribuido>(mainPanel, typeof(IngredienteDistribuido)) => [
			items <=> "pizza.ingredientes"
			//value <=> "seleccionado"
			numberVisibleRows = 8
		]
		this.describeResultsGrid(table)
	}


	def void describeResultsGrid(Table<IngredienteDistribuido> table) {
	
		new Column<IngredienteDistribuido>(table) => [
			title = "Ingrediente"
			fixedSize = 200
			bindContentsToProperty("ingrediente.nombre")
		]

		new Column<IngredienteDistribuido>(table) => [
			title = "Distribucion"
			fixedSize = 300
			alignRight
			bindContentsToProperty("distribucion.nombre")
		]
	}
	
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Pizza"
		super.createMainTemplate(mainPanel)
	}
	
}