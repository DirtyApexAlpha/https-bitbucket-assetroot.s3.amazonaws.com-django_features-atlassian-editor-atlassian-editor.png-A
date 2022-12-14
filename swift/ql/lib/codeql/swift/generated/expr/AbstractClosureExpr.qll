// generated by codegen/codegen.py
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.decl.ParamDecl

class AbstractClosureExprBase extends @abstract_closure_expr, Expr {
  ParamDecl getParam(int index) {
    exists(ParamDecl x |
      abstract_closure_expr_params(this, index, x) and
      result = x.resolve()
    )
  }

  ParamDecl getAParam() { result = getParam(_) }

  int getNumberOfParams() { result = count(getAParam()) }
}
