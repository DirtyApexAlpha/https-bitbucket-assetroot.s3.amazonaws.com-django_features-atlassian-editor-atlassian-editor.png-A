// generated by codegen/codegen.py
import codeql.swift.elements.expr.ApplyExpr

class PostfixUnaryExprBase extends @postfix_unary_expr, ApplyExpr {
  override string getAPrimaryQlClass() { result = "PostfixUnaryExpr" }
}
