package ar.edu.unq.uis.domino.adapters

import org.apache.commons.lang.StringUtils
import java.util.Date
import org.uqbar.commons.model.exceptions.UserException
import java.text.SimpleDateFormat
import java.text.ParseException
import org.uqbar.arena.bindings.ValueTransformer
import org.apache.commons.collections15.Transformer

class FechaAdapter implements ValueTransformer<Date, String>, Transformer<Date, String>{
	
	def pattern(){
		return "dd/MM/yyyy"
	}

	override Date viewToModel(String valueFromView) {
		try {
			if (StringUtils.isBlank(valueFromView)){
				return null
			} else {
				return new SimpleDateFormat(pattern).parse(valueFromView)
			}
		}
		catch (ParseException e) {
			throw new UserException("Debe ingresar una fecha en formato: " + this.pattern);
		}
	}

	override String modelToView(Date valueFromModel) {
		if (valueFromModel == null) {
			return null;
		}
		return new SimpleDateFormat(pattern).format(valueFromModel);
	}
	
	override Class<Date> getModelType() {
		typeof(Date)
	}

	override Class<String> getViewType() {
		typeof(String)
	}
	
	override transform(Date input) {
		modelToView(input)
	}
	
}