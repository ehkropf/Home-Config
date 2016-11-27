" indentation
set sw=2
" wrap lines at word
set linebreak
" \ref{fig: helper
set iskeyword+=:
"
call IMAP('`w', '\omega', 'tex')
"
"Now set in vimrc.
"let g:tex_flavor='latex'
"
let g:Tex_TEXINPUTS='~/share/latex'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_FoldedEnvironments='cases,dcases,verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage,multline,theorem,proof,lemma,definition,example,problem,remark,frontmatter'
let g:Tex_FoldedSections='part,chapter,appendix,section,%%fakesection,subsection,subsubsection,paragraph,logyear,logmonth,logday'
"let g:Tex_IgnoredWarnings.="\nText page %.%# contains only"
let g:Tex_IgnoredWarnings="Underfull\nOverfull\nspecifier changed to\nYou have requested\nMissing number, treated as zero.\nThere were undefined references\nCitation %.%# undefined\nText page %.%# contains only"
let g:Tex_IgnoreLevel=8
"
" fix broken view rule (I'll forget this when I update vim-latex)
let Tex_ViewRuleComplete_pdf='/usr/bin/open -a Preview $*.pdf'
" no synctex for pdflatex
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode -file-line-error-style $*'
