(prelude-require-packages '(
                            ag
                            auto-complete
                            js2-refactor
                            js3-mode
                            flymake-jshint
                            jss
                            tern
                            tern-auto-complete
                            web-beautify
                            yasnippet
                            multi-term
                            ))

(require 'server)
(unless (server-running-p)
  (server-start))

;; color ag results
(setq ag-highlight-search t)

;; javascript indent level
(setq js-indent-level 2)

;; color long lines
(setq whitespace-line-column 100)

;; auto-add newlines at end of buffer
(setq next-line-add-newlines t)

;; line numbers on
(global-linum-mode t)

;; flycheck with jscs
 (flycheck-def-config-file-var flycheck-jscs javascript-jscs "~/git/seurat/SEURAT-JavaScript/.jscs.json"
  :safe #'stringp)

(flycheck-define-checker javascript-jscs
  "A JavaScript code style checker.

See URL `https://github.com/mdevils/node-jscs'."
  :command ("jscs" "--reporter" "checkstyle"
            (config-file "--config" flycheck-jscs)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (js-mode js2-mode js3-mode)
  :next-checkers (javascript-jshint))

(add-to-list 'flycheck-checkers 'javascript-jscs)

(custom-set-faces
 '(flycheck-error ((((class color)) (:underline "Red"))))
 '(flycheck-warning ((((class color)) (:underline "Orange")))))

;; jshint
(add-hook 'js-mode-hook 'flymake-mode)
(setq jshint-configuration-path "~/.jshint.json")

;; autocomplete on
(ac-config-default)
(global-auto-complete-mode t)

;;yasnippet on
(yas-global-mode 1)

;; Closure-snippets
(let ((closure-snippets "~/.emacs.d/closure-snippets/emacs"))
    (add-to-list 'load-path closure-snippets)
    (yas/load-directory closure-snippets))
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt yas/completing-prompt yas/x-prompt yas/no-prompt))

;; Prettier
(let ((prettier-js "~/.emacs.d/prettier/editors/emacs"))
  (add-to-list 'load-path prettier-js)
  (require 'prettier-js)
  (add-hook 'js-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'prettier-before-save))))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(setq js2-basic-offset 2)
(setq js2-bounce-indent-p t)
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))
(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js-mode-hook 'tern-mode)

;; keybindings
;; Invoke M-x without alt key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
;; backward kill word
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

;; cleanup whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; zsh in multi-term
(setq multi-term-program "/usr/local/bin/zsh")



;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)
