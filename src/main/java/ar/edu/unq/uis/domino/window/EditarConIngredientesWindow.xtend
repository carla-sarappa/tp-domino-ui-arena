package ar.edu.unq.uis.domino.window

import ar.edu.unq.uis.domino.appmodel.PizzaAppModel
import ar.edu.unq.uis.domino.appmodel.ElementoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.model.Distribucion
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.uis.domino.model.IngredienteDistribuido
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.tables.Column
import ar.edu.unq.uis.domino.appmodel.ConIngredienteAppModel

abstract class EditarConIngredientesWindow<T extends ConIngredienteAppModel> extends EditarElementoWindow<T>{
	
	new(WindowOwner owner, T model) {
		super(owner, model)
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
			onClick([| onAgregarIngredienteClick])
			enabled <=> "puedeAgregarIngrediente"
//			bindVisible(new NotNullObservable("ingredienteSeleccionado"))
			//bindVisible(new NotNullObservable("distribucionSeleccionada"))
			disableOnError
		]
		
		new Button(listas) => [
			caption = "Quitar ingrediente"
			onClick([| modelObject.eliminarSeleccionado])
//			bindVisible(new NotNullObservable("seleccionado"))
			enabled <=> "puedeQuitarIngrediente"
			disableOnError
			
		]
		
		
	}
	
	def abstract void onAgregarIngredienteClick()
	
	def protected crearTablaIngredientesAgregados(Panel mainPanel) {
		val table = new Table<IngredienteDistribuido>(mainPanel, typeof(IngredienteDistribuido)) => [
			items <=> "elemento.ingredientes"
			value <=> "seleccionado"
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
	
	
}