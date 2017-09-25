package ar.edu.unq.uis.domino.appmodel

import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.repo.Repositories
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class IngredienteTablaEditableAppModel extends TablaEditableAppModel<Ingrediente> {
	
	override getRepository() {
		Repositories.getIngredientes()
	}
	
	
}