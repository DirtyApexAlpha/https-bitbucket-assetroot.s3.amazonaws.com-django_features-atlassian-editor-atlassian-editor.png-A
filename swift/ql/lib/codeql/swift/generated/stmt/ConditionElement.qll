// generated by codegen/codegen.py
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.Locatable
import codeql.swift.elements.pattern.Pattern

class ConditionElementBase extends @condition_element, Locatable {
  override string getAPrimaryQlClass() { result = "ConditionElement" }

  Expr getBoolean() {
    exists(Expr x |
      condition_element_booleans(this, x) and
      result = x.resolve()
    )
  }

  predicate hasBoolean() { exists(getBoolean()) }

  Pattern getPattern() {
    exists(Pattern x |
      condition_element_patterns(this, x) and
      result = x.resolve()
    )
  }

  predicate hasPattern() { exists(getPattern()) }

  Expr getInitializer() {
    exists(Expr x |
      condition_element_initializers(this, x) and
      result = x.resolve()
    )
  }

  predicate hasInitializer() { exists(getInitializer()) }
}
