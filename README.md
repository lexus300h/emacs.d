# emacs
  
## emacs refcard

[refcard](https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf)

## emacs for golang

### golang IDE

[golang IDEsAndTextEditorPlugins](https://github.com/golang/go/wiki/IDEsAndTextEditorPlugins)

### MELPA

[MELPA](https://melpa.org/#/getting-started)
```
Enable installation of packages from MELPA by adding an entry to package-archives after (require 'package) and before the call to package-initialize in your init.el or .emacs file:

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
To use the stable package repository instead of the default “bleeding-edge” repository, use this instead of "melpa":

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
```

### go-mode

[Install](https://github.com/dominikh/go-mode.el#installation)
```
M-x package-install [RET] go-mode [RET]
```

### auto-complete

```
M-x package-install [RET] auto-complete [RET]
```

### go-code

[Setup](https://github.com/nsf/gocode#setup)

```
export GOPATH=$HOME/goprojects
export PATH=$PATH:$GOPATH/bin

go get -u github.com/nsf/gocode
cp gocode/emacs/go-autocomplete.el ~/.emacs.d/lisp

Add these lines to your .emacs:

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
```

### flycheck

[flycheck](https://github.com/flycheck/flycheck)

```
M-x package-install RET flycheck

(add-hook 'after-init-hook #'global-flycheck-mode)
```
