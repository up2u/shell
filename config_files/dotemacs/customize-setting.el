
;; user name and email
(setq user-full-name "maolijie")
(setq user-mail-address "maolijie@gmail.com")

;; customize setting
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(ecb-options-version "2.40")
 '(ido-ignore-files (quote ("\\.out" "\\.a" "\\.o" "\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./")))
 '(highlight-beyond-fill-column-in-modes (quote ("c-mode" "c++-mode")))
) ; custom-set-variables
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
) ; custom-set-faces

;; seems that after update tabbar & tabbar-ruler them don't work, so just comment them
;;comment: ;;from http://wwliu.is-programmer.com/posts/14728.html
;;comment: ;;;; 设置tabbar外观
;;comment: ;; 设置默认主题: 字体, 背景和前景颜色，大小
;;comment: (set-face-attribute 'tabbar-default nil
;;comment:                     :family "DejaVu Sans Mono"
;;comment:                     :background "gray80"
;;comment:                     :foreground "gray30"
;;comment:                     :height 0.8
;;comment:                     )
;;comment: ;; 设置左边按钮外观：外框框边大小和颜色
;;comment: (set-face-attribute 'tabbar-button nil
;;comment:                     :inherit 'tabbar-default
;;comment:                     :box '(:line-width 1 :color "gray30")
;;comment:                     )
;;comment: ;; 设置当前tab外观：颜色，字体，外框大小和颜色
;;comment: (set-face-attribute 'tabbar-selected nil
;;comment:                     :inherit 'tabbar-default
;;comment:                     :foreground "Black"
;;comment:                     :background "Yellow"
;;comment:                     :box '(:line-width 1 :color "DarkGoldenrod")
;;comment:                     ;; :overline "black"
;;comment:                     ;; :underline "black"
;;comment:                     :weight 'bold
;;comment:                     )
;;comment: ;; 设置非当前tab外观：外框大小和颜色
;;comment: (set-face-attribute 'tabbar-unselected nil
;;comment:                     :inherit 'tabbar-default
;;comment:                     :box '(:line-width 1 :color "gray70")
;;comment:                     )

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

;; default open directory
(setq default-directory "/work/")
;; frame title
(setq frame-title-format '("%m @ "(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
;; want two windows at startup
(split-window-horizontally)

;; http://ted.is-programmer.com/tag/emacs
;; Moving cursor down at bottom scrolls only a single line, not half page ??
;; + http://www.emacswiki.org/emacs/SmoothScrolling
;(setq scroll-step 1)
;(setq scroll-conservatively 5)
;; scroll
;(setq scroll-margin 2)
;; will delete "hungrily" in C mode! Use it to see what it does -- very useful.
(setq c-hungry-delete-key t)

;; TAB width
(setq-default tab-width 4)

;; minibuf
(setq enable-recursive-minibuffers t)

;; goal column (key: C-x C-n)
(put 'set-goal-column 'disabled nil)

;;----------------------------------------------------------------------------
;; Don't disable case-change functions
;;----------------------------------------------------------------------------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;----------------------------------------------------------------------------

;; Don't disable narrowing commands
;;----------------------------------------------------------------------------
;; narrowing
;;(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)


;;
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; vertical motion starting at end of line keeps to ends of lines
(setq track-eol t)

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

;; where my elisp stuff is
;;(setq load-path (cons "/path" load-path))

;; way better buffer-switching
;; ido - interactively do things with buffers and files
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-extensions t)

;; default: text mode + auto-fill-mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; turn on auto-fill-mode only for code comments
;(setq comment-auto-fill-only-comments t)

;; auto revert buffers
(global-auto-revert-mode t)
;; not output backtrace buffer when warning or errors
;(setq stack-trace-on-error t) ;; not needed

;; make it easy on eyes first ...
(set-foreground-color "Wheat")   ;; look ok
(set-background-color "DarkSlateGray")  ;; look ok
;(set-background-color "#55688a")  ;; from gmail theme
(set-cursor-color "Yellow")  ;; Yellow looks good
(set-mouse-color "Orchid")   ;; so so

;; none of these
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; line and column num
(global-linum-mode t)
(setq column-number-mode t)
(setq line-number-mode t)

;; default 70
(setq-default fill-column 80)

;; no need startup screen
(setq inhibit-startup-message t)

;; yank to cursor but not mouse point
(setq mouse-yank-at-point t)

;; add line at end of file
(setq require-final-newline t)

;; cursor and mouse point avoidance
(setq mouse-avoidance-mode 'animate)

;; C-K delete line at the same time
(setq-default kill-whole-line t)

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

;; other-window
(global-set-key "\M-q" 'other-window)

;; binding for previous/next-buffer
(global-set-key [f2]  'previous-buffer)
(global-set-key [f1]  'next-buffer)
(global-set-key [f12] 'kill-buffer)

;; code folding
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(global-set-key [f11] 'hs-hide-all)
(global-set-key [(shift f11)]  'hs-show-all)
(global-set-key [(control f11)] 'hs-toggle-hiding)

;; transposing text: M-t transpose-words
(global-set-key  (kbd "C-t") 'transpose-sexps)

;; anzu
(global-anzu-mode +1)

(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

;; ASCII
(require 'ascii)

;;start server
(require 'server)
(unless (server-running-p)
  (server-start))

;;----------------------------------------------------------------------------
;; Show a marker in the left fringe for lines not in the buffer
;;----------------------------------------------------------------------------
;(setq indicate-empty-lines t) ;设置了还是 nil, 用 set-default 可以，效果不显明，不用

;;mlj (define-ibuffer-column size-h
;;mlj     (:name "Size" :inline t)
;;mlj     (cond
;;mlj      ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
;;mlj      ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
;;mlj      (t (format "%8d" (buffer-size)))))

(provide 'customize-setting)
