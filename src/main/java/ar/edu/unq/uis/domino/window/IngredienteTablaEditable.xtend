package ar.edu.unq.uis.domino.window
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import ar.edu.unq.uis.domino.appmodel.TablaEditableAppModel
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.repo.Repositories
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.uis.domino.appmodel.IngredienteTablaEditableAppModel
import ar.edu.unq.uis.domino.model.Pizza

@Accessors
@TransactionalAndObservable
class IngredienteTablaEditable extends TablaEditable<Ingrediente>{
	
	new(Panel panel, IngredienteTablaEditableAppModel model, MenuWindow window) {
		super(panel, model, window)
	}
	
	def getRepository() {
		Repositories.getIngredientes()
	
	}
	
	override getTypeOfTableElement() {
		return typeof(Ingrediente)
	}
	
	override crearVentanaEdicion() {
		new EditarIngredienteWindow(windowOwner, tablaEditableAppModel.elementoSeleccionado)
	}
	
	override crearVentanaCreacion() {
		new EditarIngredienteWindow(windowOwner, new Ingrediente())
	}
	
	
}