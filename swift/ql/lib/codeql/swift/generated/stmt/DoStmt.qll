// generated by codegen/codegen.py
import codeql.swift.elements.stmt.BraceStmt
import codeql.swift.elements.stmt.LabeledStmt

class DoStmtBase extends @do_stmt, LabeledStmt {
  override string getAPrimaryQlClass() { result = "DoStmt" }

  BraceStmt getBody() {
    exists(BraceStmt x |
      do_stmts(this, x) and
      result = x.resolve()
    )
  }
}
