(put 'upcase-region 'disabled nil)

;; user name and email
;;(setq user-full-name "name")
;;(setq user-mail-address "name@gmail.com")

;; default open directory
(setq default-directory "/opt/work")

;; set identation
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

;; Don't want any backup files
(setq make-backup-files nil)
;; Don't want any auto saving
(setq auto-save-default nil)

;; cscope - i don't use etags any more
(require 'xcscope)
(setq cscope-do-not-update-database t)

;; iswitchb
(iswitchb-mode 1)
;;prevent certain buffers from showing up
;;(setq iswitchb-buffer-ignore '("^ " "*Buffer"))
;;prevent switching to another frame
(setq iswitchb-default-method 'samewindow)

;; not generate temp file #filename#
(setq auto-save-default nil)

;; show which function of current cursor, not work ?
(require 'which-func)
(which-func-mode 1)

;; M-x give optinal command
(icomplete-mode 1)

;; gud mode use cursor show variable value ? seem not work ?
(gud-tooltip-mode)

;; kill buffer of gud
(add-hook 'gdb-mode-hook 'kill-buffer-when-shell-command-exit)

;; kill buffer of shell term
(add-hook 'term-mode-hook 'kill-buffer-when-shell-command-exit)

;; make it easy on eyes first ...
(set-foreground-color "Wheat")   ;; look ok
(set-background-color "DarkSlateGray")  ;; look ok
(set-cursor-color "Yellow")  ;; Yellow looks good
(set-mouse-color "Orchid")   ;; so so

;; where my elisp stuff is 
;;(setq load-path (cons "/path" load-path))

;; none of these plese
(scroll-bar-mode nil)
(tool-bar-mode 0)
;;(menu-bar-mode nil)

;; way better buffer-switching
;; ido - interactively do things with buffers and files
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-extensions t)
(ido-mode t)

;;show date and time in mode-line
;;(setq display-time-day-and-date t)
;;(display-time)


;; no need startup screen
(setq inhibit-startup-message t)

;; yank to cursor but not mouse point
(setq mouse-yank-at-point t)

;; kill-ring num
(setq kill-ring-max 200)

;; scroll
(setq scroll-margin 2)

;; cursor to be vertical bar, not a block
(setq-default cursor-type 'bar)

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
(setq frame-title-format "%b@emacs")

;; binding
(global-set-key [f1] 'goto-line)
;;(global-set-key [f2] 'other-window)
(global-set-key "\M-q" 'other-window)

;; line and column num
(global-linum-mode t)
(setq column-number-mode t)
(setq line-number-mode t)

;; highlight
(global-font-lock-mode 't)
;; highlight current line
(global-hl-line-mode 1)

;; parenthese match
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; copy & paste with outside
(setq x-select-enable-clipboard t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ido-ignore-files (quote ("\\.out" "\\.a" "\\.o" "\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
