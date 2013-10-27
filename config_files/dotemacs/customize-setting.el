
;; user name and email
(setq user-full-name "毛礼杰")
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

(provide 'customize-setting)
