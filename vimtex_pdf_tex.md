To add pdf_tex files to vimtex's file autocomplete, add

    " Add .pdf_tex files
      call extend(self.candidates,
            \ globpath(b:vimtex.root, '**/*.pdf_tex', 0, 1))

to the function `s:completer_inc.complete` in `vimtex/autoload/vimtex/complete.vim`


