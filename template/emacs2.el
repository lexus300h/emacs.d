;; http://blog.yufeng.info/archives/578
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
(setq default-fill-column 60)
 
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
(setq user-full-name "yufeng")
(setq user-mail-address "mryufeng@gmail.com")
 
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
 
 
;;erlang
;;(require 'erlang-eunit)
;;(load "erlang_appwiz" t nil)
(global-set-key [f3] 'erlang-next-error)
(global-set-key [C-f7] 'erlang-compile)
(global-set-key [f7] 'compile)
(global-set-key [f10] 'linum-mode)
 
;;distel
(add-to-list 'load-path "/usr/local/share/distel/elisp")
(require 'distel)
(distel-setup)
;; Some Erlang customizations
(add-hook 'erlang-mode-hook
        (lambda ()
              ;; when starting an Erlang shell in Emacs, default in the node name
`              (setq inferior-erlang-machine-options '("-sname" "emacs"))
              ;; add Erlang functions to an imenu menu
              (imenu-add-to-menubar "imenu")))
 
;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")
 
(add-hook 'erlang-shell-mode-hook
        (lambda ()
              ;; add some Distel bindings to the Erlang shell
              (dolist (spec distel-shell-keys)
                  (define-key erlang-shell-mode-map (car spec) (cadr spec)))))
 
 
;wrangler
(add-to-list 'load-path "/usr/local/share/wrangler/elisp")
(require 'wrangler)
 
 
;;ecb
(require 'xcscope)
(require 'cedet) ;;load cedet
(require 'ecb) ;;load ecb
 
(setq ecb-tip-of-the-day nil
inhibit-startup-message t
ecb-auto-compatibility-check nil
ecb-version-check nil)
 
(global-set-key [f12] 'ecb-activate)
(global-set-key [C-f12] 'ecb-deactivate)
(global-set-key [f11] 'delete-other-windows)
(global-set-key [(meta return)] 'semantic-ia-complete-symbol-menu)
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit-last)
(global-set-key (kbd "C-c s") 'ecb-goto-window-sources)
(global-set-key (kbd "C-c d") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c h") 'ecb-goto-window-history)
(global-set-key (kbd "C-c r") 'ecb-redraw-layout)
(global-set-key (kbd "C-.") 'cscope-find-global-definition-no-prompting)
(global-set-key (kbd "C-,") 'cscope-pop-mark)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.32")
 '(safe-local-variable-values (quote ((erlang-indent-level . 2)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
 
;;msf abbrev
(add-to-list 'load-path "~/emacs")
;; ensure abbrev mode is always on
(setq-default abbrev-mode t)
;; do not bug me about saving my abbreviations
(setq save-abbrevs nil)
;; load up modes I use
(require 'cc-mode)
;;(require 'perl-mode)
;;(require 'cperl-mode)
;;(require 'sh-script)
;;(require 'shell)
;;(require 'lua-mode)   
;;(require 'erlang)
;; load up abbrevs for these modes
(require 'msf-abbrev)
(setq msf-abbrev-verbose t) ;; optional
(setq msf-abbrev-root "~/emacs/mode-abbrevs")
(global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
(global-set-key (kbd "C-c a") 'msf-abbrev-define-new-abbrev-this-mode)
(msf-abbrev-load)
 
;;go mode
(require 'go-mode-load)
(require 'tramp)
 
;;gud
(add-hook 'gdb-mode-hook '(lambda ()
                            (define-key c-mode-base-map [(f5)] 'gud-go)
                            (define-key c-mode-base-map [(f7)] 'gud-step)
                            (define-key c-mode-base-map [(f8)] 'gud-next)))
 
 
(defvar no-easy-keys-minor-mode-map (make-keymap)
  "no-easy-keys-minor-mode keymap.")
(let ((f (lambda (m)
           `(lambda () (interactive)
              (message (concat "No! use " ,m " instead."))))))
  (dolist (l '(("<left>" . "C-b") ("<right>" . "C-f") ("<up>" . "C-p")
               ("<down>" . "C-n")
               ("<C-left>" . "M-f") ("<C-right>" . "M-b") ("<C-up>" . "M-{")
               ("<C-down>" . "M-}")
               ("<M-left>" . "M-f") ("<M-right>" . "M-b") ("<M-up>" . "M-{")
               ("<M-down>" . "M-}")
               ("<delete>" . "C-d") ("<C-delete>" . "M-d")
               ("<M-delete>" . "M-d") ("<next>" . "C-v") ("<C-next>" . "M-x <")
               ("<prior>" . "M-v") ("<C-prior>" . "M-x >")
               ("<home>" . "C-a") ("<C-home>" . "M->")
               ("<C-home>" . "M-<") ("<end>" . "C-e") ("<C-end>" . "M->")))
    (define-key no-easy-keys-minor-mode-map
      (read-kbd-macro (car l)) (funcall f (cdr l)))))
(define-minor-mode no-easy-keys-minor-mode
  "A minor mode that disables the arrow-keys, pg-up/down, delete
  and backspace."  t " no-easy-keys"
  'no-easy-keys-minor-mode-map :global t)
(no-easy-keys-minor-mode 1)
 
 
 
(require 'smex)
(smex-initialize)
 
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
 
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
 
(setq transient-mark-mode t) ; highlight text selection
(setq delete-selection-mode t) ; delete seleted text when typing
 
; highlight current line
(require 'hl-line)
(global-hl-line-mode t)

