;; add load path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/util")
(add-to-list 'load-path "~/.emacs.d/lisp/cscope")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/lisp/global")
(add-to-list 'load-path "~/.emacs.d/lisp/rect-mark")
(add-to-list 'load-path "~/.emacs.d/lisp/tabbar")
(add-to-list 'load-path "~/.emacs.d/lisp/speedbar")
(add-to-list 'load-path "~/.emacs.d/lisp/cedet-1.1/common/")
(add-to-list 'load-path "~/.emacs.d/lisp/cedet-1.1/semantic/")
;(add-to-list 'load-path "~/.emacs.d/lisp/ecb-newcedet/")
(add-to-list 'load-path "~/.emacs.d/lisp/codestyle/")
(add-to-list 'load-path "~/.emacs.d/lisp/org-7.9.1/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/org-7.9.1/contrib/lisp")
;(add-to-list 'load-path "~/.emacs.d/lisp/slime/")

;;customize defined variable to storing path
(defconst my-emacs-path "~/.emacs.d/")
(defconst my-emacs-lisps-path (concat my-emacs-path "lisp"))

;; default open directory
(setq default-directory "/work/")
;; frame title
(setq frame-title-format '("%m @ "(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
;; want two windows at startup
(split-window-horizontally)

;; org version org-7.9.1
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; key swap
(require 'key-swap)

;; http://ted.is-programmer.com/tag/emacs
;; Moving cursor down at bottom scrolls only a single line, not half page ??
;; + http://www.emacswiki.org/emacs/SmoothScrolling
;(setq scroll-step 1)
;(setq scroll-conservatively 5)
;; scroll
;(setq scroll-margin 2)
;; will delete "hungrily" in C mode! Use it to see what it does -- very useful.
(setq c-hungry-delete-key t)

;; binding for previous/next-buffer
(global-set-key [f2]  'previous-buffer)
(global-set-key [f1]  'next-buffer)
(global-set-key [f12] 'kill-buffer)

;; auto revert buffers
(global-auto-revert-mode t)
;; not output backtrace buffer when warning or errors
;(setq stack-trace-on-error t) ;; not needed

;;;;;  ;; sr-speedbar
;;;;;  (require 'sr-speedbar)
;;;;;  (require 'speedbar-extension)
;;;;;  (setq sr-speedbar-right-side nil)
;;;;;  ;(setq sr-speedbar-width 25)
;;;;;  ;; Show all files
;;;;;  ;(setq speedbar-show-unknown-files t)
;;;;;  ;; fix speedbar in left, and set auto raise mode
;;;;;  ;;(add-hook
;;;;;  ;;'speedbar-mode-hook
;;;;;  ;;(lambda ()
;;;;;  ;;(auto-raise-mode 1)
;;;;;  ;;(add-to-list 'speedbar-frame-parameters '(top . 30))
;;;;;  ;;(add-to-list 'speedbar-frame-parameters '(left . 0))))
;;;;;
;;;;;  ;; inhibit tags grouping and sorting
;;;;;  (setq speedbar-tag-hierarchy-method
;;;;;  '(speedbar-simple-group-tag-hierarchy)
;;;;;  )
;;;;;  ;;;;(defun speedbar-expand-all-lines ()
;;;;;  ;;;;  "Expand all items in the speedbar buffer.
;;;;;  ;;;; But be careful: this opens all the files to parse them."
;;;;;  ;;;;  (interactive)
;;;;;  ;;;;  (goto-char (point-min))
;;;;;  ;;;;  (while (not (eobp))
;;;;;  ;;;;    (forward-line)
;;;;;  ;;;;    (speedbar-expand-line)))
;;;;;
;;;;;  ;;(defcustom speedbar-tag-hierarchy-method
;;;;;  ;;'(speedbar-prefix-group-tag-hierarchy
;;;;;  ;;speedbar-trim-words-tag-hierarchy))
;;;;;
;;;;;  ;; start speedbar if we're using a window system
;;;;;  (when window-system
;;;;;    (sr-speedbar-open))

;; google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; TAB width for makefile
(setq-default tab-width 4)

;; ctypes
(require 'ctypes)
(ctypes-auto-parse-mode 1)

;; for assembly language
(require 'gas-mode)

;; tabbar + tabbar-ruler
(require 'tabbar)
;; tabbar-ruler, make tabbar look pretty
(require 'tabbar-ruler)
(tabbar-mode t)
(define-prefix-command 'lwindow-map)
;(global-set-key (kbd "<M-left>")  'tabbar-backward) ;; will cross group ?
;(global-set-key (kbd "<M-right>") 'tabbar-forward)
(global-set-key (kbd "<C-left>")  'tabbar-backward-tab) ;;will not cross group ?
(global-set-key (kbd "<C-right>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-up>")    'tabbar-backward-group)
(global-set-key (kbd "<C-down>")  'tabbar-forward-group)

;; rectangle
(require 'rect-mark)
(global-set-key (kbd "C-@") 'rm-set-mark)
;;  (global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
;;  (global-set-key (kbd "C-x r C-w") 'rm-kill-region)
;;  (global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)

;; show files with same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator ":")

;; cscope - i don't use etags any more
(require 'xcscope)
(setq cscope-do-not-update-database t)
;; cscope key binding
(global-set-key [f4] 'cscope-find-functions-calling-this-function)
(global-set-key [(shift f4)] 'cscope-find-called-functions)
(global-set-key [f5] 'cscope-find-this-symbol)
(global-set-key [f6] 'cscope-find-this-text-string)
(global-set-key [f7] 'cscope-find-global-definition)
(global-set-key [f8] 'cscope-find-this-file)

;; show which function of current cursor
(require 'which-func)
(which-func-mode 1)

;; auto-complete-settings
(require 'auto-complete-settings)
(ac-config-default)

;; minibuf
(setq enable-recursive-minibuffers t)

;; selected region to upcase/downcase
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; narrowing
;;(put 'narrow-to-region 'disabled nil)
;; goal column (key: C-x C-n)
(put 'set-goal-column 'disabled nil)

;;
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; vertical motion starting at end of line keeps to ends of lines
(setq track-eol t)

;; user name and email
;;(setq user-full-name "name")
;;(setq user-mail-address "name@gmail.com")

;; default 70
;(setq-default fill-column 80)

;; Don't want any backup files
(setq make-backup-files nil)
;; Don't want any auto saving
;; not generate temp file #filename#
(setq auto-save-default nil)

;; iswitchb
(iswitchb-mode 1)
;;prevent certain buffers from showing up
;;(setq iswitchb-buffer-ignore '("^ " "*Buffer"))
;;prevent switching to another frame
(setq iswitchb-default-method 'samewindow)

;; M-x give optinal command
(icomplete-mode 1)

;; gud mode use cursor show variable value
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
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; way better buffer-switching
;; ido - interactively do things with buffers and files
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-extensions t)

;; ibuffer
(require 'ibuffer)
(global-set-key [(control f2)] 'ibuffer)

;; browse-kill-ring
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
;; kill-ring num
(setq kill-ring-max 200)

;;show date and time in mode-line
;;(setq display-time-day-and-date t)
;;(display-time)

;; no need startup screen
(setq inhibit-startup-message t)

;; yank to cursor but not mouse point
(setq mouse-yank-at-point t)

;; Emacs才是世界上最强大的IDE － 智能的改变光标形状
;; http://emacser.com/cursor-change.htm
(require 'cursor-change)
(cursor-change-mode 1)

;; default: text mode + auto-fill-mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; turn on auto-fill-mode only for code comments
;(setq comment-auto-fill-only-comments t)

;; add line at end of file
(setq require-final-newline t)

;; cursor and mouse point avoidance
(setq mouse-avoidance-mode 'animate)

;; C-K delete line at the same time
(setq-default kill-whole-line t)

;; other-window
(global-set-key "\M-q" 'other-window)

;; line and column num
(global-linum-mode t)
(setq column-number-mode t)
(setq line-number-mode t)

;; highlight
(global-font-lock-mode 't)
;; highlight current line
(global-hl-line-mode 1)
;; 高亮过于长的行, 暂不要打开这个功能
;(require 'highlight-beyond-fill-column)

;; parenthese match
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; copy & paste with outside
(setq x-select-enable-clipboard t)

;; Warning:cedet-called-interactively-p called with 0 arguments, but requires 1
(setq byte-compile-warnings nil)
(require 'cedet)
;(require 'semantic)
;(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
;(global-srecode-minor-mode 1)  ;; need to learn more.
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
;; from http://emacser.com/cedet.htm
;;;;;(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
;;;;;(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
;;;;;(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
;;;;;(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)

;; manual fresh
(global-set-key [(control f1)] 'senator-force-refresh)

;; hide and show macro #ifdef #endif
;(setq hide-ifdef-mode t)

;; highlight-symbol for highlight variable
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)  ;; go to next symbol
(global-set-key [(shift f3)] 'highlight-symbol-prev) ;; go prev
;(global-set-key [(meta f3)] 'highlight-symbol-prev) ;; comment for don't use meta key
;; auto-highlight-symbol
(require 'auto-highlight-symbol-config)

;;
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'c-mode-hook
          '(lambda ()
             (gtags-mode t)))
;; 2 useful binding, but how use its own keymap ???
(global-set-key (kbd "M-e") 'gtags-find-tag)
(global-set-key (kbd "M-r") 'gtags-pop-stack)

;; C-x j open the directory of current buffer
(global-set-key (kbd "C-x j")
                (lambda ()
                  (interactive)
                  (if (buffer-file-name)
                      (dired default-directory))))

;;;;;   ;; ECB
;;;;;   (require 'ecb)
;;;;;   ;(require 'ecb-autoloads)
;;;;;   (setq ecb-tip-of-the-day nil) ;; not work ??
;;;;;   (setq ecb-tree-navigation-by-arrow nil) ;; not use arrow key (left right up down)
;;;;;
;;;;;   ;; myself layout of ecb and scope
;;;;;   (ecb-layout-define "my-cscope-layout" left nil
;;;;;   (ecb-set-sources-buffer)
;;;;;   (ecb-split-ver 0.30 t)
;;;;;   (other-window 1)
;;;;;   (ecb-set-methods-buffer)
;;;;;   ;(ecb-split-ver 0.45 t)
;;;;;   ;(other-window 1)
;;;;;   ;(ecb-set-cscope-buffer)
;;;;;   )
;;;;;   ;(defecb-window-dedicator ecb-set-cscope-buffer " *ECB cscope-buf*"
;;;;;   ;(switch-to-buffer "*cscope*"))
;;;;;
;;;;;   (setq ecb-layout-name "my-cscope-layout")
;;;;;
;;;;;   ;; Disable buckets so that history buffer can display more entries
;;;;;   (setq ecb-history-make-buckets 'never)
;;;;;
;;;;;   ;; start ECB
;;;;;   (ecb-activate)

;; code folding
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(global-set-key [f11] 'hs-hide-all)
(global-set-key [(shift f11)]  'hs-show-all)
(global-set-key [(control f11)] 'hs-toggle-hiding)

;; SLIME: The Superior Lisp Interaction Mode for Emacs
;(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
;(require 'slime)
;(slime-setup '(slime-fancy))

;;start server
(server-start)

;; AUCTeX
;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)
;(mapc (lambda (mode)
;      (add-hook 'LaTeX-mode-hook mode))
;      (list 'auto-fill-mode
;            'LaTeX-math-mode
;            'turn-on-reftex
;            'linum-mode))

;; undo
;(require 'undo-tree)   ;不好用??
;(global-undo-tree-mode)

;; go-to-char http://www.emacswiki.org/emacs/iy-go-to-char.el
(require 'iy-go-to-char)
(global-set-key (kbd "C-;") 'iy-go-to-char)
;; not used key binding
;(global-set-key (kbd "C-c f") 'iy-go-to-char)
;(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
;(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
;(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

;; transposing text: M-t transpose-words
(global-set-key  (kbd "C-t") 'transpose-sexps)

;; load my util
(require 'myutil)

;; load customize setting
(require 'customize-setting)
