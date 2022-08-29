// generated by codegen/codegen.py
import codeql.swift.elements.decl.AbstractStorageDecl
import codeql.swift.elements.decl.GenericContext
import codeql.swift.elements.decl.ParamDecl
import codeql.swift.elements.type.Type

class SubscriptDeclBase extends @subscript_decl, AbstractStorageDecl, GenericContext {
  override string getAPrimaryQlClass() { result = "SubscriptDecl" }

  ParamDecl getParam(int index) {
    exists(ParamDecl x |
      subscript_decl_params(this, index, x) and
      result = x.resolve()
    )
  }

  ParamDecl getAParam() { result = getParam(_) }

  int getNumberOfParams() { result = count(getAParam()) }

  Type getElementType() {
    exists(Type x |
      subscript_decls(this, x) and
      result = x.resolve()
    )
  }
}
