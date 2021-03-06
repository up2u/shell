;; add load path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete/")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete/lib/fuzzy/")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete/lib/popup/")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete-clang/")
(add-to-list 'load-path "~/.emacs.d/lisp/cedet-git/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/cedet-git/lisp/cedet/")
(add-to-list 'load-path "~/.emacs.d/lisp/cedet-git/lisp/eieio/")
(add-to-list 'load-path "~/.emacs.d/lisp/cedet-git/contrib/")
(add-to-list 'load-path "~/.emacs.d/lisp/org/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/org/contrib/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet/")
(add-to-list 'load-path "~/.emacs.d/lisp/util/")

;;customize defined variable to storing path
(defconst my-emacs-path "~/.emacs.d/")
(defconst my-emacs-lisps-path (concat my-emacs-path "lisp"))

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("tromeyelpa" . "http://tromey.com/elpa/"))

;; basic initialization, (require) non-ELPA packages, etc.
(setq package-enable-at-startup nil)
(package-initialize)
;; (require) your ELPA packages, configure them as normal

;; 增加更丰富的高亮
(require 'generic-x)


;; 显示行号，并根据是否空行和文件行的语法加亮显示不同的数字颜色
; (require 'setnu+) ; 没有效果？

;; for fix function gensym is void
(require 'cl)

;; org version org
(require 'org-install)
;;;     (global-set-key "\C-cl" 'org-store-link)
;;;     (global-set-key "\C-cc" 'org-capture)
;;;     (global-set-key "\C-ca" 'org-agenda)
;;;     (global-set-key "\C-cb" 'org-iswitchb)
;; http://www.codewaysky.com/archives/412.html
(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/org"
         :base-extension "org"
         :publishing-directory "~/org/exports"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
         :style "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/stylesheet.css\" />"
         )
        ("org-static"
         :base-directory "~/org"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|doc\\|xls\\|ppt\\|rar\\|tar.gz\\|tar\\|gz\\|zip\\|cpp\\|c\\|el"
         :publishing-directory "~/org/exports"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))
        ))

; dired+
; http://www.emacswiki.org/emacs/dired%2b.el
; bugs when use f1 (binding to next-buffer, so comment it)
;(require 'dired+)

;; key swap
(require 'key-swap)

;; google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; shell,perl... mode: always space but not TAB
(add-hook 'sh-mode-hook
		  '(lambda ()
			 (setq indent-tabs-mode nil)))
(add-hook 'perl-mode-hook
		  '(lambda ()
			 (setq indent-tabs-mode nil)))

;; ctypes
(require 'ctypes)
(ctypes-auto-parse-mode 1)

;; for assembly language
;; comment: it use Assembler mode default, more beautiful than gas-mode
;(require 'gas-mode)

;; for color-name-to-rgb used in tabbar-ruler
(require 'color)

;; tabbar + tabbar-ruler
(require 'tabbar)
;; tabbar-ruler, make tabbar look pretty
(require 'tabbar-ruler)
(tabbar-mode t)
(define-prefix-command 'lwindow-map)
;(global-set-key (kbd "<M-left>")  'tabbar-backward) ;; will cross group ?
;(global-set-key (kbd "<M-right>") 'tabbar-forward)
(global-set-key (kbd "<M-left>")  'tabbar-backward-tab) ;;will not cross group ?
(global-set-key (kbd "<M-right>") 'tabbar-forward-tab)
(global-set-key (kbd "<M-up>")    'tabbar-backward-group)
(global-set-key (kbd "<M-down>")  'tabbar-forward-group)

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

;; cscope
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
;(which-func-mode 1) ;; obselete
(which-function-mode 1)

;; for letrec required in yasnippet
(require 'letrec)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete-settings
(require 'auto-complete-settings)
(ac-config-default)
;; a issue like below:
;; http://stackoverflow.com/questions/15774807/emacs-24-autocomplete-yasnippet
;; just temporary workaround
;(setq ac-source-yasnippet nil) ;; no error when now !?, so comment it, and auto-complete get more candidates !

;; use auto-complete-clang-async
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/lisp/emacs-clang-complete-async/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

;;mlj ;; auto-complete-clang
;;mlj (require 'auto-complete-clang)
;;mlj (setq ac-clang-auto-save t)  ; is my clang an old version for it ?
;;mlj
;;mlj (setq ac-auto-start t)
;;mlj (setq ac-quick-help-delay 0.5)
;;mlj ;; (ac-set-trigger-key "TAB")
;;mlj ;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;;mlj (defun my-ac-config ()
;;mlj   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;mlj   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;mlj   ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;mlj   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;mlj   (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;mlj   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;mlj   (global-auto-complete-mode t))
;;mlj (defun my-ac-cc-mode-setup ()
;;mlj   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;;mlj (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;;mlj ;; ac-source-gtags
;;mlj (my-ac-config)
;;mlj
;;mlj (setq ac-clang-flags
;;mlj       (mapcar (lambda (item)(concat "-I" item))
;;mlj               (split-string
;;mlj                "
;;mlj /usr/lib/gcc/i686-redhat-linux/4.4.7/../../../../include/c++/4.4.7
;;mlj /usr/lib/gcc/i686-redhat-linux/4.4.7/../../../../include/c++/4.4.7/i686-redhat-linux
;;mlj /usr/lib/gcc/i686-redhat-linux/4.4.7/../../../../include/c++/4.4.7/backward
;;mlj /usr/local/include
;;mlj /usr/lib/gcc/i686-redhat-linux/4.4.7/include
;;mlj /usr/include
;;mlj "
;;mlj                )))

; To auto-start Smex every time you open Emacs add these lines to your .emacs file:
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
; Bind some keys
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;;mlj now in emacs24.3 can expand to windows also

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

;; Emacs才是世界上最强大的IDE － 智能的改变光标形状
;; http://emacser.com/cursor-change.htm
(require 'cursor-change)
(cursor-change-mode 1)

;; Warning:cedet-called-interactively-p called with 0 arguments, but requires 1
(setq byte-compile-warnings nil)
(require 'cedet)
(require 'cedet-m3)
(require 'cedet-contrib)
;(require 'semantic)
;(require 'eieio)
;(require 'ede)
;(require 'srecode)

(require 'semantic/canned-configs)
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
;(semantic-show-unmatched-syntax-mode nil) ;;烦人的下底红线
;(global-srecode-minor-mode 1)  ;; need to learn more.
;(require 'semantic-tag-folding nil 'noerror)  ;; mlj
(require 'semantic-tag-folding)  ;; mlj now just require and no error
;(global-semantic-tag-folding-mode 1) ;; 设置了查看，还是 nil, 所以注释掉
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode) ;; 用来表示c一个函数块的左边的倒三角的？
;; from http://emacser.com/cedet.htm
;;;;;(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
;;;;;(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
;;;;;(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
;;;;;(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)

;; manual fresh
;; when update cedet 2.0, no this function, and not know alternative function
;; so temporary comment it
;(global-set-key [(control f1)] 'senator-force-refresh)

;; hide and show macro #ifdef #endif
(add-hook 'c-mode-hook
          '(lambda ()
             (hide-ifdef-mode t)))
(add-hook 'c++-mode-hook
          '(lambda ()
             (hide-ifdef-mode t)))
(global-set-key [f10] 'hide-ifdef-block)
(global-set-key [(shift f10)] 'show-ifdef-block)

;; highlight-symbol for highlight variable
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)  ;; go to next symbol
(global-set-key [(shift f3)] 'highlight-symbol-prev) ;; go prev
;(global-set-key [(meta f3)] 'highlight-symbol-prev) ;; comment for don't use meta key
;; auto-highlight-symbol
;(require 'auto-highlight-symbol-config)

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

;; SLIME: The Superior Lisp Interaction Mode for Emacs
;(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
;(require 'slime)
;(slime-setup '(slime-fancy))

;; AUCTeX
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))

; 在 LaTeX mode 中，默认开启 PDF mode，即默认使用 xelatex 直接生成 pdf 文
; 件，而不用每次用 'C-c C-t C-p' 进行切换。设置 'Tex-show-compilation' 为
; t，在另一个窗口显示编译信息，对于错误的排除很方便。另外，编译时默认直接
; 保存文件，绑定补全符号到 TAB 键。
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))

;; undo
;(require 'undo-tree)   ;不好用??
;(global-undo-tree-mode)

;; go-to-char http://www.emacswiki.org/emacs/iy-go-to-char.el
(require 'iy-go-to-char)
;(global-set-key (kbd "C-;") 'iy-go-to-char)
;; not used key binding
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
;(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
;(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

;; magit
(require 'magit)

;; load my util
(require 'myutil)

;; load customize setting
(require 'customize-setting)

;; wcy desktop
(require 'wcy-desktop)
(wcy-desktop-init)
