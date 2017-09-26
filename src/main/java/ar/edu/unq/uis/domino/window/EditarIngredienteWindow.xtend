package ar.edu.unq.uis.domino.window

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.uis.domino.appmodel.PizzaAppModel
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
import org.uqbar.arena.aop.windows.TransactionalDialog
import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.appmodel.IngredienteAppModel

class EditarIngredienteWindow extends TransactionalDialog<IngredienteAppModel>{
	
	new(WindowOwner owner, IngredienteAppModel model) {
		super(owner, model)
	}
	
	new(WindowOwner owner, Ingrediente ingrediente) {
		super(owner, createViewModel(ingrediente))
		title = defaultTitle()
	}
	
	static def createViewModel(Ingrediente ingrediente){
		return new IngredienteAppModel(ingrediente)
	}
	
	def defaultTitle() {
		"Editar ingrediente"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)
		new Label(form).text = "Nombre"
		
		new TextBox(form) => [
			value <=> "elemento.nombre"
			width = 200	
		]
		
		new Label(form).text = "Precio"
			
		new NumericField(form) => [
			value <=> "elemento.precio"
			width = 100
		]	

	}
	
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Ingrediente"
		super.createMainTemplate(mainPanel)
	}
	
	override def addActions(Panel actions){
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|
				this.accept
			]
			setAsDefault
			disableOnError	
		]

		new Button(actions) => [
			caption = "Cancelar"	
			onClick [|
				this.cancel
			]
		]
	}
	
	override executeTask() {
		modelObject.guardar
		super.executeTask()
	}
}