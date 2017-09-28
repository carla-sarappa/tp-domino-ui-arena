package ar.edu.unq.uis.domino.adapters

import org.apache.commons.lang.StringUtils
import java.util.Date
import org.uqbar.commons.model.exceptions.UserException
import java.text.SimpleDateFormat
import org.uqbar.arena.bindings.ValueTransformer
import java.text.ParseException
import org.apache.commons.collections15.Transformer

public class MoneyAdapter implements ValueTransformer<Double, String>, Transformer<Double, String> {
	
	override getModelType() {
		typeof(Double)
	}
	
	override getViewType() {
		typeof(String)
	}
	
	override modelToView(Double valueFromModel) {
		(" $ ").concat(valueFromModel.toString)
	}
	
	override viewToModel(String valueFromView) {
		return 999999.9
	}
	
	override transform(Double input) {
		modelToView(input)
	}
	
}
	