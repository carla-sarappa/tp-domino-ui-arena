package ar.edu.unq.uis.domino.appmodel

import ar.edu.unq.uis.domino.model.Ingrediente
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.domino.repo.Repositories
import java.util.List

@Accessors
@TransactionalAndObservable
class IngredienteAppModel extends ElementoAppModel<Ingrediente> {
	
	new(Ingrediente ingrediente){
		this.elemento = ingrediente		
	}
	
	
	override getRepository() {
		Repositories.getIngredientes()
	}
	
	
}