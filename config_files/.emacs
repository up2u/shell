(put 'upcase-region 'disabled nil)

;; user name and email
(setq user-full-name "Mao Lijie")
(setq user-mail-address "maolijie@gmail.com")

;; default open directory
(setq default-directory "/opt/work")

;; yank to cousor but not mouse point
(setq mouse-yank-at-point t)

;; kill-ring num
(setq kill-ring-max 200)

;; scroll
(setq scroll-margin 3)

;; text mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; add line at end of file
(setq require-final-newline t)

;; cursor and mouse point avoidance
(setq mouse-avoidance-mode 'animate)

;; C-K delete line at the same time
(setq-default kill-whole-line t)

;; show buffer name
(setq frame-title-format "emacs@%b")

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
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq c-basic-offset 4)
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
