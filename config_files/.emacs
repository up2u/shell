(put 'upcase-region 'disabled nil)

;; binding
(global-set-key [f5] 'goto-line)
(global-set-key [f6] 'other-window)

;; line and column num
(global-linum-mode t)
(setq column-number-mode t)
(setq line-number-mode t)

;; highlight
(global-font-lock-mode 't)
(global-hl-line-mode 1)

;; parenthese match
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; copy & paste with outside
(setq x-select-enable-clipboard t)

;; set ident
(setq c-basic-offset 4)
(setq indent-tabs-mode t)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())

;; C language setting
(add-hook 'c-mode-hook
          '(lambda ()
           (c-set-style "K&R")))

;; C++ language setting
(add-hook 'c++-mode-hook
          '(lambda ()
           (c-set-style "K&R")))
