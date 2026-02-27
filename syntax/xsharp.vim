if exists("b:current_syntax")
  finish
endif

syntax match kw_async         /\c\<\(async\|await\)\>/
syntax match kw_condition     /\c\<\(if\|else\|elseif\|endif\|switch\|case\|otherwise\)\>/
syntax match kw_exceptions    /\c\<\(throw\|try\|catch\|finally\)\>/
syntax match kw_function      /\c\<\(function\|method\)\>/
syntax match kw_inheritance   /\c\<\(inherits\|implements\|self\|super\)\>/
syntax match kw_loop          /\c\<\(while\|for\|foreach\|next\|loop\|upto\|in\)\>/
syntax match kw_modifiers     /\c\<\(public\|protected\|private\|internal\|static\|abstract\)\>/
syntax match kw_multirole     /\c\<\(begin\|end\|do\|using\)\>/
syntax match kw_namespace     /\c\<\(namespace\)\>/
syntax match kw_primitive     /\c\<\(void\|ptr\|logic\|byte\|sbyte\|word\|short\|dword\|int\|uint64\|int64\|char\|string\|object\)\>/
syntax match kw_property      /\c\<\(property\|auto\|get\|set\|init\)\>/
syntax match kw_reference     /\c\<\(ref\|out\)\>/
syntax match kw_return        /\c\<\(return\)\>/
syntax match kw_scope         /\c\<\(global\|local\)\>/
syntax match kw_type_assign   /\c\<\(as\)\>/
syntax match kw_type_define   /\c\<\(class\|interface\|enum\|struct\)\>/
syntax match kw_value         /\c\<\(null\|true\|false\)\>/
syntax match kw_var           /\c\<\(var\)\>/

highlight link kw_async       Keyword
highlight link kw_condition   Keyword
highlight link kw_exceptions  Keyword
highlight link kw_function    Keyword
highlight link kw_inheritance Keyword
highlight link kw_loop        Keyword
highlight link kw_modifiers   Keyword
highlight link kw_multirole   Keyword
highlight link kw_namespace   Keyword
highlight link kw_primitive   Keyword
highlight link kw_property    Keyword
highlight link kw_reference   Keyword
highlight link kw_return      Keyword
highlight link kw_scope       Keyword
highlight link kw_type_assign Keyword
highlight link kw_type_define Keyword
highlight link kw_value       Keyword
highlight link kw_var         Keyword

syntax region str             start=/"/ end=/"/ skip=/\\"/
syntax region str_inter       start=/i"/ end=/"/ skip=/\\"/
syntax region char            start=/'/ end=/'/ skip=/\\'/
syntax match num              "\<\d\+\(u\=l\=\|lu\|f\)\>"

highlight link str            String
highlight link str_inter      String
highlight link char           String
highlight link num            Number

syntax match comm_doc         /\/\/\//
syntax match comm_line        /\/\/.*/
syntax region comm_block      start=/\/\*/ end=/\*\//

highlight link comm_line      Comment
highlight link comm_doc       Comment
highlight link comm_block     Comment

let b:current_syntax = "xsharp"
