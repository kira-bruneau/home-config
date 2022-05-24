(use-package js-mode
  :mode "\\.js\\'"
  :init
  (with-eval-after-load 'flycheck
    (setq flycheck-javascript-eslint-executable "eslint_c")
    (add-hook
     'lsp-diagnostics-mode-hook
     (lambda ()
      (flycheck-add-next-checker 'lsp 'javascript-eslint))))

  (with-eval-after-load 'lsp-mode
    (delete 'lsp-eslint lsp-client-packages))

  (with-eval-after-load 'apheleia
    (add-to-list 'apheleia-formatters '(eslint . ("eslint_c" "--stdin" "--fix-to-stdout" "--stdin-filename" filepath))))

  (with-eval-after-load 'restclient
    (add-to-list 'restclient-content-type-modes '("application/js" . js-mode))))
