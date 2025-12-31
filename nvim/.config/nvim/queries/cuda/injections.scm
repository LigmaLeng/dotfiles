; extends
; Matches a node representing a string and injects the same language parser
(declaration
  (qualified_identifier
    scope: (namespace_identifier) @_scope (#eq? @_scope "ligma")
    name: (qualified_identifier) @_name (#eq? @_name "rtc::program")
  )
  (init_declarator
    (initializer_list
      (raw_string_literal
         (raw_string_content) @injection.content
         (#set! injection.combined)
         (#set! injection.self)
      )
    )
  )
)
