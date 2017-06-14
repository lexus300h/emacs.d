;; init.el
;; 把目录lisp/添加到搜索路径中去


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list
    'load-path 
    (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path
    (expand-file-name "ecb" user-emacs-directory))
(add-to-list 'load-path
    (expand-file-name "cscope-15.8b" user-emacs-directory))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

;; set exec path
(when window-system (set-exec-path-from-shell-PATH))

;; 下面每一个被require的feature都对应一个lisp/目录下的同名
;; elisp文件，例如init-utils.el、init-elpa.el
(require 'init-elpa)    ;; 加载ELPA，并定义了require-package函数
(require 'init-auto-insert)
(require 'init-edit-util)
(require 'init-golang)
(require 'init-erc) 
(require 'ecb)
(require 'xcscope)

