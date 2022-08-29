// generated by codegen/codegen.py
import codeql.swift.elements.pattern.Pattern

class TuplePatternBase extends @tuple_pattern, Pattern {
  override string getAPrimaryQlClass() { result = "TuplePattern" }

  Pattern getElement(int index) {
    exists(Pattern x |
      tuple_pattern_elements(this, index, x) and
      result = x.resolve()
    )
  }

  Pattern getAnElement() { result = getElement(_) }

  int getNumberOfElements() { result = count(getAnElement()) }
}
