
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (browse-kill-ring tabbar flycheck auto-complete go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

;; add load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; set exec path
(when window-system (set-exec-path-from-shell-PATH))

;; set go env var
(setenv "GOPATH" "/home/monkboy/Workspace/Go")

;; enable golang auto complete
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; enable syntax checking with Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
;; add hook gofmt before save
(add-hook 'before-save-hook #'gofmt-before-save) 

;; ==================== fill-column-indicator
;; 显示80行的标线
(require 'fill-column-indicator)
(define-globalized-minor-mode my-global-fci-mode fci-mode turn-on-fci-mode)
(my-global-fci-mode 1)
(setq fci-rule-width 2)
(setq fci-rule-color "yellow")
(setq fci-rule-column 80)

; highlight current line
(require 'hl-line)
(global-hl-line-mode t)
(set-face-background hl-line-face "gray18")

;;(keyboard-translate ?\C-h ?\C-?)
(defalias 'yes-or-no-p 'y-or-n-p)
 
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S")
(add-hook 'write-file-hooks 'time-stamp)
 
(global-set-key [f2] 'rgrep)
(global-set-key [(f5)] 'eshell)
(global-set-key [C-f5] 'shell)
(global-set-key (kbd "M-3") 'capitalize-word)
 
(global-set-key [f6] 'find-file)
(global-set-key [C-Z] nil)
(global-set-key [C-f4] 'kill-this-buffer)
 
(global-set-key [(f4)] 'ibuffer)
(global-set-key [(f8)] 'other-window)
 
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-initialize)
(color-theme-dark-blue2)
(setq font-lock-verbose t)
;;(set-default-font "Bitstream Vera Sans Mono-12")
(global-font-lock-mode t)
(tool-bar-mode -1)
(setq column-number-mode t)
(setq display-battery-mode t)
(setq size-indication-mode t)
(setq default-major-mode 'outline-mode)
(add-hook 'outline-mode-hook 'turn-off-auto-fill)

(setq transient-mark-mode t)
(setq-default shell-cd-regexp nil)
(setq-default shell-pushd-regexp nil)
(setq-default shell-popd-regexp nil)
(setq inhibit-startup-message t)
(setq visible-bell t)
(setq mouse-yank-at-point t)
(setq kill-ring-max 100)
(setq default-fill-column 80)
 
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-o") 'ff-find-related-file)
 
(setq require-final-newline t)
 

(setq track-eol t)
 
(setq gnus-inhibit-startup-message t)
 
(setq enable-recursive-minibuffers t)
(setq auto-save-mode nil)
(setq Man-notify-method 'pushy)
 
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
 
(tool-bar-mode -1)
(customize-set-variable 'scroll-bar-mode 'right)
 
 
(setq speedbar-show-unknown-files t)
(setq speedbar-update-flag nil)
(setq speedbar-use-images nil)
(setq speedbar-verbosity-level 0)
(global-set-key [f9] 'speedbar)
 
;; set paren mode
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'animate)
 
;; set the default username and email
(setq user-full-name "monkboy")
(setq user-mail-address "boyofmonk@gmail.com")
 
;; set the title name
(setq frame-title-format "Emacs - %f")
 
;;-------------------------Shell 使用 ansi color-------------
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
 
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

;;
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(require 'ido)
(ido-mode t)

;;-------------------------让Emacs拥有tabs-------------------
(require 'tabbar)
(setq tabbar-buffer-groups-function
          (lambda ()
            (list "All")))
 
(tabbar-mode)
(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)] 'tabbar-forward)
(global-set-key (kbd "M-1") 'tabbar-backward)
(global-set-key (kbd "M-2") 'tabbar-forward)

;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)
;;(load "desktop")
;;(desktop-load-default)
;;(desktop-read)
;;(setq desktop-save-mode t)
 
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
