// generated by codegen/codegen.py
import codeql.swift.elements.expr.Argument
import codeql.swift.elements.expr.Expr

class ApplyExprBase extends @apply_expr, Expr {
  Expr getFunction() {
    exists(Expr x |
      apply_exprs(this, x) and
      result = x.resolve()
    )
  }

  Argument getArgument(int index) {
    exists(Argument x |
      apply_expr_arguments(this, index, x) and
      result = x.resolve()
    )
  }

  Argument getAnArgument() { result = getArgument(_) }

  int getNumberOfArguments() { result = count(getAnArgument()) }
}
