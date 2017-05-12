;;; init-erc.el ---                                  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  monkboy

;; Author: monkboy <boyofmonk@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

;;; (require 'erc) 
;;; Sample ERC configuration
     
;; Load authentication info from an external source.  Put sensitive
;; passwords and the like in here.

;; This is an example of how to make a new command.  Type "/uptime" to
;; use it.
(defun erc-cmd-UPTIME (&rest ignore)
  "Display the uptime of the system, as well as some load-related
stuff, to the current ERC buffer."
  (let ((uname-output
         (replace-regexp-in-string
          ", load average: " "] {Load average} ["
          ;; Collapse spaces, remove
          (replace-regexp-in-string
           " +" " "
           ;; Remove beginning and trailing whitespace
           (replace-regexp-in-string
            "^ +\\|[ \n]+$" ""
            (shell-command-to-string "uptime"))))))
    (erc-send-message
     (concat "{Uptime} [" uname-output "]"))))

;; This causes ERC to connect to the Freenode network upon hitting
;; C-c e f.  Replace MYNICK with your IRC nick.
(global-set-key "\C-cef" (lambda () (interactive)
                           (erc :server "irc.freenode.net" :port "6667"
                                :nick "MYNICK")))

;; This causes ERC to connect to the IRC server on your own machine (if
;; you have one) upon hitting C-c e b.  Replace MYNICK with your IRC
;; nick.  Often, people like to run bitlbee (http://bitlbee.org/) as an
;; AIM/Jabber/MSN to IRC gateway, so that they can use ERC to chat with
;; people on those networks.
(global-set-key "\C-ceb" (lambda () (interactive)
                           (erc :server "localhost" :port "6667"
                                :nick "monkboy")))

;; Make C-c RET (or C-c C-RET) send messages instead of RET.  This has
;; been commented out to avoid confusing new users.
;; (define-key erc-mode-map (kbd "RET") nil)
;; (define-key erc-mode-map (kbd "C-c RET") 'erc-send-current-line)
;; (define-key erc-mode-map (kbd "C-c C-RET") 'erc-send-current-line)

;;; Options

;; Join the #emacs and #erc channels whenever connecting to Freenode.
(setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#erc")))

;; Rename server buffers to reflect the current network name instead
;; of SERVER:PORT (e.g., "freenode" instead of "irc.freenode.net:6667").
;; This is useful when using a bouncer like ZNC where you have multiple
;; connections to the same server.
(setq erc-rename-buffers t)

;; Interpret mIRC-style color commands in IRC chats
(setq erc-interpret-mirc-color t)

;; The following are commented out by default, but users of other
;; non-Emacs IRC clients might find them useful.
;; Kill buffers for channels after /part
;; (setq erc-kill-buffer-on-part t)
;; Kill buffers for private queries after quitting the server
;; (setq erc-kill-queries-on-quit t)
;; Kill buffers for server messages after quitting the server
;; (setq erc-kill-server-buffer-on-quit t)

(setq erc-log-channels-directory "~/.erc/logs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(provide 'init-erc)
;;; init-erc.el ends here
